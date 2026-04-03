import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../utils/inherited_variant.dart';
import '../button_group/hero_button_group.dart';
import '../button_group/hero_button_group_style.dart';
import 'hero_button_style.dart';

final class HeroButton extends StatelessWidget {
  final HeroButtonVariant variant;
  final HeroButtonSize size;
  final String? label;
  final IconData? iconLeft;
  final IconData? iconRight;
  final bool iconOnly;
  final bool loading;
  final bool enabled;
  final bool fullWidth;
  final VoidCallback? onPressed;
  final RemixButtonStyle? style;

  const HeroButton({
    super.key,
    this.variant = .primary,
    this.size = .md,
    this.label,
    this.iconLeft,
    this.iconRight,
    this.iconOnly = false,
    this.loading = false,
    this.enabled = true,
    this.fullWidth = false,
    this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final groupData = HeroButtonGroupData.maybeOf(context);

    final resolvedVariant = groupData?.variant ?? variant;

    final resolvedStyle =
        HeroButtonStyle.resolve(
              size: groupData?.size ?? size,
              iconOnly: iconOnly,
              fullWidth: groupData?.fullWidth ?? fullWidth,
            )
            .merge(
              groupData != null ? HeroButtonGroupStyle.buttonOverride() : null,
            )
            .animate(.ease(100.ms))
            .merge(style);

    if (groupData != null) {
      return InheritedVariant<HeroButtonVariant>(
        variant: resolvedVariant,
        child: RemixButton(
          style: resolvedStyle,
          label: label ?? '',
          leadingIcon: iconLeft,
          trailingIcon: iconRight,
          loading: loading,
          enabled: groupData.enabled,
          onPressed: onPressed,
        ),
      );
    }

    return InheritedVariant<HeroButtonVariant>(
      variant: resolvedVariant,
      child: RemixButton(
        style: resolvedStyle,
        label: label ?? '',
        leadingIcon: iconLeft,
        trailingIcon: iconRight,
        loading: loading,
        enabled: enabled,
        onPressed: onPressed,
      ),
    );
  }
}
