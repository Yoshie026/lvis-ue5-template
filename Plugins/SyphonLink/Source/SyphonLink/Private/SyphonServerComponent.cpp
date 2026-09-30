#include "SyphonServerComponent.h"
#include "Engine/TextureRenderTarget2D.h"
#include "Engine/GameViewportClient.h"
#include "Engine/LocalPlayer.h"
#include "Engine/World.h"
#include "Camera/PlayerCameraManager.h"
#include "GameFramework/PlayerController.h"
#include "CanvasTypes.h"
#include "EngineModule.h"
#include "LegacyScreenPercentageDriver.h"
#include "RendererInterface.h"
#include "SceneInterface.h"
#include "SceneView.h"
#include "SceneViewExtension.h"
#include "RenderingThread.h"
#include "ImageUtils.h"
#include "Engine/LevelStreaming.h"
#include "Styling/CoreStyle.h"
#include "Widgets/Layout/SBox.h"
#include "Widgets/Layout/SScaleBox.h"
#include "Widgets/Text/STextBlock.h"
#include "UnrealClient.h"
#include "Misc/Paths.h"
#if PLATFORM_MAC
#include "SyphonServerBridge.h"
#endif

// Debug: compare the Syphon output against the engine's own player view
static TAutoConsoleVariable<int32> CVarSyphonForceRenderAppWindow(
    TEXT("syphon.ForceRenderAppWindow"), 0,
    TEXT("1 = render the 3D scene in the app window too, whatever bRenderAppWindow says."));
static TAutoConsoleVariable<int32> CVarSyphonSkipOutputView(
    TEXT("syphon.SkipOutputView"), 0,
    TEXT("1 = don't render the Syphon output view (debugging)."));
static TAutoConsoleVariable<float> CVarSyphonDumpFrameAtTime(
    TEXT("syphon.DumpFrameAtTime"), 0.f,
    TEXT("When > 0: at this many seconds of real time, save the Syphon frame (and a window screenshot) to Saved/Syphon."));

USyphonServerComponent::USyphonServerComponent()
{
   PrimaryComponentTick.bCanEverTick = true;
}

void USyphonServerComponent::AddReferencedObjects(UObject *InThis, FReferenceCollector &Collector)
{
   USyphonServerComponent *This = CastChecked<USyphonServerComponent>(InThis);
   if (FSceneViewStateInterface *Ref = This->ViewState.GetReference())
   {
      Ref->AddReferencedObjects(Collector);
   }
   Super::AddReferencedObjects(This, Collector);
}

void USyphonServerComponent::GetResolution(int32 &OutW, int32 &OutH) const
{
   switch (Resolution)
   {
   case ESyphonResolution::R720p:
      OutW = 1280;
      OutH = 720;
      break;
   case ESyphonResolution::R1080p:
      OutW = 1920;
      OutH = 1080;
      break;
   case ESyphonResolution::R1440p:
      OutW = 2560;
      OutH = 1440;
      break;
   case ESyphonResolution::R4K:
      OutW = 3840;
      OutH = 2160;
      break;
   }
}

void USyphonServerComponent::StartServer()
{
#if PLATFORM_MAC
   if (PostActorTickHandle.IsValid())
   {
      return;
   }
   UWorld *World = GetWorld();
   if (!World || !World->Scene)
   {
      return;
   }

   FSyphonServerBridge::Start(ServerName);

   int32 W, H;
   GetResolution(W, H);

   // Plain (non-sRGB) RGBA8 holding display-encoded pixels, exactly like a window. Render targets
   // default to linear gamma, so TargetGamma makes the renderer apply the display curve (without it
   // the output is linear and looks far too dark in Syphon clients)
   PublishTarget = NewObject<UTextureRenderTarget2D>(this);
   PublishTarget->RenderTargetFormat = RTF_RGBA8;
   PublishTarget->TargetGamma = 2.2f;
   PublishTarget->ClearColor = FLinearColor::Black;
   PublishTarget->InitAutoFormat(W, H);
   PublishTarget->UpdateResourceImmediate(true);

   // The Water plugin stops updating its water info texture while the game window has world
   // rendering disabled, but the world is still rendered here, so keep it updating
   if (IConsoleVariable *CVar = IConsoleManager::Get().FindConsoleVariable(TEXT("r.Water.SkipWaterInfoTextureRenderWhenWorldRenderingDisabled")))
   {
      CVar->Set(0, ECVF_SetByCode);
   }

   ViewState.Allocate(World->GetFeatureLevel());
   PostActorTickHandle = FWorldDelegates::OnWorldPostActorTick.AddUObject(this, &USyphonServerComponent::OnWorldPostActorTick);
#endif
}

