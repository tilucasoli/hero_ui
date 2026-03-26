import 'package:flutter/painting.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

final class HeroTextFieldStyle {
  HeroTextFieldStyle._();

  static RemixTextFieldStyle resolve({bool fullWidth = false}) {
    var style = _baseStyle();

    if (fullWidth) {
      style = style.mainAxisSize(.max);
    }

    return style;
  }

  static RemixTextFieldStyle _baseStyle() {
    return RemixTextFieldStyle()
        .container(
          .color($fieldBackground())
              .borderAll(
                color: $fieldBorder(),
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              )
              .borderRadiusAll($fieldRadius())
              .paddingX(12)
              .paddingY(8),
        )
        .text(.color($fieldForeground()).fontSize(14).height(1.4))
        .hintText(.color($fieldPlaceholder()).fontSize(14))
        .label(
          .color(
            $foreground(),
          ).fontWeight(.w500).fontSize(14).wrap(.padding(.bottom(6))),
        )
        .helperText(.color($muted()).fontSize(12).wrap(.padding(.top(4))))
        .cursorColor($accent())
        .spacing(4)
        .mainAxisSize(.min)
        .onFocused(
          RemixTextFieldStyle().container(
            FlexBoxStyler().borderAll(
              color: $accent(),
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
        )
        .onDisabled(_disabledStyle())
        .variant(ContextVariant.widgetState(.error), _errorStyle())
        .animate(.ease(100.ms));
  }

  static RemixTextFieldStyle _disabledStyle() {
    return RemixTextFieldStyle().wrap(.opacity(0.5));
  }

  static RemixTextFieldStyle _errorStyle() {
    return RemixTextFieldStyle()
        .container(FlexBoxStyler().borderAll(color: $danger(), width: 1))
        .helperText(.color($danger()))
        .onFocused(
          RemixTextFieldStyle().container(
            FlexBoxStyler().borderAll(color: $danger(), width: 2),
          ),
        );
  }
}
