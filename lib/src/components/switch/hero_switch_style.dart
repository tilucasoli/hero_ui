part of 'hero_switch.dart';

enum HeroSwitchSize with EnumVariant { sm, md, lg }

final class HeroSwitchStyle {
  HeroSwitchStyle._();

  static RemixSwitchStyle _baseStyle() {
    return RemixSwitchStyle()
        .container(
          BoxStyler().alignment(.centerLeft).paddingAll(2).borderRounded(999),
        )
        .color($default())
        .thumbColor(Colors.white)
        .thumb(
          BoxStyler()
              .borderRounded(999)
              .scale(1)
              .shadow(
                BoxShadowMix()
                    .color(const Color(0x26000000))
                    .offset(x: 0, y: 2)
                    .blurRadius(8),
              ),
        )
        .wrap(.opacity(1))
        .onHovered(RemixSwitchStyle().wrap(.opacity(0.8)))
        .onPressed(RemixSwitchStyle().thumb(.scale(0.9)))
        .onSelected(
          RemixSwitchStyle()
              .color($accent())
              .thumbColor($accentForeground())
              .onHovered(RemixSwitchStyle().color($accentHover()))
              .onPressed(RemixSwitchStyle().color($accentHover())),
        )
        .onDisabled(
          RemixSwitchStyle()
              .color($default())
              .thumbColor($defaultForeground())
              .wrap(.opacity(0.5)),
        )
        .animate(.spring(200.ms));
  }

  static RemixSwitchStyle _sizeStyle() {
    return RemixSwitchStyle()
        .enumVariant(
          HeroSwitchSize.sm,
          style: RemixSwitchStyle().size(32, 16).thumb(.size(16.5, 12)),
        )
        .enumVariant(
          HeroSwitchSize.md,
          style: RemixSwitchStyle().size(40, 20).thumb(.size(22, 16)),
        )
        .enumVariant(
          HeroSwitchSize.lg,
          style: RemixSwitchStyle().size(48, 24).thumb(.size(27.5, 20)),
        );
  }
}
