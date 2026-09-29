#pragma once

#include "CoreMinimal.h"
#include "Blueprint/UserWidget.h"
#include "LVisConfigWidget.generated.h"

class UCheckBox;
class UTextBlock;
class UVerticalBox;

/**
 * Base class for WBP_Config. At runtime it moves the Blueprint's existing controls (check boxes,
 * the server-name field) into a styled panel, so every Blueprint binding and reference to those
 * controls keeps working while the layout and look are defined here in one place.
 */
UCLASS(Abstract)
class LVISUI_API ULVisConfigWidget : public UUserWidget
{
	GENERATED_BODY()

public:
	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "LVis UI")
	bool bApplyStyle = true;

	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "LVis UI")
	FLinearColor AccentColor = FLinearColor(0.10f, 0.52f, 1.0f, 1.0f);

	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "LVis UI")
	FLinearColor PanelColor = FLinearColor(0.035f, 0.037f, 0.045f, 0.88f);

	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "LVis UI")
	float PanelWidth = 280.f;

protected:
	virtual void NativeOnInitialized() override;
	virtual void NativeTick(const FGeometry &MyGeometry, float InDeltaTime) override;

private:
	void RestyleTree();
	void StyleCheckBox(UCheckBox *CheckBox) const;
	UTextBlock *MakeText(const FString &Text, int32 Size, const FName Typeface, const FLinearColor &Color, const FName Name = NAME_None);
	void AddSectionHeader(UVerticalBox *Box, const FString &Title, bool bFirst);
	void AddRow(UVerticalBox *Box, const FString &Label, UWidget *Control);

	UPROPERTY(Transient)
	TObjectPtr<UTextBlock> StatusText;

	UPROPERTY(Transient)
	TObjectPtr<UCheckBox> SyphonCheckRef;

	float SmoothedFPS = 0.f;
	float StatusRefreshTimer = 0.f;
};
