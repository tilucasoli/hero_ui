import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../tokens/hero_tokens.dart';
import 'hero_divider_style.dart';

final class HeroDivider extends StatelessWidget {
  final HeroDividerOrientation orientation;
  final String? label;
  final BoxStyler? style;

  const HeroDivider({
    super.key,
    this.orientation = .horizontal,
    this.label,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = HeroDividerStyle.resolve(
      orientation: orientation,
    ).merge(style);

    if (label == null) {
      return Box(style: resolvedStyle);
    }

    return Row(
      spacing: 12,
      children: [
        Expanded(child: Box(style: resolvedStyle)),
        StyledText(
          label!,
          style: TextStyler().fontSize(12).color($muted()),
        ),
        Expanded(child: Box(style: resolvedStyle)),
      ],
    );
  }
}
