part of 'hero_link_button.dart';

enum HeroLinkButtonSize with EnumVariant { sm, md, lg }

final class HeroLinkButtonStyle {
  HeroLinkButtonStyle._();

  static RemixButtonStyle _baseStyle() {
    return RemixButtonStyle()
        .mainAxisSize(.min)
        .mainAxisAlignment(.center)
        .crossAxisAlignment(.center)
        .spacing(4)
        .color(Colors.transparent)
        .labelColor($accent())
        .iconColor($accent())
        .onHovered(
          RemixButtonStyle()
              .labelColor($accentHover())
              .iconColor($accentHover()),
        )
        .onPressed(
          RemixButtonStyle()
              .labelColor($accentHover())
              .iconColor($accentHover()),
        )
        .onDisabled(RemixButtonStyle().wrap(.opacity(0.5)))
        .animate(.easeOut(100.ms));
  }

  static RemixButtonStyle _sizeStyle() {
    return RemixButtonStyle()
        .enumVariant(
          HeroLinkButtonSize.sm,
          style: RemixButtonStyle()
              .labelTextStyle($labelSmall.mix())
              .iconSize(14),
        )
        .enumVariant(
          HeroLinkButtonSize.md,
          style: RemixButtonStyle()
              .labelTextStyle($labelSmall.mix())
              .iconSize(16),
        )
        .enumVariant(
          HeroLinkButtonSize.lg,
          style: RemixButtonStyle()
              .labelTextStyle($labelMedium.mix())
              .iconSize(18),
        );
  }
}