void USyphonServerComponent::StopServer()
{
#if PLATFORM_MAC
   if (!PostActorTickHandle.IsValid())
   {
      return;
   }
   FWorldDelegates::OnWorldPostActorTick.Remove(PostActorTickHandle);
   PostActorTickHandle.Reset();

   UpdateAppWindowRendering(true);
   UpdateWindowOverlay(false);
   if (UWorld *World = GetWorld())
   {
      if (UGameViewportClient *GameViewport = World->GetGameViewport(); GameViewport && SceneNameOverlay.IsValid())
      {
         GameViewport->RemoveViewportWidgetContent(SceneNameOverlay.ToSharedRef());
      }
   }
   SceneNameOverlay.Reset();

   // Let any in-flight render/publish finish before the target and server go away
   FlushRenderingCommands();
   ViewState.Destroy();
   PublishTarget = nullptr;
   FSyphonServerBridge::Stop();
#endif
}

void USyphonServerComponent::BeginPlay()
{
   Super::BeginPlay();
   if (bEnabled)
   {
      StartServer();
   }
}

void USyphonServerComponent::EndPlay(const EEndPlayReason::Type Reason)
{
   StopServer();
   Super::EndPlay(Reason);
}

void USyphonServerComponent::TickComponent(float DeltaTime, ELevelTick TickType,
                                           FActorComponentTickFunction *ThisTickFunction)
{
   Super::TickComponent(DeltaTime, TickType, ThisTickFunction);
#if PLATFORM_MAC
   // Started with Syphon off: start publishing once it's switched on, and keep the standalone
   // window clean meanwhile (once running, OnWorldPostActorTick handles both states)
   if (!PostActorTickHandle.IsValid())
   {
      if (bEnabled)
      {
         StartServer();
      }
      else
      {
         UpdateWindowOverlay(false);
      }
   }

   if (bShowDebug && GEngine && PostActorTickHandle.IsValid())
   {
      int32 W, H;
      GetResolution(W, H);
      GEngine->AddOnScreenDebugMessage(1, 0.f, bEnabled ? FColor::Green : FColor::Yellow,
                                       FString::Printf(TEXT("SyphonServer %s | player view %dx%d | window 3D %s"),
                                                       bEnabled ? TEXT("publishing") : TEXT("paused"), W, H,
                                                       bRenderAppWindow ? TEXT("on") : TEXT("off")));
   }
#endif
}

void USyphonServerComponent::OnWorldPostActorTick(UWorld *InWorld, ELevelTick TickType, float DeltaSeconds)
{
   if (InWorld == GetWorld())
   {
      // Runs before the window draws this frame, so a runtime bRenderAppWindow toggle applies at once
      UpdateAppWindowRendering(bRenderAppWindow || CVarSyphonForceRenderAppWindow.GetValueOnGameThread() != 0 || !bEnabled || GIsEditor);
      UpdateWindowOverlay(bEnabled);
      if (bEnabled && CVarSyphonSkipOutputView.GetValueOnGameThread() == 0)
      {
         RenderOutputView();
      }

      // Once per requested time (resetting the cvar can't override a value set on the command line)
      static float LastDumpAt = 0.f;
      const float DumpAt = CVarSyphonDumpFrameAtTime.GetValueOnGameThread();
      if (DumpAt > 0.f && DumpAt != LastDumpAt && InWorld->GetRealTimeSeconds() >= DumpAt && PublishTarget)
      {
         LastDumpAt = DumpAt;
         const FString Dir = FPaths::ProjectSavedDir() / TEXT("Syphon");
         FImage Image;
         if (FImageUtils::GetRenderTargetImage(PublishTarget, Image))
         {
            FImageUtils::SaveImageByExtension(*(Dir / TEXT("SyphonFrame.png")), Image);
         }
         FScreenshotRequest::RequestScreenshot(Dir / TEXT("WindowFrame.png"), false, false);
         UE_LOG(LogTemp, Display, TEXT("SyphonServer: dumped frames to %s"), *Dir);
      }
   }
}

