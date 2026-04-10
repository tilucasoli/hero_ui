part of 'hero_checkbox.dart';

enum HeroCheckboxSize with EnumVariant { sm, md, lg }

final class HeroCheckboxStyle {
  HeroCheckboxStyle._();

  static RemixCheckboxStyle _baseStyle() {
    return RemixCheckboxStyle()
        .color($fieldBackground())
        .indicatorColor($accentForeground())
        .borderAll(
          color: $fieldBorder(),
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
        )
        .borderRounded(6)
        .wrap(.opacity(1))
        .onHovered(RemixCheckboxStyle().wrap(.opacity(0.8)))
        .onSelected(
          RemixCheckboxStyle()
              .color($accent())
              .indicatorColor($accentForeground())
              .borderAll(color: Colors.transparent, width: 0)
              .onHovered(
                RemixCheckboxStyle().color($accentHover()).wrap(.opacity(1)),
              ),
        )
        .onDisabled(RemixCheckboxStyle().wrap(.opacity(0.5)))
        .animate(.spring(200.ms));
  }

  static RemixCheckboxStyle _sizeStyle() {
    return RemixCheckboxStyle()
        .enumVariant(
          HeroCheckboxSize.sm,
          style: RemixCheckboxStyle().size(14, 14).iconSize(10),
        )
        .enumVariant(
          HeroCheckboxSize.md,
          style: RemixCheckboxStyle().size(16, 16).iconSize(12),
        )
        .enumVariant(
          HeroCheckboxSize.lg,
          style: RemixCheckboxStyle().size(20, 20).iconSize(16),
        );
  }
}
