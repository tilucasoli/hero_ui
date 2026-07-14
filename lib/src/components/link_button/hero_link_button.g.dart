// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_link_button.dart';

// **************************************************************************
// MixWidgetGenerator
// **************************************************************************

class HeroLinkButton extends StatelessWidget {
  const HeroLinkButton({
    super.key,
    this.size = .md,
    this.style,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.enabled = true,
    this.onPressed,
  });

  final HeroLinkButtonSize size;

  final RemixButtonStyler? style;

  final String label;

  final IconData? leadingIcon;

  final IconData? trailingIcon;

  final bool enabled;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return heroLinkButtonStyle(size: this.size, style: this.style).call(
      key: this.key,
      label: this.label,
      leadingIcon: this.leadingIcon,
      trailingIcon: this.trailingIcon,
      enabled: this.enabled,
      onPressed: this.onPressed,
    );
  }
}
