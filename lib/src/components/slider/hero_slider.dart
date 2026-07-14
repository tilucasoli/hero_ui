import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

part 'hero_slider.g.dart';

enum HeroSliderSize with EnumVariant { sm, md, lg }

@MixWidget(
  widgetParameters: .only({
    'value',
    'onChanged',
    'onChangeStart',
    'onChangeEnd',
    'min',
    'max',
    'enabled',
    'enableFeedback',
    'focusNode',
    'autofocus',
    'snapDivisions',
  }),
)
RemixSliderStyler heroSliderStyle({
  HeroSliderSize size = .md,
  RemixSliderStyler? style,
}) {
  return _baseStyle().merge(_sizeStyle()).merge(style).applyVariants([size]);
}

RemixSliderStyler _baseStyle() {
  return RemixSliderStyler()
      .trackColor($default())
      .rangeColor($accent())
      .thumb(
        BoxStyler()
            .color(Colors.white)
            .border(.all(.width(2).color($accent())))
            .borderRounded(999),
      )
      .onPressed(.new().thumb(.border(.all(.width(3)))))
      .onDisabled(RemixSliderStyler().wrap(.opacity(0.5)));
}

RemixSliderStyler _sizeStyle() {
  return RemixSliderStyler()
      .variant(
        HeroSliderSize.sm,
        RemixSliderStyler(
          thumb: BoxStyler().size(24, 16),
          trackWidth: 16,
          rangeWidth: 16,
        ),
      )
      .variant(
        HeroSliderSize.md,
        RemixSliderStyler(
          thumb: BoxStyler().size(28, 20),
          trackWidth: 20,
          rangeWidth: 20,
        ),
      )
      .variant(
        HeroSliderSize.lg,
        RemixSliderStyler(
          thumb: BoxStyler().size(32, 24),
          trackWidth: 24,
          rangeWidth: 24,
        ),
      );
}
