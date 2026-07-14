// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_button.dart';

// **************************************************************************
// MixWidgetGenerator
// **************************************************************************

class HeroButton extends StatelessWidget {
  const HeroButton({
    super.key,
    this.variant = .primary,
    this.size = .md,
    this.fullWidth = false,
    this.grouped = false,
    this.style,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  });

  const HeroButton.primary({
    super.key,
    this.size = .md,
    this.fullWidth = false,
    this.grouped = false,
    this.style,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.primary;

  const HeroButton.secondary({
    super.key,
    this.size = .md,
    this.fullWidth = false,
    this.grouped = false,
    this.style,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.secondary;

  const HeroButton.tertiary({
    super.key,
    this.size = .md,
    this.fullWidth = false,
    this.grouped = false,
    this.style,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.tertiary;

  const HeroButton.outline({
    super.key,
    this.size = .md,
    this.fullWidth = false,
    this.grouped = false,
    this.style,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.outline;

  const HeroButton.ghost({
    super.key,
    this.size = .md,
    this.fullWidth = false,
    this.grouped = false,
    this.style,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.ghost;

  const HeroButton.danger({
    super.key,
    this.size = .md,
    this.fullWidth = false,
    this.grouped = false,
    this.style,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.danger;

  const HeroButton.dangerSoft({
    super.key,
    this.size = .md,
    this.fullWidth = false,
    this.grouped = false,
    this.style,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : variant = HeroButtonVariant.dangerSoft;

  final HeroButtonVariant variant;

  final HeroButtonSize size;

  final bool fullWidth;

  final bool grouped;

  final RemixButtonStyler? style;

  final String label;

  final IconData? leadingIcon;

  final IconData? trailingIcon;

  final bool loading;

  final bool enabled;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return heroButtonStyle(
      variant: this.variant,
      size: this.size,
      fullWidth: this.fullWidth,
      grouped: this.grouped,
      style: this.style,
    ).call(
      key: this.key,
      label: this.label,
      leadingIcon: this.leadingIcon,
      trailingIcon: this.trailingIcon,
      loading: this.loading,
      enabled: this.enabled,
      onPressed: this.onPressed,
    );
  }
}
