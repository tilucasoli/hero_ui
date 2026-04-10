part of 'hero_text_field.dart';

enum _InternalVariants with EnumVariant { fullWidth }

final class HeroTextFieldStyle {
  HeroTextFieldStyle._();

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
        .text(TextStyler().style($paragraphSmall.mix()).color($fieldForeground()).height(1.4))
        .hintText(TextStyler().style($paragraphSmall.mix()).color($fieldPlaceholder()))
        .label(
          TextStyler().style($labelSmall.mix()).color($foreground()).wrap(.padding(.bottom(6))),
        )
        .helperText(TextStyler().style($paragraphXSmall.mix()).color($muted()).wrap(.padding(.top(4))))
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
        .onDisabled(RemixTextFieldStyle().wrap(.opacity(0.5)))
        .variant(ContextVariant.widgetState(.error), _errorStyle())
        .enumVariant(
          _InternalVariants.fullWidth,
          style: RemixTextFieldStyle().mainAxisSize(.max),
        )
        .animate(.ease(100.ms));
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
