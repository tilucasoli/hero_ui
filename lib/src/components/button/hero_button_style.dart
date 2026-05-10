part of 'hero_button.dart';

enum HeroButtonVariant with EnumVariant {
  primary,
  secondary,
  tertiary,
  outline,
  ghost,
  danger,
  dangerSoft,
}

enum HeroButtonSize with EnumVariant { sm, md, lg }

enum _InternalVariants with EnumVariant { fullWidth }

final class HeroButtonStyle {
  HeroButtonStyle._();

  static RemixButtonStyle baseStyle() {
    return RemixButtonStyle()
        .mainAxisSize(.min)
        .mainAxisAlignment(.center)
        .crossAxisAlignment(.center)
        .spacing(8)
        .label(
          .textHeightBehavior(
            TextHeightBehaviorMix()
                .applyHeightToFirstAscent(false)
                .applyHeightToLastDescent(false),
          ),
        )
        .spinner(RemixSpinnerStyle().size(16).strokeWidth(0.8))
        .animate(.easeOut(250.ms))
        .variant(
          _InternalVariants.fullWidth,
          RemixButtonStyle().mainAxisSize(.max),
        )
        .onDisabled(RemixButtonStyle().wrap(.opacity(0.5)));
  }

  static RemixButtonStyle sizeStyle() {
    return RemixButtonStyle()
        .variant(
          HeroButtonSize.sm,
          RemixButtonStyle()
              .scale(1)
              .height(32)
              .paddingX(12)
              .borderRounded(24)
              .labelStyle($labelSmall.mix())
              .iconSize(16)
              .onPressed(RemixButtonStyle().container(.scale(0.98))),
        )
        .variant(
          HeroButtonSize.md,
          RemixButtonStyle()
              .height(36)
              .paddingX(16)
              .scale(1)
              .borderRounded(24)
              .labelStyle($labelSmall.mix())
              .iconSize(16)
              .onPressed(.new().container(.scale(0.97))),
        )
        .variant(
          HeroButtonSize.lg,
          RemixButtonStyle()
              .height(40)
              .paddingX(16)
              .scale(1)
              .borderRounded(24)
              .labelStyle($labelMedium.mix())
              .iconSize(16)
              .onPressed(.new().container(.scale(0.96))),
        )
        .variant(
          HeroButtonGroupVariant.group,
          RemixButtonStyle().borderRounded(0),
        );
  }

  static RemixButtonStyle variantStyles() {
    return RemixButtonStyle()
        .variant(
          HeroButtonVariant.primary,
          RemixButtonStyle()
              .color($accent())
              .foregroundColorWithSpinner($accentForeground())
              .onHovered(RemixButtonStyle().color($accentHover()))
              .onPressed(RemixButtonStyle().color($accentHover())),
        )
        .variant(
          HeroButtonVariant.secondary,
          RemixButtonStyle()
              .color($default())
              .foregroundColorWithSpinner($accentSoftForeground())
              .onHovered(RemixButtonStyle().color($defaultHover()))
              .onPressed(RemixButtonStyle().color($defaultHover())),
        )
        .variant(
          HeroButtonVariant.tertiary,
          RemixButtonStyle()
              .color($default())
              .onHovered(RemixButtonStyle().color($defaultHover()))
              .onPressed(RemixButtonStyle().color($defaultHover())),
        )
        .variant(
          HeroButtonVariant.outline,
          RemixButtonStyle()
              .color(Colors.transparent)
              .borderAll(color: $border(), width: 1)
              .foregroundColorWithSpinner($defaultForeground())
              .onHovered(RemixButtonStyle().color($default()))
              .onPressed(RemixButtonStyle().color($default())),
        )
        .variant(
          HeroButtonVariant.ghost,
          RemixButtonStyle()
              .color(Colors.transparent)
              .foregroundColorWithSpinner($defaultForeground())
              .onHovered(RemixButtonStyle().color($default()))
              .onPressed(RemixButtonStyle().color($default())),
        )
        .variant(
          HeroButtonVariant.danger,
          RemixButtonStyle()
              .color($danger())
              .foregroundColorWithSpinner($dangerForeground())
              .onHovered(RemixButtonStyle().color($dangerHover()))
              .onPressed(RemixButtonStyle().color($dangerHover())),
        )
        .variant(
          HeroButtonVariant.dangerSoft,
          RemixButtonStyle()
              .color($dangerSoft())
              .foregroundColorWithSpinner($dangerSoftForeground())
              .onHovered(RemixButtonStyle().color($dangerSoftHover()))
              .onPressed(RemixButtonStyle().color($dangerSoftHover())),
        )
        .variant(
          HeroButtonGroupVariant.group,
          RemixButtonStyle().borderRounded(0).border(.none),
        );
  }
}

extension on RemixButtonStyle {
  RemixButtonStyle foregroundColorWithSpinner(Color color) {
    return spinner(
      RemixSpinnerStyle().indicatorColor(color),
    ).foregroundColor(color);
  }
}
