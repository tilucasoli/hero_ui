import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

enum HeroSelectVariant { primary, secondary }

final class HeroSelectStyle {
  HeroSelectStyle._();

  static RemixSelectStyle resolve({
    HeroSelectVariant variant = HeroSelectVariant.primary,
    bool fullWidth = false,
    bool error = false,
  }) {
    var style = _baseStyle().merge(_variantStyle(variant));

    if (error) {
      style = style.merge(_errorStyle());
    }

    return style;
  }

  static RemixSelectMenuItemStyle itemStyle() {
    return RemixSelectMenuItemStyle()
        .color(Colors.transparent)
        .borderRadiusAll(Radius.circular(8))
        .paddingX(10)
        .height(32)
        .text(TextStyler().style($paragraphSmall.mix()).color($foreground()))
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
              .label(TextStyler().style($paragraphSmall.mix()).color($fieldForeground()).height(1.4))
              .icon(.color($fieldForeground()).size(12)),
        )
        .menuContainer(
          FlexBoxStyler()
              .color($overlay())
              .borderRadiusAll(Radius.circular(12))
              .borderAll(color: $border(), width: 1)
              .paddingAll(6)
              .marginTop(4)
              .shadow(
                .color(Color(0x1A000000)).blurRadius(16).offset(x: 0, y: 8),
              ),
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
        .onDisabled(_disabledStyle())
        .animate(.ease(100.ms));
  }

  static RemixSelectStyle _variantStyle(HeroSelectVariant variant) {
    return switch (variant) {
      HeroSelectVariant.primary => RemixSelectStyle(),
      HeroSelectVariant.secondary => RemixSelectStyle().trigger(
        RemixSelectTriggerStyle()
            .color($default())
            .onHovered(RemixSelectTriggerStyle().color($defaultHover())),
      ),
    };
  }

  static RemixSelectStyle _disabledStyle() {
    return RemixSelectStyle().wrap(.opacity(0.5));
  }

  static RemixSelectStyle _errorStyle() {
    return RemixSelectStyle()
        .trigger(
          RemixSelectTriggerStyle().borderAll(color: $danger(), width: 1),
        )
        .onFocused(
          RemixSelectStyle().trigger(
            RemixSelectTriggerStyle().borderAll(color: $danger(), width: 2),
          ),
        );
  }
}
