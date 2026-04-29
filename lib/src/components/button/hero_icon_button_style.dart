part of 'hero_icon_button.dart';

final class HeroIconButtonStyle {
  HeroIconButtonStyle._();

  static RemixIconButtonStyle baseStyle() {
    return RemixIconButtonStyle()
        .animate(.easeOut(100.ms))
        .onDisabled(RemixIconButtonStyle().wrap(.opacity(0.5)));
  }

  static RemixIconButtonStyle sizeStyle() {
    return RemixIconButtonStyle()
        .enumVariant(
          HeroButtonSize.sm,
          style: RemixIconButtonStyle()
              .scale(1)
              .height(32)
              .width(32)
              .borderRounded(24)
              .iconSize(16)
              .onPressed(RemixIconButtonStyle().container(.scale(0.97))),
        )
        .enumVariant(
          HeroButtonSize.md,
          style: RemixIconButtonStyle()
              .scale(1)
              .height(36)
              .width(36)
              .borderRounded(24)
              .iconSize(18)
              .onPressed(RemixIconButtonStyle().container(.scale(0.97))),
        )
        .enumVariant(
          HeroButtonSize.lg,
          style: RemixIconButtonStyle()
              .scale(1)
              .height(40)
              .width(40)
              .borderRounded(24)
              .iconSize(20)
              .onPressed(RemixIconButtonStyle().container(.scale(0.97))),
        );
  }

  static RemixIconButtonStyle variantStyles() {
    return RemixIconButtonStyle()
        .enumVariant(
          HeroButtonVariant.primary,
          style: RemixIconButtonStyle()
              .color($accent())
              .iconColor($accentForeground())
              .onHovered(RemixIconButtonStyle().color($accentHover()))
              .onPressed(RemixIconButtonStyle().color($accentHover())),
        )
        .enumVariant(
          HeroButtonVariant.secondary,
          style: RemixIconButtonStyle()
              .color($default())
              .iconColor($accentSoftForeground())
              .onHovered(RemixIconButtonStyle().color($defaultHover()))
              .onPressed(RemixIconButtonStyle().color($defaultHover())),
        )
        .enumVariant(
          HeroButtonVariant.tertiary,
          style: RemixIconButtonStyle()
              .color($default())
              .iconColor($defaultForeground())
              .onHovered(RemixIconButtonStyle().color($defaultHover()))
              .onPressed(RemixIconButtonStyle().color($defaultHover())),
        )
        .enumVariant(
          HeroButtonVariant.outline,
          style: RemixIconButtonStyle()
              .color(Colors.transparent)
              .borderAll(color: $border(), width: 1)
              .iconColor($defaultForeground()),
        )
        .enumVariant(
          HeroButtonVariant.ghost,
          style: RemixIconButtonStyle()
              .color(Colors.transparent)
              .iconColor($defaultForeground())
              .onHovered(RemixIconButtonStyle().color($default()))
              .onPressed(RemixIconButtonStyle().color($default())),
        )
        .enumVariant(
          HeroButtonVariant.danger,
          style: RemixIconButtonStyle()
              .color($danger())
              .iconColor($dangerForeground())
              .onHovered(RemixIconButtonStyle().color($dangerHover()))
              .onPressed(RemixIconButtonStyle().color($dangerHover())),
        )
        .enumVariant(
          HeroButtonVariant.dangerSoft,
          style: RemixIconButtonStyle()
              .color($dangerSoft())
              .iconColor($dangerSoftForeground())
              .onHovered(RemixIconButtonStyle().color($dangerSoftHover()))
              .onPressed(RemixIconButtonStyle().color($dangerSoftHover())),
        );
  }
}
