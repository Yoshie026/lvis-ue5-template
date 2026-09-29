#if PLATFORM_MAC
#include "SyphonServerBridge.h"

// CarbonCore (pulled in by Foundation) declares its own FVector, which clashes
// with UE's FVector alias. Rename it while importing, as MacSystemIncludes.h does.
#pragma push_macro("FVector")
#define FVector FVectorWorkaround
#import <Syphon/Syphon.h>
#import <Metal/Metal.h>
#import <AppKit/AppKit.h>
#pragma pop_macro("FVector")
#include <dispatch/dispatch.h>

static SyphonMetalServer* GTestServer = nil;
static id<MTLDevice> GMetalDevice = nil;
static id<MTLCommandQueue> GQueue = nil;

void FSyphonServerBridge::Start(const FString& ServerName)
{
    if (GTestServer) return;

    GMetalDevice = MTLCreateSystemDefaultDevice();
    GQueue = [GMetalDevice newCommandQueue];

    NSString* Name = [NSString stringWithUTF8String:TCHAR_TO_UTF8(*ServerName)];
    GTestServer = [[SyphonMetalServer alloc] initWithName:Name
                                                   device:GMetalDevice
                                                  options:nil];
}

void FSyphonServerBridge::PublishTexture(void* MetalTexturePtr, int Width, int Height)
{
    if (!GTestServer || !MetalTexturePtr) return;
    id<MTLTexture> Texture = (__bridge id<MTLTexture>)MetalTexturePtr;
    id<MTLCommandBuffer> CB = [GQueue commandBuffer];
    [GTestServer publishFrameTexture:Texture
                     onCommandBuffer:CB
                         imageRegion:NSMakeRect(0, 0, Width, Height)
                             flipped:YES];
    [CB commit];
}

void FSyphonServerBridge::Stop()
{
    [GTestServer stop];
    GTestServer = nil;
    GQueue = nil;
    GMetalDevice = nil;
}

void FSyphonServerBridge::HideApp()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSApplication sharedApplication] hide:nil];
    });
}

void FSyphonServerBridge::ShowApp()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSApplication sharedApplication] unhide:nil];
        [[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
    });
}
#endif
