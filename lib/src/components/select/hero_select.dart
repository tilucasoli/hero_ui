import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

part 'hero_select.g.dart';

typedef HeroSelectTrigger = RemixSelectTrigger;
typedef HeroSelectItem<T> = RemixSelectItem<T>;

enum HeroSelectVariant with EnumVariant { primary, secondary }

enum _InternalVariants with EnumVariant { error }

@MixWidget(
  widgetParameters: .only({
    'trigger',
    'items',
    'selectedValue',
    'onChanged',
    'onOpen',
    'onClose',
    'enabled',
    'closeOnSelect',
    'semanticLabel',
    'focusNode',
  }),
)
RemixSelectStyler heroSelectStyle({
  HeroSelectVariant variant = .primary,
  bool error = false,
  RemixSelectStyler? style,
}) {
  return _baseStyle().merge(_variantStyles()).merge(style).applyVariants([
    variant,
    if (error) _InternalVariants.error,
  ]);
}

RemixSelectMenuItemStyler _itemStyle() {
  return RemixSelectMenuItemStyler()
      .color(Colors.transparent)
      .borderRadiusAll(Radius.circular(20))
      .paddingX(12)
      .paddingY(6)
      .minHeight(36)
      .text(TextStyler().style($labelSmall.mix()).color($defaultForeground()))
      .icon(.color($muted()).size(16))
      .onHovered(RemixSelectMenuItemStyler().color($default()));
}

RemixSelectStyler _baseStyle() {
  return RemixSelectStyler()
      .trigger(
        RemixSelectTriggerStyler()
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
      .item(_itemStyle())
      .onFocused(
        RemixSelectStyler().trigger(
          RemixSelectTriggerStyler().borderAll(
            color: $accent(),
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
      )
      .onDisabled(RemixSelectStyler().wrap(.opacity(0.5)))
      .variant(
        _InternalVariants.error,
        RemixSelectStyler().trigger(
          RemixSelectTriggerStyler().borderAll(color: $danger(), width: 1),
        ),
      )
      .animate(.ease(100.ms));
}

RemixSelectStyler _variantStyles() {
  return RemixSelectStyler().variant(
    HeroSelectVariant.secondary,
    RemixSelectStyler().trigger(
      RemixSelectTriggerStyler()
          .color($default())
          .onHovered(RemixSelectTriggerStyler().color($defaultHover())),
    ),
  );
}
