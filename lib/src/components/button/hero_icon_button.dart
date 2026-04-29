import 'package:flutter/material.dart';
import 'package:hero_ui/src/components/button_group/hero_button_group_style.dart';
import 'package:remix/remix.dart';

import '../button_group/hero_button_group.dart';

import '../../tokens/hero_tokens.dart';
import '../../utils/inherited_variant.dart';
import 'hero_button.dart';

part 'hero_icon_button_style.dart';

final class HeroIconButton extends StatelessWidget {
  final IconData icon;
  final HeroButtonVariant variant;
  final HeroButtonSize size;
  final bool loading;
  final bool enabled;
  final VoidCallback? onPressed;
  final RemixIconButtonStyle? style;

  const HeroIconButton({
    super.key,
    required this.icon,
    this.variant = .primary,
    this.size = .md,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final groupData = HeroButtonGroupData.maybeOf(context);

    final resolvedVariant = groupData?.variant ?? variant;
    final resolvedSize = groupData?.size ?? size;

    final resolvedStyle = HeroIconButtonStyle.baseStyle()
        .merge(HeroIconButtonStyle.sizeStyle())
        .merge(HeroIconButtonStyle.variantStyles())
        .merge(style)
        .applyVariants([
          resolvedVariant,
          resolvedSize,
          if (groupData != null) HeroButtonGroupVariant.group,
        ]);

    return RemixIconButton(
      style: resolvedStyle,
      icon: icon,
      loading: loading,
      onPressed: enabled ? onPressed : null,
    );
  }
}
