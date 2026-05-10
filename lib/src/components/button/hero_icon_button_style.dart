part of 'hero_icon_button.dart';

final class HeroIconButtonStyle {
  HeroIconButtonStyle._();

  static RemixIconButtonStyle baseStyle() {
    return RemixIconButtonStyle()
        .animate(.easeOut(250.ms))
        .onDisabled(RemixIconButtonStyle().wrap(.opacity(0.5)));
  }

  static RemixIconButtonStyle sizeStyle() {
    return RemixIconButtonStyle()
        .variant(
          HeroButtonSize.sm,
          RemixIconButtonStyle()
              .scale(1)
              .height(32)
              .width(32)
              .borderRounded(24)
              .iconSize(16)
              .onPressed(RemixIconButtonStyle().container(.scale(0.98))),
        )
        .variant(
          HeroButtonSize.md,
          RemixIconButtonStyle()
              .scale(1)
              .height(36)
              .width(36)
              .borderRounded(24)
              .iconSize(16)
              .onPressed(RemixIconButtonStyle().container(.scale(0.97))),
        )
        .variant(
          HeroButtonSize.lg,
          RemixIconButtonStyle()
              .scale(1)
              .height(40)
              .width(40)
              .borderRounded(24)
              .iconSize(16)
              .onPressed(RemixIconButtonStyle().container(.scale(0.96))),
        )
        .variant(
          HeroButtonGroupVariant.group,
          RemixIconButtonStyle().borderRounded(0).border(.none),
        );
  }

  static RemixIconButtonStyle variantStyles() {
    return RemixIconButtonStyle()
        .variant(
          HeroButtonVariant.primary,
          RemixIconButtonStyle()
              .color($accent())
              .iconColor($accentForeground())
              .onHovered(RemixIconButtonStyle().color($accentHover()))
              .onPressed(RemixIconButtonStyle().color($accentHover())),
        )
        .variant(
          HeroButtonVariant.secondary,
          RemixIconButtonStyle()
              .color($default())
              .iconColor($accentSoftForeground())
              .onHovered(RemixIconButtonStyle().color($defaultHover()))
              .onPressed(RemixIconButtonStyle().color($defaultHover())),
        )
        .variant(
          HeroButtonVariant.tertiary,
          RemixIconButtonStyle()
              .color($default())
              .onHovered(RemixIconButtonStyle().color($defaultHover()))
              .onPressed(RemixIconButtonStyle().color($defaultHover())),
        )
        .variant(
          HeroButtonVariant.outline,
          RemixIconButtonStyle()
              .color(Colors.transparent)
              .borderAll(color: $border(), width: 1)
              .iconColor($defaultForeground())
              .onHovered(RemixIconButtonStyle().color($default()))
              .onPressed(RemixIconButtonStyle().color($default())),
        )
        .variant(
          HeroButtonVariant.ghost,
          RemixIconButtonStyle()
              .color(Colors.transparent)
              .iconColor($defaultForeground())
              .onHovered(RemixIconButtonStyle().color($default()))
              .onPressed(RemixIconButtonStyle().color($default())),
        )
        .variant(
          HeroButtonVariant.danger,
          RemixIconButtonStyle()
              .color($danger())
              .iconColor($dangerForeground())
              .onHovered(RemixIconButtonStyle().color($dangerHover()))
              .onPressed(RemixIconButtonStyle().color($dangerHover())),
        )
        .variant(
          HeroButtonVariant.dangerSoft,
          RemixIconButtonStyle()
              .color($dangerSoft())
              .iconColor($dangerSoftForeground())
              .onHovered(RemixIconButtonStyle().color($dangerSoftHover()))
              .onPressed(RemixIconButtonStyle().color($dangerSoftHover())),
        );
  }
}