void USyphonServerComponent::UpdateAppWindowRendering(bool bRender)
{
   UWorld *World = GetWorld();
   UGameViewportClient *GameViewport = World ? World->GetGameViewport() : nullptr;
   if (!GameViewport)
   {
      return;
   }
   GameViewport->bDisableWorldRendering = !bRender;

   const TArray<ULocalPlayer *> &Players = GEngine->GetGamePlayers(GameViewport);
   if (!bRender)
   {
      // Skipping the window's render isn't enough: it would still set up its player view, and the
      // Water plugin renders its water info texture along with whichever player view sets up first.
      // A zero-size player makes ULocalPlayer::CalcSceneView bail out, so only our view is set up.
      for (ULocalPlayer *Player : Players)
      {
         if (Player)
         {
            Player->Size = FVector2D::ZeroVector;
         }
      }
   }
   else if (Players.Num() > 0 && Players[0] && Players[0]->Size.IsZero())
   {
      GameViewport->LayoutPlayers();
   }
}

FString USyphonServerComponent::FindCurrentSceneName() const
{
   // The newest streamed-in level that is staying loaded (the old one is marked for unload
   // during a scene change); its world asset is the original map, e.g. Scene_01
   const UWorld *World = GetWorld();
   const ULevelStreaming *Current = nullptr;
   if (World)
   {
      for (const ULevelStreaming *Streaming : World->GetStreamingLevels())
      {
         if (Streaming && Streaming->ShouldBeLoaded() && Streaming->IsLevelVisible())
         {
            Current = Streaming;
         }
      }
   }
   return Current ? Current->GetWorldAsset().GetAssetName() : FString();
}

void USyphonServerComponent::UpdateWindowOverlay(bool bPublishingNow)
{
   UWorld *World = GetWorld();
   UGameViewportClient *GameViewport = World ? World->GetGameViewport() : nullptr;
   if (GIsEditor || !GameViewport)
   {
      return;
   }

   // Scene name, centered on the black window while publishing
   if (bShowSceneNameWhilePublishing && !SceneNameOverlay.IsValid())
   {
      TWeakObjectPtr<USyphonServerComponent> WeakThis(this);
      SceneNameOverlay =
          SNew(SScaleBox)
              .Stretch(EStretch::ScaleToFit)
              .StretchDirection(EStretchDirection::DownOnly)
              .Visibility(EVisibility::Collapsed)
                  [SNew(SBox)
                       .HAlign(HAlign_Center)
                       .VAlign(VAlign_Center)
                       .Padding(FMargin(24.f))
                           [SNew(STextBlock)
                                .Font(FCoreStyle::GetDefaultFontStyle("Bold", SceneNameFontSize))
                                .ColorAndOpacity(FLinearColor(1.f, 1.f, 1.f, 0.85f))
                                .Text_Lambda([WeakThis]()
                                             { return FText::FromString(WeakThis.IsValid() ? WeakThis->CurrentSceneName : FString()); })]];
      GameViewport->AddViewportWidgetContent(SceneNameOverlay.ToSharedRef(), 10);
   }
   if (SceneNameOverlay.IsValid())
   {
      if (bPublishingNow)
      {
         CurrentSceneName = FindCurrentSceneName();
      }
      const bool bShow = bPublishingNow && bShowSceneNameWhilePublishing && !CurrentSceneName.IsEmpty();
      SceneNameOverlay->SetVisibility(bShow ? EVisibility::HitTestInvisible : EVisibility::Collapsed);
   }

   // Standalone (Syphon off): keep the window clean - no stat overlays, no on-screen debug text.
   // Stats enabled meanwhile (e.g. by a Blueprint "stat fps") are cleared every frame; the ones
   // that were showing come back when publishing resumes.
   if (!bPublishingNow)
   {
      if (!bStandaloneClean)
      {
         const TArray<FString> *Enabled = GameViewport->GetEnabledStats();
         StatsHiddenForStandalone = Enabled ? *Enabled : TArray<FString>();
         bDebugMessagesBeforeStandalone = GEngine->bEnableOnScreenDebugMessages;
         bStandaloneClean = true;
      }
      const TArray<FString> *Enabled = GameViewport->GetEnabledStats();
      if (Enabled && Enabled->Num() > 0)
      {
         GameViewport->SetEnabledStats(TArray<FString>());
      }
      GEngine->bEnableOnScreenDebugMessages = false;
   }
   else if (bStandaloneClean)
   {
      GameViewport->SetEnabledStats(StatsHiddenForStandalone);
      GEngine->bEnableOnScreenDebugMessages = bDebugMessagesBeforeStandalone;
      bStandaloneClean = false;
   }
}

