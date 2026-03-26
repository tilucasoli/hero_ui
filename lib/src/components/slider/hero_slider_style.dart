import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

enum HeroSliderSize { sm, md, lg }

final class HeroSliderStyle {
  HeroSliderStyle._();

  static RemixSliderStyle resolve({HeroSliderSize size = .md}) {
    return _baseStyle().merge(_sizeStyle(size));
  }

  static RemixSliderStyle _baseStyle() {
    return RemixSliderStyle()
        .trackColor($default())
        .rangeColor($accent())
        .thumb(
          BoxStyler()
              .color(Colors.white)
              .border(.all(.width(2).color($accent())))
              .borderRounded(999),
        )
        .onPressed(.new().thumb(.border(.all(.width(3)))))
        .onDisabled(RemixSliderStyle().wrap(.opacity(0.5)));
  }

  static RemixSliderStyle _sizeStyle(HeroSliderSize size) {
    return switch (size) {
      .sm => RemixSliderStyle(
        thumb: BoxStyler().size(24, 16),
        trackWidth: 16,
        rangeWidth: 16,
      ),
      .md => RemixSliderStyle(
        thumb: BoxStyler().size(28, 20),
        trackWidth: 20,
        rangeWidth: 20,
      ),
      .lg => RemixSliderStyle(
        thumb: BoxStyler().size(32, 24),
        trackWidth: 24,
        rangeWidth: 24,
      ),
    };
  }
}
