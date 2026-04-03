import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../tokens/hero_tokens.dart';
import 'hero_sidebar_style.dart';

final class HeroSidebarItem extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Widget? trailing;
  final bool isSelected;
  final VoidCallback? onPressed;

  const HeroSidebarItem({
    super.key,
    required this.label,
    this.icon,
    this.trailing,
    this.isSelected = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final containerStyle = HeroSidebarItemStyle.resolve(isSelected: isSelected);

    final labelColor =
        isSelected ? $accentSoftForeground() : $surfaceForeground();
    final iconColor =
        isSelected ? $accentSoftForeground() : $surfaceForeground();

    return PressableBox(
      onPress: onPressed,
      style: containerStyle,
      child: Row(
        spacing: 10,
        children: [
          if (icon != null)
            StyledIcon(
              icon: icon!,
              style: heroSidebarItemIconStyle.color(iconColor),
            ),
          Expanded(
            child: StyledText(
              label,
              style: heroSidebarItemLabelStyle.color(labelColor),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
