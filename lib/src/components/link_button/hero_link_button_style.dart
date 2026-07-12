part of 'hero_link_button.dart';

enum HeroLinkButtonSize with EnumVariant { sm, md, lg }

final class HeroLinkButtonStyle {
  HeroLinkButtonStyle._();

  static RemixButtonStyler _baseStyle() {
    return RemixButtonStyler()
        .mainAxisSize(.min)
        .mainAxisAlignment(.center)
        .crossAxisAlignment(.center)
        .spacing(4)
        .color(Colors.transparent)
        .labelColor($accent())
        .iconColor($accent())
        .onHovered(
          RemixButtonStyler()
              .labelColor($accentHover())
              .iconColor($accentHover()),
        )
        .onPressed(
          RemixButtonStyler()
              .labelColor($accentHover())
              .iconColor($accentHover()),
        )
        .onDisabled(RemixButtonStyler().wrap(.opacity(0.5)))
        .animate(.easeOut(100.ms));
  }

  static RemixButtonStyler _sizeStyle() {
    return RemixButtonStyler()
        .variant(
          HeroLinkButtonSize.sm,
          RemixButtonStyler().labelStyle($labelSmall.mix()).iconSize(14),
        )
        .variant(
          HeroLinkButtonSize.md,
          RemixButtonStyler().labelStyle($labelSmall.mix()).iconSize(16),
        )
        .variant(
          HeroLinkButtonSize.lg,
          RemixButtonStyler().labelStyle($labelMedium.mix()).iconSize(18),
        );
  }
}
