import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../toggle_button_group/hero_toggle_button_group.dart';
import '../toggle_button_group/hero_toggle_button_group_style.dart';

part 'hero_toggle_button_style.dart';

/// A pressable button that stays visually active while [selected].
///
/// Unlike [HeroSwitch], which is a sliding on/off control, a toggle button is
/// a button that reflects an on/off state in place. At least one of [label] or
/// [icon] must be provided.
///
/// When placed inside a [HeroToggleButtonGroup], the group's [variant] and
/// [size] take precedence over the ones set on the button itself.
final class HeroToggleButton extends StatelessWidget {
  final bool selected;
  final ValueChanged<bool>? onChanged;
  final String? label;
  final IconData? icon;
  final HeroToggleButtonVariant variant;
  final HeroToggleButtonSize size;
  final bool enabled;
  final RemixToggleStyler? style;

  const HeroToggleButton({
    super.key,
    required this.selected,
    this.onChanged,
    this.label,
    this.icon,
    this.variant = .defaultVariant,
    this.size = .md,
    this.enabled = true,
    this.style,
  }) : assert(
         label != null || icon != null,
         'At least one of label or icon must be provided',
       );

  @override
  Widget build(BuildContext context) {
    final groupData = HeroToggleButtonGroupData.maybeOf(context);

    final resolvedVariant = groupData?.variant ?? variant;
    final resolvedSize = groupData?.size ?? size;
    final iconOnly = label == null;

    final resolvedStyle = HeroToggleButtonStyle.baseStyle()
        .merge(HeroToggleButtonStyle.sizeStyle())
        .merge(HeroToggleButtonStyle.variantStyles())
        .merge(
          iconOnly ? HeroToggleButtonStyle.iconOnlyStyle(resolvedSize) : null,
        )
        .merge(style)
        .applyVariants([
          resolvedVariant,
          resolvedSize,
          if (groupData != null) HeroToggleButtonGroupVariant.group,
        ]);

    return RemixToggle(
      style: resolvedStyle,
      selected: selected,
      onChanged: onChanged ?? (_) {},
      enabled: enabled && onChanged != null,
      label: label,
      icon: icon,
    );
  }
}
