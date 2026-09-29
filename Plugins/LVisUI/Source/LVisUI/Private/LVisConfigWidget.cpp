#include "LVisConfigWidget.h"
#include "Blueprint/WidgetTree.h"
#include "Brushes/SlateRoundedBoxBrush.h"
#include "Components/Border.h"
#include "Components/CanvasPanel.h"
#include "Components/CanvasPanelSlot.h"
#include "Components/CheckBox.h"
#include "Components/EditableText.h"
#include "Components/EditableTextBox.h"
#include "Components/HorizontalBox.h"
#include "Components/HorizontalBoxSlot.h"
#include "Components/SizeBox.h"
#include "Components/Spacer.h"
#include "Components/TextBlock.h"
#include "Components/VerticalBox.h"
#include "Components/VerticalBoxSlot.h"
#include "Styling/CoreStyle.h"

namespace
{
	const FLinearColor TextPrimary(0.92f, 0.93f, 0.95f, 1.f);
	const FLinearColor TextSecondary(0.55f, 0.57f, 0.62f, 1.f);
	const FLinearColor FieldColor(0.075f, 0.078f, 0.09f, 1.f);
	const FLinearColor FieldOutline(1.f, 1.f, 1.f, 0.08f);

	// Position of a widget in its enclosing canvas, summing canvas-slot offsets up the chain
	FVector2D CanvasPosition(const UWidget *Widget)
	{
		FVector2D Pos = FVector2D::ZeroVector;
		for (const UWidget *W = Widget; W; W = W->GetParent())
		{
			if (const UCanvasPanelSlot *Slot = Cast<UCanvasPanelSlot>(W->Slot))
			{
				Pos += Slot->GetPosition();
			}
		}
		return Pos;
	}

	FString CleanLabel(FString Label)
	{
		Label.TrimStartAndEndInline();
		Label.RemoveFromEnd(TEXT(":"));
		Label.TrimEndInline();
		return Label;
	}

	// The label for a control: a text sibling in the same box, else the nearest text to its left
	FString FindLabel(const UWidget *Control, const TArray<UTextBlock *> &Texts)
	{
		const UPanelWidget *Parent = Control->GetParent();
		if (Parent && !Parent->IsA<UCanvasPanel>())
		{
			for (int32 i = 0; i < Parent->GetChildrenCount(); ++i)
			{
				if (const UTextBlock *Text = Cast<UTextBlock>(Parent->GetChildAt(i)))
				{
					return CleanLabel(Text->GetText().ToString());
				}
			}
		}
		const FVector2D At = CanvasPosition(Control);
		const UTextBlock *Best = nullptr;
		double BestScore = TNumericLimits<double>::Max();
		for (const UTextBlock *Text : Texts)
		{
			const FVector2D P = CanvasPosition(Text);
			const double Score = FMath::Abs(P.Y - At.Y) * 4.0 + FMath::Abs(P.X - At.X) + (P.X > At.X ? 500.0 : 0.0);
			if (Score < BestScore)
			{
				BestScore = Score;
				Best = Text;
			}
		}
		return Best ? CleanLabel(Best->GetText().ToString()) : Control->GetName();
	}
}

void ULVisConfigWidget::NativeOnInitialized()
{
	Super::NativeOnInitialized();
	if (bApplyStyle && !IsDesignTime())
	{
		RestyleTree();
	}
}

UTextBlock *ULVisConfigWidget::MakeText(const FString &Text, int32 Size, const FName Typeface, const FLinearColor &Color, const FName Name)
{
	UTextBlock *Block = WidgetTree->ConstructWidget<UTextBlock>(UTextBlock::StaticClass(), Name);
	Block->SetText(FText::FromString(Text));
	Block->SetFont(FCoreStyle::GetDefaultFontStyle(Typeface, Size));
	Block->SetColorAndOpacity(FSlateColor(Color));
	return Block;
}

void ULVisConfigWidget::StyleCheckBox(UCheckBox *CheckBox) const
{
	// Pill-shaped toggle: dim when off, accent-filled when on
	const FVector2f Size(30.f, 16.f);
	const float Radius = 8.f;
	const FLinearColor Off(0.20f, 0.21f, 0.24f, 1.f);
	const FLinearColor OffHover(0.27f, 0.28f, 0.32f, 1.f);
	const FLinearColor OnHover = AccentColor * FLinearColor(1.15f, 1.15f, 1.15f, 1.f);

	FCheckBoxStyle Style = CheckBox->GetWidgetStyle();
	Style.SetCheckBoxType(ESlateCheckBoxType::CheckBox);
	Style.SetUncheckedImage(FSlateRoundedBoxBrush(Off, Radius, FieldOutline, 1.f, Size));
	Style.SetUncheckedHoveredImage(FSlateRoundedBoxBrush(OffHover, Radius, FieldOutline, 1.f, Size));
	Style.SetUncheckedPressedImage(FSlateRoundedBoxBrush(OffHover, Radius, FieldOutline, 1.f, Size));
	Style.SetCheckedImage(FSlateRoundedBoxBrush(AccentColor, Radius, Size));
	Style.SetCheckedHoveredImage(FSlateRoundedBoxBrush(OnHover, Radius, Size));
	Style.SetCheckedPressedImage(FSlateRoundedBoxBrush(OnHover, Radius, Size));
	Style.SetUndeterminedImage(FSlateRoundedBoxBrush(Off, Radius, Size));
	Style.SetPadding(FMargin(0.f));
	CheckBox->SetWidgetStyle(Style);
}

