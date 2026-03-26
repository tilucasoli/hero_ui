import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../button_group/hero_button_group.dart';
import '../button_group/hero_button_group_style.dart';
import 'hero_button_style.dart';
import 'hero_button_variants.dart';

class HeroButton extends StatelessWidget {
  final HeroButtonVariant? variant;
  final HeroButtonSize? size;
  final String? label;
  final IconData? iconLeft;
  final IconData? iconRight;
  final bool isIconOnly;
  final bool isLoading;
  final bool? isDisabled;
  final bool? fullWidth;
  final VoidCallback? onPressed;
  final RemixButtonStyle? style;

  const HeroButton({
    super.key,
    this.variant,
    this.size,
    this.label,
    this.iconLeft,
    this.iconRight,
    this.isIconOnly = false,
    this.isLoading = false,
    this.isDisabled,
    this.fullWidth,
    this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final groupData = HeroButtonGroupData.maybeOf(context);

    // Resolve props: direct > group > default
    final resolvedVariant =
        variant ?? groupData?.variant ?? HeroButtonVariant.primary;
    final resolvedSize = size ?? groupData?.size ?? HeroButtonSize.md;
    final resolvedDisabled = isDisabled ?? groupData?.isDisabled ?? false;
    final resolvedFullWidth = fullWidth ?? groupData?.fullWidth ?? false;

    // Build the base style from enums
    var resolvedStyle = HeroButtonStyle.resolve(
      variant: resolvedVariant,
      size: resolvedSize,
      isIconOnly: isIconOnly,
      fullWidth: resolvedFullWidth,
    );

    // Apply group-specific overrides
    if (groupData != null) {
      resolvedStyle = resolvedStyle.merge(
        HeroButtonGroupStyle.buttonOverride(
          groupData: groupData,
          variant: resolvedVariant,
        ),
      );
    }

    // Merge user-provided style override last (highest priority)
    if (style != null) {
      resolvedStyle = resolvedStyle.merge(style!);
    }

    return RemixButton(
      style: resolvedStyle,
      label: label ?? '',
      leadingIcon: iconLeft,
      trailingIcon: iconRight,
      loading: isLoading,
      enabled: !resolvedDisabled && !isLoading,
      onPressed: onPressed,
    );
  }
}
