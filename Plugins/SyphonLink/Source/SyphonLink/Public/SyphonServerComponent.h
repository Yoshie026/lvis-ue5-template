#pragma once
#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "SceneTypes.h"
#include "SyphonServerComponent.generated.h"

UENUM(BlueprintType)
enum class ESyphonResolution : uint8
{
   R720p UMETA(DisplayName = "1280 x 720"),
   R1080p UMETA(DisplayName = "1920 x 1080"),
   R1440p UMETA(DisplayName = "2560 x 1440"),
   R4K UMETA(DisplayName = "3840 x 2160")
};

UCLASS(ClassGroup = (Rendering), meta = (BlueprintSpawnableComponent))
class SYPHONLINK_API USyphonServerComponent : public UActorComponent
{
   GENERATED_BODY()
public:
   USyphonServerComponent();

   UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Syphon")
   FString ServerName = TEXT("UE5 Output");

   UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Syphon")
   bool bEnabled = true;

   UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Syphon")
   TObjectPtr<AActor> CameraActor;

   UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Syphon")
   ESyphonResolution Resolution = ESyphonResolution::R1080p;

   UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Syphon")
   bool bShowDebug = false;

   // Also render the 3D scene in the app window (packaged game only; the editor always does).
   // Syphon output does not depend on it, so leave off to spend the whole GPU on the output.
   UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Syphon")
   bool bRenderAppWindow = false;

   UFUNCTION(BlueprintCallable, Category = "Syphon")
   void StartServer();
   UFUNCTION(BlueprintCallable, Category = "Syphon")
   void StopServer();

   UFUNCTION(BlueprintCallable, Category = "Syphon")
   void SetCamera(AActor *NewCamera) { CameraActor = NewCamera; }

   UFUNCTION(BlueprintCallable, Category = "Syphon")
   void SetServerName(const FString &NewName);

   UFUNCTION(BlueprintCallable, Category = "Syphon")
   void HideAppWindow();
   UFUNCTION(BlueprintCallable, Category = "Syphon")
   void ShowAppWindow();

   // Reports the output view state's pooled post-process MIDs to GC (as ULocalPlayer does);
   // without it GC frees them while the view keeps reusing them -> fatal on the render thread
   static void AddReferencedObjects(UObject *InThis, FReferenceCollector &Collector);

   virtual void BeginPlay() override;
   virtual void EndPlay(const EEndPlayReason::Type Reason) override;
   virtual void TickComponent(float DeltaTime, ELevelTick TickType,
                              FActorComponentTickFunction *ThisTickFunction) override;

private:
   void GetResolution(int32 &OutW, int32 &OutH) const;

   // Renders the player's camera straight into PublishTarget as a normal game view (not a scene
   // capture, which the Water plugin skips), after all actors and the camera have ticked
   void OnWorldPostActorTick(UWorld *InWorld, ELevelTick TickType, float DeltaSeconds);
   void RenderOutputView();
   // Turns the app window's own 3D view on/off (off: no world render and no player view setup)
   void UpdateAppWindowRendering(bool bRender);

   FDelegateHandle PostActorTickHandle;
   // Persistent per-view history (TSR, Lumen, eye adaptation, occlusion) for the output view
   FSceneViewStateReference ViewState;

   UPROPERTY()
   TObjectPtr<class UTextureRenderTarget2D> PublishTarget;
};