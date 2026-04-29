import 'package:flutter/material.dart';
import 'package:hero_ui/hero_ui.dart';
import 'package:remix/remix.dart';

import '../button_group/hero_button_group.dart';

import '../../tokens/hero_tokens.dart';
import '../../utils/inherited_variant.dart';

part 'hero_button_style.dart';

final class HeroButton extends StatelessWidget {
  final HeroButtonVariant variant;
  final HeroButtonSize size;
  final String label;
  final IconData? iconLeft;
  final IconData? iconRight;
  final bool loading;
  final bool enabled;
  final bool fullWidth;
  final VoidCallback? onPressed;
  final RemixButtonStyle? style;

  const HeroButton({
    super.key,
    required this.label,
    this.variant = .primary,
    this.size = .md,
    this.iconLeft,
    this.iconRight,
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

    final resolvedStyle = HeroButtonStyle.baseStyle()
        .merge(HeroButtonStyle.sizeStyle())
        .merge(HeroButtonStyle.variantStyles())
        .merge(style)
        .applyVariants([
          resolvedVariant,
          resolvedSize,
          if (groupData != null) HeroButtonGroupVariant.group,
          if (fullWidth) _InternalVariants.fullWidth,
        ]);

    return RemixButton(
      style: resolvedStyle,
      label: label,
      leadingIcon: iconLeft,
      trailingIcon: iconRight,
      loading: loading,
      enabled: enabled,
      onPressed: onPressed,
    );
  }
}
