part of 'hero_checkbox.dart';

enum HeroCheckboxSize with EnumVariant { sm, md, lg }

enum HeroCheckboxVariant with EnumVariant { primary, secondary }

enum _InternalVariants with EnumVariant { error }

final class HeroCheckboxStyle {
  HeroCheckboxStyle._();

  static RemixCheckboxStyler _baseStyle() {
    return RemixCheckboxStyler()
        .color($fieldBackground())
        .indicatorColor($accentForeground())
        .borderAll(
          color: $fieldBorder(),
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
        )
        .borderRounded(6)
        .onHovered(
          RemixCheckboxStyler()
              .color($fieldHover())
              .borderAll(
                color: $fieldBorderHover(),
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
        )
        .onSelected(
          RemixCheckboxStyler()
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
              .onHovered(RemixCheckboxStyler().color($accentHover())),
        )
        .onDisabled(RemixCheckboxStyler().wrap(.opacity(0.5)))
        .animate(.spring(200.ms));
  }

  static RemixCheckboxStyler _variantStyles() {
    return RemixCheckboxStyler()
        .variant(
          HeroCheckboxVariant.primary,
          RemixCheckboxStyler().shadows([
            .color(const Color(0x0F000000)).blurRadius(1).offset(x: 0, y: 0),
            .color(const Color(0x0F000000)).blurRadius(2).offset(x: 0, y: 1),
            .color(const Color(0x0A000000)).blurRadius(4).offset(x: 0, y: 2),
          ]),
        )
        .variant(
          HeroCheckboxVariant.secondary,
          RemixCheckboxStyler()
              .color($default())
              .onHovered(RemixCheckboxStyler().color($defaultHover())),
        )
        .variant(
          _InternalVariants.error,
          RemixCheckboxStyler()
              .borderAll(
                color: $danger(),
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              )
              .onSelected(
                RemixCheckboxStyler()
                    .color($danger())
                    .borderAll(color: Colors.transparent, width: 0)
                    .onHovered(RemixCheckboxStyler().color($dangerHover())),
              ),
        );
  }

  static RemixCheckboxStyler _sizeStyle() {
    return RemixCheckboxStyler()
        .variant(
          HeroCheckboxSize.sm,
          RemixCheckboxStyler().size(14, 14).iconSize(10),
        )
        .variant(
          HeroCheckboxSize.md,
          RemixCheckboxStyler().size(16, 16).iconSize(12),
        )
        .variant(
          HeroCheckboxSize.lg,
          RemixCheckboxStyler().size(20, 20).iconSize(16),
        );
  }
}
