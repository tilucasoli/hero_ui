part of 'hero_radio.dart';

enum HeroRadioSize with EnumVariant { sm, md, lg }

enum HeroRadioVariant with EnumVariant { primary, secondary }

enum _InternalVariants with EnumVariant { error }

final class HeroRadioStyle {
  HeroRadioStyle._();

  static RemixRadioStyle _baseStyle() {
    return RemixRadioStyle()
        .container(
          BoxStyler()
              .borderRounded(999)
              .borderAll(
                color: $fieldBorder(),
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              )
              .color($fieldBackground())
              .alignment(.center)
              .scale(1)
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
              ]),
        )
        .indicator(
          BoxStyler()
              .borderRounded(999)
              .color($fieldBackground())
              .shadow(
                .color(
                  const Color(0x0D000000),
                ).blurRadius(1).offset(x: 0, y: 1),
              ),
        )
        .onHovered(
          RemixRadioStyle().container(
            BoxStyler()
                .color($fieldHover())
                .borderAll(color: $fieldBorderHover(), width: 1),
          ),
        )
        .onPressed(RemixRadioStyle().container(BoxStyler().scale(0.95)))
        .onSelected(
          RemixRadioStyle()
              .container(
                BoxStyler()
                    .color($accent())
                    .borderAll(color: $accent(), width: 1),
              )
              .indicator(BoxStyler().color($accentForeground()))
              .onHovered(
                RemixRadioStyle().container(BoxStyler().color($accentHover())),
              )
              .onPressed(
                RemixRadioStyle().container(BoxStyler().color($accentHover())),
              ),
        )
        .onDisabled(RemixRadioStyle().wrap(.opacity(0.5)))
        .animate(AnimationConfig.spring(200.ms));
  }

  static RemixRadioStyle _variantStyles() {
    return RemixRadioStyle()
        .variant(
          HeroRadioVariant.secondary,
          RemixRadioStyle()
              .container(BoxStyler().color($default()))
              .onHovered(
                RemixRadioStyle().container(BoxStyler().color($defaultHover())),
              ),
        )
        .variant(
          _InternalVariants.error,
          RemixRadioStyle()
              .container(BoxStyler().borderAll(color: $danger(), width: 1))
              .onSelected(
                RemixRadioStyle()
                    .container(
                      .color($danger()).borderAll(color: $danger(), width: 1),
                    )
                    .indicator(.color($dangerForeground())),
              ),
        );
  }

  static RemixRadioStyle _sizeStyle() {
    return RemixRadioStyle()
        .variant(
          HeroRadioSize.sm,
          RemixRadioStyle().container(.size(16, 16)).indicator(.size(6, 6)),
        )
        .variant(
          HeroRadioSize.md,
          RemixRadioStyle().container(.size(20, 20)).indicator(.size(8, 8)),
        )
        .variant(
          HeroRadioSize.lg,
          RemixRadioStyle().container(.size(24, 24)).indicator(.size(10, 10)),
        );
  }
}
