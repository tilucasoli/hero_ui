part of 'hero_sidebar_item.dart';

final class HeroSidebarItemStyle {
  HeroSidebarItemStyle._();

  static RemixToggleStyler _baseStyle() {
    return RemixToggleStyler()
        .borderRounded(8)
        .paddingX(12)
        .paddingY(8)
        .backgroundColor($background())
        .spacing(10)
        .marginY(1)
        .scale(1)
        .iconSize(18)
        .iconColor($muted())
        .labelStyle($labelSmall.mix())
        .labelColor($foreground())
        .onHovered(RemixToggleStyler().backgroundColor($default()))
        .onSelected(
          RemixToggleStyler()
              .backgroundColor($default())
              .iconColor($accentSoftForeground()),
        )
        .onPressed(RemixToggleStyler().scale(0.98))
        .animate(.ease(150.ms));
  }
}
