import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import 'hero_link_button_style.dart';

final class HeroLinkButton extends StatelessWidget {
  final String label;
  final HeroLinkButtonSize size;
  final IconData? iconLeft;
  final IconData? iconRight;
  final bool enabled;
  final VoidCallback? onPressed;
  final RemixButtonStyle? style;

  const HeroLinkButton({
    super.key,
    required this.label,
    this.size = .md,
    this.iconLeft,
    this.iconRight,
    this.enabled = true,
    this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = HeroLinkButtonStyle.resolve(size: size).merge(style);

    return RemixButton(
      style: resolvedStyle,
      label: label,
      leadingIcon: iconLeft,
      trailingIcon: iconRight,
      enabled: enabled,
      onPressed: onPressed,
    );
  }
}
