// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_icon_button.dart';

// **************************************************************************
// MixWidgetGenerator
// **************************************************************************

class HeroIconButton extends StatelessWidget {
  const HeroIconButton({
    super.key,
    this.variant = .primary,
    this.size = .md,
    this.grouped = false,
    this.style,
    required this.icon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  });

  const HeroIconButton.primary({
    super.key,
    this.size = .md,
    this.grouped = false,
    this.style,
    required this.icon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.primary;

  const HeroIconButton.secondary({
    super.key,
    this.size = .md,
    this.grouped = false,
    this.style,
    required this.icon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.secondary;

  const HeroIconButton.tertiary({
    super.key,
    this.size = .md,
    this.grouped = false,
    this.style,
    required this.icon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.tertiary;

  const HeroIconButton.outline({
    super.key,
    this.size = .md,
    this.grouped = false,
    this.style,
    required this.icon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.outline;

  const HeroIconButton.ghost({
    super.key,
    this.size = .md,
    this.grouped = false,
    this.style,
    required this.icon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.ghost;

  const HeroIconButton.danger({
    super.key,
    this.size = .md,
    this.grouped = false,
    this.style,
    required this.icon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.danger;

  const HeroIconButton.dangerSoft({
    super.key,
    this.size = .md,
    this.grouped = false,
    this.style,
    required this.icon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.dangerSoft;

  final HeroButtonVariant variant;

  final HeroButtonSize size;

  final bool grouped;

  final RemixIconButtonStyler? style;

  final IconData icon;

  final bool loading;

  final bool enabled;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return heroIconButtonStyle(
      variant: this.variant,
      size: this.size,
      grouped: this.grouped,
      style: this.style,
    ).call(
      key: this.key,
      icon: this.icon,
      loading: this.loading,
      enabled: this.enabled,
      onPressed: this.onPressed,
    );
  }
}
