part of 'hero_slider.dart';

enum HeroSliderSize with EnumVariant { sm, md, lg }

final class HeroSliderStyle {
  HeroSliderStyle._();

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

  static RemixSliderStyle _sizeStyle() {
    return RemixSliderStyle()
        .enumVariant(
          HeroSliderSize.sm,
          style: RemixSliderStyle(
            thumb: BoxStyler().size(24, 16),
            trackWidth: 16,
            rangeWidth: 16,
          ),
        )
        .enumVariant(
          HeroSliderSize.md,
          style: RemixSliderStyle(
            thumb: BoxStyler().size(28, 20),
            trackWidth: 20,
            rangeWidth: 20,
          ),
        )
        .enumVariant(
          HeroSliderSize.lg,
          style: RemixSliderStyle(
            thumb: BoxStyler().size(32, 24),
            trackWidth: 24,
            rangeWidth: 24,
          ),
        );
  }
}