void ULVisConfigWidget::AddSectionHeader(UVerticalBox *Box, const FString &Title, bool bFirst)
{
	UTextBlock *Header = MakeText(Title, 8, TEXT("Bold"), AccentColor * FLinearColor(1.f, 1.f, 1.f, 0.9f));
	UVerticalBoxSlot *Slot = Box->AddChildToVerticalBox(Header);
	Slot->SetPadding(FMargin(0.f, bFirst ? 10.f : 14.f, 0.f, 4.f));
}

void ULVisConfigWidget::AddRow(UVerticalBox *Box, const FString &Label, UWidget *Control)
{
	UHorizontalBox *Row = WidgetTree->ConstructWidget<UHorizontalBox>(UHorizontalBox::StaticClass());
	UHorizontalBoxSlot *LabelSlot = Row->AddChildToHorizontalBox(MakeText(Label, 10, TEXT("Regular"), TextPrimary));
	LabelSlot->SetSize(FSlateChildSize(ESlateSizeRule::Fill));
	LabelSlot->SetVerticalAlignment(VAlign_Center);
	UHorizontalBoxSlot *ControlSlot = Row->AddChildToHorizontalBox(Control);
	ControlSlot->SetHorizontalAlignment(HAlign_Right);
	ControlSlot->SetVerticalAlignment(VAlign_Center);

	UVerticalBoxSlot *Slot = Box->AddChildToVerticalBox(Row);
	Slot->SetPadding(FMargin(0.f, 4.f));
}

