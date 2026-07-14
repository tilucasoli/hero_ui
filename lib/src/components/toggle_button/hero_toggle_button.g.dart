// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_toggle_button.dart';

// **************************************************************************
// MixWidgetGenerator
// **************************************************************************

/// A pressable button that stays visually active while [selected].
///
/// Unlike [HeroSwitch], which is a sliding on/off control, a toggle button is
/// a button that reflects an on/off state in place. At least one of [label] or
/// [icon] must be provided.
///
class HeroToggleButton extends StatelessWidget {
  const HeroToggleButton({
    super.key,
    this.variant = .defaultVariant,
    this.size = .md,
    this.iconOnly = false,
    this.grouped = false,
    this.style,
    required this.selected,
    this.onChanged,
    this.enabled = true,
    this.label,
    this.icon,
    this.enableFeedback = true,
    this.focusNode,
    this.autofocus = false,
    this.semanticLabel,
  });

  const HeroToggleButton.defaultVariant({
    super.key,
    this.size = .md,
    this.iconOnly = false,
    this.grouped = false,
    this.style,
    required this.selected,
    this.onChanged,
    this.enabled = true,
    this.label,
    this.icon,
    this.enableFeedback = true,
    this.focusNode,
    this.autofocus = false,
    this.semanticLabel,
  }) : variant = HeroToggleButtonVariant.defaultVariant;

  const HeroToggleButton.ghost({
    super.key,
    this.size = .md,
    this.iconOnly = false,
    this.grouped = false,
    this.style,
    required this.selected,
    this.onChanged,
    this.enabled = true,
    this.label,
    this.icon,
    this.enableFeedback = true,
    this.focusNode,
    this.autofocus = false,
    this.semanticLabel,
  }) : variant = HeroToggleButtonVariant.ghost;

  final HeroToggleButtonVariant variant;

  final HeroToggleButtonSize size;

  final bool iconOnly;

  final bool grouped;

  final RemixToggleStyler? style;

  final bool selected;

  final ValueChanged<bool>? onChanged;

  final bool enabled;

  final String? label;

  final IconData? icon;

  final bool enableFeedback;

  final FocusNode? focusNode;

  final bool autofocus;

  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return heroToggleButtonStyle(
      variant: this.variant,
      size: this.size,
      iconOnly: this.iconOnly,
      grouped: this.grouped,
      style: this.style,
    ).call(
      key: this.key,
      selected: this.selected,
      onChanged: this.onChanged,
      enabled: this.enabled,
      label: this.label,
      icon: this.icon,
      enableFeedback: this.enableFeedback,
      focusNode: this.focusNode,
      autofocus: this.autofocus,
      semanticLabel: this.semanticLabel,
    );
  }
}
