part of 'hero_switch.dart';

enum HeroSwitchSize with EnumVariant { sm, md, lg }

final class HeroSwitchStyle {
  HeroSwitchStyle._();

  /// Unselected thumb shadow (CSS: shadow-field).
  static final _thumbShadow = BoxShadowMix()
      .color(const Color(0x0A000000))
      .offset(x: 0, y: 2)
      .blurRadius(4);

  /// Selected thumb shadow (CSS: stronger shadow on checked state).
  static final _thumbShadowSelected = BoxShadowMix()
      .color(const Color(0x0F000000))
      .offset(x: 0, y: 2)
      .blurRadius(10);

  static RemixSwitchStyle _baseStyle() {
    return RemixSwitchStyle()
        .container(
          BoxStyler().alignment(.centerLeft).paddingAll(2).borderRounded(999),
        )
        .color($default())
        .thumbColor(Colors.white)
        .thumb(BoxStyler().borderRounded(999).shadow(_thumbShadow))
        .onSelected(
          RemixSwitchStyle()
              .color($accent())
              .thumbColor($accentForeground())
              .thumb(BoxStyler().shadow(_thumbShadowSelected))
              .onHovered(RemixSwitchStyle().color($accentHover()))
              .onPressed(RemixSwitchStyle().color($accentHover())),
        )
        .onDisabled(
          RemixSwitchStyle()
              .color($default())
              .thumbColor(const Color(0x33000000))
              .wrap(.opacity(0.5))
              .onSelected(
                RemixSwitchStyle().thumbColor(const Color(0x66FFFFFF)),
              ),
        )
        .animate(.easeOut(200.ms));
  }

  static RemixSwitchStyle _sizeStyle() {
    return RemixSwitchStyle()
        .variant(
          HeroSwitchSize.sm,
          RemixSwitchStyle().size(32, 16).thumb(.size(16.5, 12)),
        )
        .variant(
          HeroSwitchSize.md,
          RemixSwitchStyle().size(40, 20).thumb(.size(22, 16)),
        )
        .variant(
          HeroSwitchSize.lg,
          RemixSwitchStyle().size(48, 24).thumb(.size(27.5, 20)),
        );
  }
}
