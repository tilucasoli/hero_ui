part of 'hero_slider.dart';

enum HeroSliderSize with EnumVariant { sm, md, lg }

final class HeroSliderStyle {
  HeroSliderStyle._();

  static RemixSliderStyler _baseStyle() {
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

  static RemixSliderStyler _sizeStyle() {
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
}
