import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../button_group/hero_button_group.dart';
import '../button_group/hero_button_group_style.dart';

import '../../tokens/hero_tokens.dart';
import '../../utils/inherited_variant.dart';

part 'hero_button_style.dart';

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
    final resolvedSize = groupData?.size ?? size;

    final resolvedStyle = HeroButtonStyle._baseStyle()
        .merge(HeroButtonStyle._sizeStyle())
        .merge(HeroButtonStyle._variantStyles())
        .merge(groupData != null ? HeroButtonGroupStyle.buttonOverride() : null)
        .merge(style)
        .applyVariants([
          resolvedVariant,
          resolvedSize,
          if (iconOnly) _InternalVariants.iconOnly,
          if (fullWidth) _InternalVariants.fullWidth,
        ]);

    if (groupData != null) {
      return RemixButton(
        style: resolvedStyle,
        label: label ?? '',
        leadingIcon: iconLeft,
        trailingIcon: iconRight,
        loading: loading,
        enabled: groupData.enabled,
        onPressed: onPressed,
      );
    }

    return RemixButton(
      style: resolvedStyle,
      label: label ?? '',
      leadingIcon: iconLeft,
      trailingIcon: iconRight,
      loading: loading,
      enabled: enabled,
      onPressed: onPressed,
    );
  }
}