void USyphonServerComponent::RenderOutputView()
{
#if PLATFORM_MAC
   UWorld *World = GetWorld();
   APlayerController *PC = World ? World->GetFirstPlayerController() : nullptr;
   ULocalPlayer *LocalPlayer = PC ? PC->GetLocalPlayer() : nullptr;
   FTextureRenderTargetResource *Target = PublishTarget ? PublishTarget->GameThread_GetRenderTargetResource() : nullptr;
   if (!LocalPlayer || !PC->PlayerCameraManager || !Target || !World->Scene)
   {
      return;
   }

   int32 W, H;
   GetResolution(W, H);
   const FIntRect ViewRect(0, 0, W, H);

   // Same viewpoint the game window uses (the active ProtoCam / view target), already
   // updated for this frame since we run after all actors and the camera have ticked
   FMinimalViewInfo ViewInfo = PC->PlayerCameraManager->GetCameraCacheView();

   FSceneViewFamilyContext ViewFamily(FSceneViewFamily::ConstructionValues(Target, World->Scene, FEngineShowFlags(ESFIM_Game))
                                          .SetTime(World->GetTime())
                                          .SetRealtimeUpdate(true));
   // Not a scene capture: the Water plugin (and GPU particles) only render into player views
   // Main view family only when the window isn't rendering its own (main) one
   ViewFamily.bIsMainViewFamily = !bRenderAppWindow && !GIsEditor;
   ViewFamily.ViewExtensions = GEngine->ViewExtensions->GatherActiveExtensions(FSceneViewExtensionContext(World->Scene));
   for (const FSceneViewExtensionRef &Ext : ViewFamily.ViewExtensions)
   {
      Ext->SetupViewFamily(ViewFamily);
   }

   FSceneViewInitOptions ViewInitOptions;
   ViewInitOptions.SetViewRectangle(ViewRect);
   ViewInitOptions.ViewFamily = &ViewFamily;
   ViewInitOptions.ViewOrigin = ViewInfo.Location;
   ViewInitOptions.ViewRotationMatrix = FInverseRotationMatrix(ViewInfo.Rotation) * FMatrix(
                                            FPlane(0, 0, 1, 0),
                                            FPlane(1, 0, 0, 0),
                                            FPlane(0, 1, 0, 0),
                                            FPlane(0, 0, 0, 1));
   FMinimalViewInfo::CalculateProjectionMatrixGivenViewRectangle(ViewInfo, AspectRatio_MaintainXFOV, ViewRect, ViewInitOptions);
   ViewInitOptions.ViewLocation = ViewInfo.Location;
   ViewInitOptions.ViewRotation = ViewInfo.Rotation;
   ViewInitOptions.FOV = ViewInfo.FOV;
   ViewInitOptions.DesiredFOV = ViewInfo.DesiredFOV;
   ViewInitOptions.bUseFieldOfViewForLOD = ViewInfo.bUseFieldOfViewForLOD;
   ViewInitOptions.SceneViewStateInterface = ViewState.GetReference();
   ViewInitOptions.ViewActor = PC->GetViewTarget();
   ViewInitOptions.PlayerIndex = 0; // shares player 0's water zone data with the window's view
   ViewInitOptions.bInCameraCut = PC->PlayerCameraManager->bGameCameraCutThisFrame;
   if (PC->PlayerCameraManager->bEnableFading)
   {
      ViewInitOptions.OverlayColor = PC->PlayerCameraManager->FadeColor;
      ViewInitOptions.OverlayColor.A = FMath::Clamp(PC->PlayerCameraManager->FadeAmount, 0.0f, 1.0f);
   }
   PC->BuildHiddenComponentList(ViewInfo.Location, ViewInitOptions.HiddenPrimitives);

   FSceneView *View = new FSceneView(ViewInitOptions);
   View->PreviousViewTransform = ViewInfo.PreviousViewTransform;
   ViewFamily.Views.Add(View);

   // Post process blending as in ULocalPlayer::CalcSceneView: volumes, camera, then overrides
   View->StartFinalPostprocessSettings(ViewInfo.Location);
   const TArray<FPostProcessSettings> *PPSettings = nullptr;
   const TArray<float> *PPWeights = nullptr;
   const TArray<EViewTargetBlendOrder> *PPOrders = nullptr;
   PC->PlayerCameraManager->GetCachedPostProcessBlends(PPSettings, PPWeights, PPOrders);
   for (int32 i = 0; i < PPWeights->Num(); ++i)
   {
      if ((*PPOrders)[i] == VTBlendOrder_Base)
      {
         View->OverridePostProcessSettings((*PPSettings)[i], (*PPWeights)[i]);
      }
   }
   View->OverridePostProcessSettings(ViewInfo.PostProcessSettings, ViewInfo.PostProcessBlendWeight);
   for (int32 i = 0; i < PPWeights->Num(); ++i)
   {
      if ((*PPOrders)[i] == VTBlendOrder_Override)
      {
         View->OverridePostProcessSettings((*PPSettings)[i], (*PPWeights)[i]);
      }
   }
   View->EndFinalPostprocessSettings(ViewInitOptions);

   for (const FSceneViewExtensionRef &Ext : ViewFamily.ViewExtensions)
   {
      Ext->SetupView(ViewFamily, *View);
   }

   // Full resolution: the output size is the Syphon resolution, independent of the window
   ViewFamily.SetScreenPercentageInterface(new FLegacyScreenPercentageDriver(ViewFamily, 1.0f));

   FCanvas Canvas(Target, nullptr, World, World->GetFeatureLevel());
   GetRendererModule().BeginRenderingViewFamily(&Canvas, &ViewFamily);

   const FIntPoint Size(W, H);
   ENQUEUE_RENDER_COMMAND(SyphonPublish)(
       [Target, Size](FRHICommandListImmediate &RHICmdList)
       {
          FRHITexture *Tex = Target->GetRenderTargetTexture();
          if (!Tex)
          {
             return;
          }
          void *Native = Tex->GetNativeResource();
          // Run on the RHI thread so the view's rendering has been submitted first
          RHICmdList.EnqueueLambda(TEXT("SyphonPublish"), [Native, Size](FRHICommandListBase &)
                                   { FSyphonServerBridge::PublishTexture(Native, Size.X, Size.Y); });
       });
#endif
}

void USyphonServerComponent::SetServerName(const FString &NewName)
{
   ServerName = NewName;
#if PLATFORM_MAC
   if (PostActorTickHandle.IsValid()) // running -> restart under the new name
   {
      FlushRenderingCommands();
      FSyphonServerBridge::Stop();
      FSyphonServerBridge::Start(ServerName);
   }
#endif
}

void USyphonServerComponent::HideAppWindow()
{
#if PLATFORM_MAC
   FSyphonServerBridge::HideApp();
#endif
}

void USyphonServerComponent::ShowAppWindow()
{
#if PLATFORM_MAC
   FSyphonServerBridge::ShowApp();
#endif
}
