#include "Modules/ModuleManager.h"
#include "Misc/CommandLine.h"
#include "Misc/Parse.h"

class FSyphonLinkEarlyModule : public IModuleInterface
{
public:
	virtual void StartupModule() override
	{
#if !WITH_EDITOR
		// Opt-in: pass -LVisNoAudio for a visuals-only build (show audio arrives via OSC).
		// UE's CoreAudio backend can take the app down when macOS audio stalls; -DeterministicAudio
		// makes the audio device manager use the NonRealtimeAudioRenderer instead, which never
		// touches CoreAudio. (-nosound can't be added here: FApp::CanEverRenderAudio() caches it
		// before plugins load.) Without -LVisNoAudio, normal hardware audio output is kept.
		if (FParse::Param(FCommandLine::Get(), TEXT("LVisNoAudio")) && !FParse::Param(FCommandLine::Get(), TEXT("DeterministicAudio")))
		{
			FCommandLine::Append(TEXT(" -DeterministicAudio"));
		}
#endif
	}
};

IMPLEMENT_MODULE(FSyphonLinkEarlyModule, SyphonLinkEarly)
