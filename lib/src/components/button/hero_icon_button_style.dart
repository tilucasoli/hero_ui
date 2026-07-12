part of 'hero_icon_button.dart';

final class HeroIconButtonStyle {
  HeroIconButtonStyle._();

  static RemixIconButtonStyler baseStyle() {
    return RemixIconButtonStyler()
        .animate(.easeOut(250.ms))
        .onDisabled(RemixIconButtonStyler().wrap(.opacity(0.5)));
  }

  static RemixIconButtonStyler sizeStyle() {
    return RemixIconButtonStyler()
        .variant(
          HeroButtonSize.sm,
          RemixIconButtonStyler()
              .scale(1)
              .height(32)
              .width(32)
              .borderRounded(24)
              .iconSize(16)
              .onPressed(RemixIconButtonStyler().container(.scale(0.98))),
        )
        .variant(
          HeroButtonSize.md,
          RemixIconButtonStyler()
              .scale(1)
              .height(36)
              .width(36)
              .borderRounded(24)
              .iconSize(16)
              .onPressed(RemixIconButtonStyler().container(.scale(0.97))),
        )
        .variant(
          HeroButtonSize.lg,
          RemixIconButtonStyler()
              .scale(1)
              .height(40)
              .width(40)
              .borderRounded(24)
              .iconSize(16)
              .onPressed(RemixIconButtonStyler().container(.scale(0.96))),
        )
        .variant(
          HeroButtonGroupVariant.group,
          RemixIconButtonStyler().borderRounded(0).border(.none),
        );
  }

  static RemixIconButtonStyler variantStyles() {
    return RemixIconButtonStyler()
        .variant(
          HeroButtonVariant.primary,
          RemixIconButtonStyler()
              .color($accent())
              .iconColor($accentForeground())
              .onHovered(RemixIconButtonStyler().color($accentHover()))
              .onPressed(RemixIconButtonStyler().color($accentHover())),
        )
        .variant(
          HeroButtonVariant.secondary,
          RemixIconButtonStyler()
              .color($default())
              .iconColor($accentSoftForeground())
              .onHovered(RemixIconButtonStyler().color($defaultHover()))
              .onPressed(RemixIconButtonStyler().color($defaultHover())),
        )
        .variant(
          HeroButtonVariant.tertiary,
          RemixIconButtonStyler()
              .color($default())
              .onHovered(RemixIconButtonStyler().color($defaultHover()))
              .onPressed(RemixIconButtonStyler().color($defaultHover())),
        )
        .variant(
          HeroButtonVariant.outline,
          RemixIconButtonStyler()
              .color(Colors.transparent)
              .borderAll(color: $border(), width: 1)
              .iconColor($defaultForeground())
              .onHovered(RemixIconButtonStyler().color($default()))
              .onPressed(RemixIconButtonStyler().color($default())),
        )
        .variant(
          HeroButtonVariant.ghost,
          RemixIconButtonStyler()
              .color(Colors.transparent)
              .iconColor($defaultForeground())
              .onHovered(RemixIconButtonStyler().color($default()))
              .onPressed(RemixIconButtonStyler().color($default())),
        )
        .variant(
          HeroButtonVariant.danger,
          RemixIconButtonStyler()
              .color($danger())
              .iconColor($dangerForeground())
              .onHovered(RemixIconButtonStyler().color($dangerHover()))
              .onPressed(RemixIconButtonStyler().color($dangerHover())),
        )
        .variant(
          HeroButtonVariant.dangerSoft,
          RemixIconButtonStyler()
              .color($dangerSoft())
              .iconColor($dangerSoftForeground())
              .onHovered(RemixIconButtonStyler().color($dangerSoftHover()))
              .onPressed(RemixIconButtonStyler().color($dangerSoftHover())),
        );
  }
}
