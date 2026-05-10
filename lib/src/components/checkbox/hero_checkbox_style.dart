part of 'hero_checkbox.dart';

enum HeroCheckboxSize with EnumVariant { sm, md, lg }

enum HeroCheckboxVariant with EnumVariant { primary, secondary }

enum _InternalVariants with EnumVariant { error }

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
        .onHovered(
          RemixCheckboxStyle()
              .color($fieldHover())
              .borderAll(
                color: $fieldBorderHover(),
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
        )
        .onSelected(
          RemixCheckboxStyle()
              .color($accent())
              .indicatorColor($accentForeground())
              .borderAll(color: Colors.transparent, width: 0)
              .shadows([
                .color(
                  const Color(0x0F000000),
                ).blurRadius(1).offset(x: 0, y: 0),
                .color(
                  const Color(0x0F000000),
                ).blurRadius(2).offset(x: 0, y: 1),
                .color(
                  const Color(0x0A000000),
                ).blurRadius(4).offset(x: 0, y: 2),
              ])
              .onHovered(RemixCheckboxStyle().color($accentHover())),
        )
        .onDisabled(RemixCheckboxStyle().wrap(.opacity(0.5)))
        .animate(.spring(200.ms));
  }

  static RemixCheckboxStyle _variantStyles() {
    return RemixCheckboxStyle()
        .variant(
          HeroCheckboxVariant.primary,
          RemixCheckboxStyle().shadows([
            .color(const Color(0x0F000000)).blurRadius(1).offset(x: 0, y: 0),
            .color(const Color(0x0F000000)).blurRadius(2).offset(x: 0, y: 1),
            .color(const Color(0x0A000000)).blurRadius(4).offset(x: 0, y: 2),
          ]),
        )
        .variant(
          HeroCheckboxVariant.secondary,
          RemixCheckboxStyle()
              .color($default())
              .onHovered(RemixCheckboxStyle().color($defaultHover())),
        )
        .variant(
          _InternalVariants.error,
          RemixCheckboxStyle()
              .borderAll(
                color: $danger(),
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              )
              .onSelected(
                RemixCheckboxStyle()
                    .color($danger())
                    .borderAll(color: Colors.transparent, width: 0)
                    .onHovered(RemixCheckboxStyle().color($dangerHover())),
              ),
        );
  }

  static RemixCheckboxStyle _sizeStyle() {
    return RemixCheckboxStyle()
        .variant(
          HeroCheckboxSize.sm,
          RemixCheckboxStyle().size(14, 14).iconSize(10),
        )
        .variant(
          HeroCheckboxSize.md,
          RemixCheckboxStyle().size(16, 16).iconSize(12),
        )
        .variant(
          HeroCheckboxSize.lg,
          RemixCheckboxStyle().size(20, 20).iconSize(16),
        );
  }
}
