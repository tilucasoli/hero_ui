part of 'hero_sidebar_item.dart';

final class HeroSidebarItemStyle {
  HeroSidebarItemStyle._();

  static FlexBoxStyler _baseStyle() {
    return FlexBoxStyler()
        .borderRounded(8)
        .paddingX(12)
        .paddingY(8)
        .color($background())
        .spacing(10)
        .marginY(1)
        .scale(1)
        .onHovered(.color($default()))
        .variant(ContextVariant.widgetState(.selected), .color($default()))
        .onPressed(.scale(0.98))
        .animate(.ease(150.ms));
  }

  static IconStyler _iconStyle() {
    return IconStyler()
        .size(18)
        .color($muted())
        .variant(
          ContextVariant.widgetState(.selected),
          .color($accentSoftForeground()),
        );
  }

  static TextStyler _labelStyle() {
    return TextStyler()
        .style($labelSmall.mix())
        .color($foreground());
  }
}
