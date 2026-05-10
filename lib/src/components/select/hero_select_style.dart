part of 'hero_select.dart';

enum HeroSelectVariant with EnumVariant { primary, secondary }

enum _InternalVariants with EnumVariant { error }

final class HeroSelectStyle {
  HeroSelectStyle._();

  static RemixSelectMenuItemStyle _itemStyle() {
    return RemixSelectMenuItemStyle()
        .color(Colors.transparent)
        .borderRadiusAll(Radius.circular(20))
        .paddingX(12)
        .paddingY(6)
        .minHeight(36)
        .text(TextStyler().style($labelSmall.mix()).color($defaultForeground()))
        .icon(.color($muted()).size(16))
        .onHovered(RemixSelectMenuItemStyle().color($default()));
  }

  static RemixSelectStyle _baseStyle() {
    return RemixSelectStyle()
        .trigger(
          RemixSelectTriggerStyle()
              .color($fieldBackground())
              .borderAll(
                color: $fieldBorder(),
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              )
              .borderRadiusAll($fieldRadius())
              .paddingX(12)
              .paddingY(8)
              .label(
                TextStyler()
                    .style($paragraphSmall.mix())
                    .color($fieldPlaceholder())
                    .height(1.4),
              )
              .icon(.color($fieldForeground()).size(16))
              .shadows([
                .color(Color(0x0F000000)).blurRadius(1).offset(x: 0, y: 0),
                .color(Color(0x0F000000)).blurRadius(2).offset(x: 0, y: 1),
                .color(Color(0x0A000000)).blurRadius(4).offset(x: 0, y: 2),
              ]),
        )
        .menuContainer(
          FlexBoxStyler()
              .color($overlay())
              .borderRadiusAll(Radius.circular(24))
              .paddingAll(4)
              .marginTop(4)
              .shadows([
                .color(Color(0x0F000000)).blurRadius(8).offset(x: 0, y: 2),
                .color(Color(0x08000000)).blurRadius(12).offset(x: 0, y: -6),
                .color(Color(0x14000000)).blurRadius(28).offset(x: 0, y: 14),
              ]),
        )
        .onFocused(
          RemixSelectStyle().trigger(
            RemixSelectTriggerStyle().borderAll(
              color: $accent(),
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
        )
        .onDisabled(RemixSelectStyle().wrap(.opacity(0.5)))
        .variant(
          _InternalVariants.error,
          RemixSelectStyle().trigger(
            RemixSelectTriggerStyle().borderAll(color: $danger(), width: 1),
          ),
        )
        .animate(.ease(100.ms));
  }

  static RemixSelectStyle _variantStyles() {
    return RemixSelectStyle().variant(
      HeroSelectVariant.secondary,
      RemixSelectStyle().trigger(
        RemixSelectTriggerStyle()
            .color($default())
            .onHovered(RemixSelectTriggerStyle().color($defaultHover())),
      ),
    );
  }
}
