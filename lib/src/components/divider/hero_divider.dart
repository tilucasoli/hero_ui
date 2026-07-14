import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../tokens/hero_tokens.dart';
part 'hero_divider.g.dart';

enum HeroDividerOrientation with EnumVariant { horizontal, vertical }

@MixWidget(widgetParameters: .only({}))
BoxStyler heroDividerStyle({
  HeroDividerOrientation orientation = .horizontal,
  BoxStyler? style,
}) {
  final baseStyle = switch (orientation) {
    HeroDividerOrientation.horizontal =>
      BoxStyler().color($separator()).height(1),
    HeroDividerOrientation.vertical => BoxStyler().color($separator()).width(1),
  };

  return baseStyle.merge(style);
}

final class HeroLabeledDivider extends StatelessWidget {
  final String label;
  final BoxStyler? style;

  const HeroLabeledDivider({super.key, required this.label, this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Expanded(child: HeroDivider(style: style)),
        StyledText(
          label,
          style: TextStyler().style($paragraphXSmall.mix()).color($muted()),
        ),
        Expanded(child: HeroDivider(style: style)),
      ],
    );
  }
}
