import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../toggle_button/hero_toggle_button.dart';

enum HeroToggleButtonGroupVariant with EnumVariant { group }

final class HeroToggleButtonGroupStyle {
  HeroToggleButtonGroupStyle._();

  static FlexBoxStyler groupStyle({
    required Axis orientation,
    required bool fullWidth,
  }) {
    return FlexBoxStyler()
        .direction(orientation)
        .mainAxisSize(fullWidth ? .max : .min)
        .borderRounded(24)
        .clipBehavior(.antiAlias)
        .border(BorderMix().color($border()).width(1))
        .variant(
          HeroToggleButtonVariant.defaultVariant,
          FlexBoxStyler().color($default()),
        );
  }
}
