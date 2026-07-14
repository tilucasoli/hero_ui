import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

part 'hero_text_field.g.dart';

enum _InternalVariants with EnumVariant { fullWidth }

/// Styler recipe for `HeroTextField`.
///
/// `widgetParameters` keeps the generated widget API aligned with the curated
/// design-system surface instead of exposing the full editable-text API.
@MixWidget(
  widgetParameters: .only({
    'controller',
    'focusNode',
    'label',
    'hintText',
    'helperText',
    'leading',
    'trailing',
    'enabled',
    'readOnly',
    'obscureText',
    'autofocus',
    'error',
    'maxLines',
    'minLines',
    'maxLength',
    'keyboardType',
    'textInputAction',
    'onChanged',
    'onSubmitted',
    'onEditingComplete',
    'inputFormatters',
    'autofillHints',
    'semanticLabel',
  }),
)
RemixTextFieldStyler heroTextFieldStyle({
  bool fullWidth = false,
  RemixTextFieldStyler? style,
}) {
  return _baseStyle().merge(style).applyVariants([
    if (fullWidth) _InternalVariants.fullWidth,
  ]);
}

RemixTextFieldStyler _baseStyle() {
  return RemixTextFieldStyler()
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
      .text(
        TextStyler()
            .style($paragraphSmall.mix())
            .color($fieldForeground())
            .height(1.4),
      )
      .hintText(
        TextStyler().style($paragraphSmall.mix()).color($fieldPlaceholder()),
      )
      .label(
        TextStyler()
            .style($labelSmall.mix())
            .color($foreground())
            .wrap(.padding(.bottom(6))),
      )
      .helperText(
        TextStyler()
            .style($paragraphXSmall.mix())
            .color($muted())
            .wrap(.padding(.top(4))),
      )
      .cursorColor($accent())
      .spacing(4)
      .mainAxisSize(.min)
      .onFocused(
        RemixTextFieldStyler().container(
          FlexBoxStyler().borderAll(
            color: $accent(),
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
      )
      .onDisabled(RemixTextFieldStyler().wrap(.opacity(0.5)))
      .variant(ContextVariant.widgetState(.error), _errorStyle())
      .variant(
        _InternalVariants.fullWidth,
        RemixTextFieldStyler().mainAxisSize(.max),
      )
      .animate(.ease(100.ms));
}

RemixTextFieldStyler _errorStyle() {
  return RemixTextFieldStyler()
      .container(FlexBoxStyler().borderAll(color: $danger(), width: 1))
      .helperText(.color($danger()))
      .onFocused(
        RemixTextFieldStyler().container(
          FlexBoxStyler().borderAll(color: $danger(), width: 2),
        ),
      );
}
