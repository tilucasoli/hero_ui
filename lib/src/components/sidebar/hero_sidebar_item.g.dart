// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_sidebar_item.dart';

// **************************************************************************
// MixWidgetGenerator
// **************************************************************************

class HeroSidebarItem extends StatelessWidget {
  const HeroSidebarItem({
    super.key,
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
    return heroSidebarItemStyle(style: this.style).call(
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