void ULVisConfigWidget::RestyleTree()
{
	if (!WidgetTree || !WidgetTree->RootWidget)
	{
		return;
	}

	TArray<UWidget *> All;
	WidgetTree->GetAllWidgets(All);
	TArray<UTextBlock *> Texts;
	TArray<UCheckBox *> Checks;
	UWidget *NameField = nullptr;
	for (UWidget *W : All)
	{
		if (UTextBlock *T = Cast<UTextBlock>(W)) { Texts.Add(T); }
		else if (UCheckBox *C = Cast<UCheckBox>(W)) { Checks.Add(C); }
		else if (W->IsA<UEditableText>() || W->IsA<UEditableTextBox>()) { NameField = W; }
	}
	if (Checks.Num() == 0)
	{
		return; // unexpected layout: leave the Blueprint's own design untouched
	}

	struct FRowInfo { FString Label; UCheckBox *Check; FVector2D Pos; };
	TArray<FRowInfo> Inputs, Outputs;
	for (UCheckBox *C : Checks)
	{
		FRowInfo Info{FindLabel(C, Texts), C, CanvasPosition(C)};
		(Info.Label.Contains(TEXT("Syphon")) ? Outputs : Inputs).Add(Info);
	}
	auto ByPosition = [](const FRowInfo &A, const FRowInfo &B) { return A.Pos.Y != B.Pos.Y ? A.Pos.Y < B.Pos.Y : A.Pos.X < B.Pos.X; };
	Inputs.Sort(ByPosition);
	Outputs.Sort(ByPosition);
	const FString NameLabel = NameField ? FindLabel(NameField, Texts) : FString();

	// Detach the live controls before the old tree is dropped (their bindings stay with them)
	for (UCheckBox *C : Checks) { C->RemoveFromParent(); }
	if (NameField) { NameField->RemoveFromParent(); }

	// New layout: a rounded card in the top-left corner
	UCanvasPanel *Root = WidgetTree->ConstructWidget<UCanvasPanel>(UCanvasPanel::StaticClass(), TEXT("LVisRoot"));
	UBorder *Card = WidgetTree->ConstructWidget<UBorder>(UBorder::StaticClass(), TEXT("LVisCard"));
	Card->SetBrush(FSlateRoundedBoxBrush(PanelColor, 10.f, FieldOutline, 1.f));
	Card->SetPadding(FMargin(16.f, 12.f, 16.f, 14.f));
	UCanvasPanelSlot *CardSlot = Root->AddChildToCanvas(Card);
	CardSlot->SetAutoSize(true);
	CardSlot->SetPosition(FVector2D(16.f, 16.f));

	USizeBox *Width = WidgetTree->ConstructWidget<USizeBox>(USizeBox::StaticClass());
	Width->SetWidthOverride(PanelWidth);
	Card->SetContent(Width);
	UVerticalBox *Box = WidgetTree->ConstructWidget<UVerticalBox>(UVerticalBox::StaticClass());
	Width->SetContent(Box);

	// Title row: name on the left, live status on the right
	UHorizontalBox *TitleRow = WidgetTree->ConstructWidget<UHorizontalBox>(UHorizontalBox::StaticClass());
	UHorizontalBoxSlot *TitleSlot = TitleRow->AddChildToHorizontalBox(MakeText(TEXT("LVis"), 15, TEXT("Bold"), TextPrimary));
	TitleSlot->SetSize(FSlateChildSize(ESlateSizeRule::Fill));
	TitleSlot->SetVerticalAlignment(VAlign_Center);
	StatusText = MakeText(TEXT(""), 8, TEXT("Regular"), TextSecondary, TEXT("LVisStatus"));
	UHorizontalBoxSlot *StatusSlot = TitleRow->AddChildToHorizontalBox(StatusText);
	StatusSlot->SetVerticalAlignment(VAlign_Center);
	Box->AddChildToVerticalBox(TitleRow);

	if (Inputs.Num() > 0)
	{
		AddSectionHeader(Box, TEXT("INPUTS"), true);
		for (const FRowInfo &Row : Inputs)
		{
			StyleCheckBox(Row.Check);
			AddRow(Box, Row.Label, Row.Check);
		}
	}

	if (Outputs.Num() > 0 || NameField)
	{
		AddSectionHeader(Box, TEXT("OUTPUT"), Inputs.Num() == 0);
		for (const FRowInfo &Row : Outputs)
		{
			StyleCheckBox(Row.Check);
			AddRow(Box, Row.Label, Row.Check);
			SyphonCheckRef = Row.Check;
		}
		if (NameField)
		{
			const FSlateFontInfo FieldFont = FCoreStyle::GetDefaultFontStyle(TEXT("Regular"), 10);
			if (UEditableText *Edit = Cast<UEditableText>(NameField))
			{
				FEditableTextStyle Style = Edit->WidgetStyle;
				Style.SetFont(FieldFont);
				Style.SetColorAndOpacity(FSlateColor(TextPrimary));
				Edit->SetWidgetStyle(Style);
			}
			else if (UEditableTextBox *EditBox = Cast<UEditableTextBox>(NameField))
			{
				FEditableTextBoxStyle Style = EditBox->GetWidgetStyle();
				Style.SetFont(FieldFont);
				Style.SetForegroundColor(FSlateColor(TextPrimary));
				EditBox->SetWidgetStyle(Style);
			}
			UBorder *Field = WidgetTree->ConstructWidget<UBorder>(UBorder::StaticClass());
			Field->SetBrush(FSlateRoundedBoxBrush(FieldColor, 5.f, FieldOutline, 1.f));
			Field->SetPadding(FMargin(8.f, 4.f));
			Field->SetContent(NameField);
			USizeBox *FieldWidth = WidgetTree->ConstructWidget<USizeBox>(USizeBox::StaticClass());
			FieldWidth->SetWidthOverride(140.f);
			FieldWidth->SetContent(Field);
			AddRow(Box, NameLabel.IsEmpty() ? TEXT("Server Name") : NameLabel, FieldWidth);
		}
	}

	WidgetTree->RootWidget = Root;
}

void ULVisConfigWidget::NativeTick(const FGeometry &MyGeometry, float InDeltaTime)
{
	Super::NativeTick(MyGeometry, InDeltaTime);
	if (!StatusText || InDeltaTime <= 0.f)
	{
		return;
	}
	const float FPS = 1.f / InDeltaTime;
	SmoothedFPS = SmoothedFPS <= 0.f ? FPS : FMath::Lerp(SmoothedFPS, FPS, 0.1f);

	StatusRefreshTimer -= InDeltaTime;
	if (StatusRefreshTimer > 0.f)
	{
		return;
	}
	StatusRefreshTimer = 0.5f;
	const bool bSyphon = SyphonCheckRef && SyphonCheckRef->IsChecked();
	StatusText->SetText(FText::FromString(FString::Printf(TEXT("%.0f fps  ·  Syphon %s"), SmoothedFPS, bSyphon ? TEXT("on") : TEXT("off"))));
	StatusText->SetColorAndOpacity(FSlateColor(SmoothedFPS < 30.f ? FLinearColor(1.f, 0.45f, 0.35f, 1.f) : TextSecondary));
}
