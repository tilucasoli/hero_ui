import 'package:flutter/widgets.dart';
import 'package:hero_ui/hero_ui.dart';
import 'package:remix/remix.dart';

enum HeroButtonGroupVariant with EnumVariant { group }

final class HeroButtonGroupStyle {
  HeroButtonGroupStyle._();

  static FlexBoxStyler groupStyle({
    required Axis orientation,
    required bool fullWidth,
  }) {
    return FlexBoxStyler()
        .direction(orientation)
        .mainAxisSize(fullWidth ? .max : .min)
        .borderRounded(24)
        .clipBehavior(.antiAlias)
        .variant(HeroButtonVariant.primary, .color($accent()))
        .variant(HeroButtonVariant.secondary, .color($default()))
        .variant(HeroButtonVariant.tertiary, .color($default()))
        .variant(HeroButtonVariant.danger, .color($danger()))
        .variant(HeroButtonVariant.dangerSoft, .color($dangerSoft()))
        .variant(
          HeroButtonVariant.outline,
          FlexBoxStyler().border(
            BorderMix()
                .color($border())
                .strokeAlign(BorderSide.strokeAlignOutside)
                .width(1),
          ),
        );
  }
}
