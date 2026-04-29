import 'package:flutter/widgets.dart';
import 'package:hero_ui/hero_ui.dart';
import 'package:hero_ui/src/utils/inherited_variant.dart';
import 'package:remix/remix.dart';

enum HeroButtonGroupVariant with EnumVariant { group }

final class HeroButtonGroupStyle {
  HeroButtonGroupStyle._();

  static FlexBoxStyler groupStyle({
    required Axis orientation,
    required bool fullWidth,
    required HeroButtonVariant variant,
  }) {
    final outlineStyle =
        FlexBoxStyler() //
            .border(
              .all(
                .color(
                  $separator(),
                ).strokeAlign(BorderSide.strokeAlignOutside).width(1),
              ),
            );

    return FlexBoxStyler()
        .direction(orientation)
        .mainAxisSize(fullWidth ? .max : .min)
        .borderRounded(24)
        .clipBehavior(.antiAlias)
        .merge(variant == .outline ? outlineStyle : null);
  }
}
