part of 'hero_icon_button.dart';

final class HeroIconButtonStyle {
  HeroIconButtonStyle._();

  static RemixButtonStyle sizeStyle() {
    return RemixButtonStyle()
        .enumVariant(
          HeroButtonSize.sm,
          style: RemixButtonStyle()
              .scale(1)
              .height(32)
              .width(32)
              .paddingX(0)
              .borderRounded(24)
              .iconSize(16)
              .onPressed(RemixButtonStyle().container(.scale(0.97))),
        )
        .enumVariant(
          HeroButtonSize.md,
          style: RemixButtonStyle()
              .scale(1)
              .height(36)
              .width(36)
              .paddingX(0)
              .borderRounded(24)
              .iconSize(18)
              .onPressed(.new().container(.scale(0.97))),
        )
        .enumVariant(
          HeroButtonSize.lg,
          style: RemixButtonStyle()
              .scale(1)
              .height(40)
              .width(40)
              .paddingX(0)
              .borderRounded(24)
              .iconSize(20)
              .onPressed(.new().container(.scale(0.97))),
        );
  }
}
