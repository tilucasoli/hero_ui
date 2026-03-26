import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../button/hero_button_style.dart';

final class HeroButtonGroupStyle {
  HeroButtonGroupStyle._();

  static RemixButtonStyle buttonOverride() {
    return RemixButtonStyle()
        .borderRounded(0)
        .border(.none)
        .onPressed(.new().scale(1.0));
  }

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
                  $border(),
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
