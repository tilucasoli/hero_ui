import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

part 'hero_sidebar_item_style.dart';

final class HeroSidebarItem extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool selected;
  final VoidCallback? onPressed;
  final RemixToggleStyle? style;

  const HeroSidebarItem({
    super.key,
    required this.label,
    this.icon,
    this.selected = false,
    this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle =
        HeroSidebarItemStyle._baseStyle().merge(style);

    return RemixToggle(
      selected: selected,
      onChanged: (_) => onPressed?.call(),
      label: label,
      icon: icon,
      style: resolvedStyle,
    );
  }
}
