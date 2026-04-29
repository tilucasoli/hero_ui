import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../button_group/hero_button_group.dart';
import '../button_group/hero_button_group_style.dart';

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
  final RemixButtonStyle? style;

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

    final resolvedStyle = HeroButtonStyle.baseStyle()
        .merge(HeroIconButtonStyle.sizeStyle())
        .merge(HeroButtonStyle.variantStyles())
        .merge(groupData != null ? HeroButtonGroupStyle.buttonOverride() : null)
        .merge(style)
        .applyVariants([resolvedVariant, resolvedSize]);

    return RemixButton(
      style: resolvedStyle,
      label: '',
      leadingIcon: icon,
      loading: loading,
      enabled: groupData?.enabled ?? enabled,
      onPressed: onPressed,
    );
  }
}
