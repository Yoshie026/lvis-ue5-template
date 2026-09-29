using UnrealBuildTool;
using System.IO;

public class SyphonLink : ModuleRules
{
    public SyphonLink(ReadOnlyTargetRules Target) : base(Target)
    {
        PCHUsage = ModuleRules.PCHUsageMode.UseExplicitOrSharedPCHs;

        PublicDependencyModuleNames.AddRange(new string[]
            { "Core", "CoreUObject", "Engine", "RHI", "RenderCore","CinematicCamera" });

        // BeginRenderingViewFamily for rendering the player view into the Syphon target
        PrivateDependencyModuleNames.Add("Renderer");

        if (Target.Platform == UnrealTargetPlatform.Mac)
        {
            PublicFrameworks.AddRange(new string[] { "Metal", "IOSurface" });

            string SyphonPath = Path.Combine(ModuleDirectory, "ThirdParty", "Syphon");
            string FrameworkPath = Path.Combine(SyphonPath, "Syphon.framework");

            PublicIncludePaths.Add(Path.Combine(SyphonPath, "include"));

            // NOTE: UBT's Mac toolchain only emits the "-F <dir>" framework search path (and the
            // matching runtime -rpath) for a PublicAdditionalFrameworks entry when its Name itself
            // ends in ".framework" - passing the short display name "Syphon" here silently drops
            // both, which fails the link ("framework 'Syphon' not found"). Passing the full on-disk
            // path as Name fixes both.
            PublicAdditionalFrameworks.Add(new Framework(FrameworkPath, FrameworkPath));

            // Ship the framework inside packaged builds
            RuntimeDependencies.Add(
                "$(BinaryOutputDir)/Syphon.framework",
                Path.Combine(FrameworkPath, "*"),
                StagedFileType.NonUFS);

        }
    }
}