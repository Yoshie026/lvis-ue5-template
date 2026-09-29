using UnrealBuildTool;

// Loads at PostConfigInit, before the engine creates its audio device, so it can switch the
// packaged game to the non-realtime (CoreAudio-free) audio renderer in time
public class SyphonLinkEarly : ModuleRules
{
    public SyphonLinkEarly(ReadOnlyTargetRules Target) : base(Target)
    {
        PCHUsage = ModuleRules.PCHUsageMode.UseExplicitOrSharedPCHs;
        PrivateDependencyModuleNames.Add("Core");
    }
}
