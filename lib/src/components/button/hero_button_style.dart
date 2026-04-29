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
        .animate(.easeOut(100.ms))
        .enumVariant(
          _InternalVariants.fullWidth,
          style: RemixButtonStyle().mainAxisSize(.max),
        )
        .onDisabled(RemixButtonStyle().wrap(.opacity(0.5)));
  }

  static RemixButtonStyle sizeStyle() {
    return RemixButtonStyle()
        .enumVariant(
          HeroButtonSize.sm,
          style: RemixButtonStyle()
              .scale(1)
              .height(32)
              .paddingX(12)
              .borderRounded(24)
              .labelStyle($labelSmall.mix())
              .iconSize(16)
              .onPressed(RemixButtonStyle().container(.scale(0.97))),
        )
        .enumVariant(
          HeroButtonSize.md,
          style: RemixButtonStyle()
              .height(36)
              .paddingX(16)
              .scale(1)
              .borderRounded(24)
              .labelStyle($labelSmall.mix())
              .iconSize(18)
              .onPressed(.new().container(.scale(0.97))),
        )
        .enumVariant(
          HeroButtonSize.lg,
          style: RemixButtonStyle()
              .height(40)
              .paddingX(16)
              .scale(1)
              .borderRounded(24)
              .labelStyle($labelMedium.mix())
              .iconSize(20)
              .onPressed(.new().container(.scale(0.97))),
        )
        .enumVariant(
          HeroButtonGroupVariant.group,
          style: RemixButtonStyle().borderRounded(0),
        );
  }

  static RemixButtonStyle variantStyles() {
    return RemixButtonStyle()
        .enumVariant(
          HeroButtonVariant.primary,
          style: RemixButtonStyle()
              .color($accent())
              .labelColor($accentForeground())
              .iconColor($accentForeground())
              .onHovered(RemixButtonStyle().color($accentHover()))
              .onPressed(RemixButtonStyle().color($accentHover())),
        )
        .enumVariant(
          HeroButtonVariant.secondary,
          style: RemixButtonStyle()
              .color($default())
              .labelColor($accentSoftForeground())
              .iconColor($accentSoftForeground())
              .onHovered(RemixButtonStyle().color($defaultHover()))
              .onPressed(RemixButtonStyle().color($defaultHover())),
        )
        .enumVariant(
          HeroButtonVariant.tertiary,
          style: RemixButtonStyle()
              .color($default())
              .labelColor($defaultForeground())
              .iconColor($defaultForeground())
              .onHovered(RemixButtonStyle().color($defaultHover()))
              .onPressed(RemixButtonStyle().color($defaultHover())),
        )
        .enumVariant(
          HeroButtonVariant.outline,
          style: RemixButtonStyle()
              .color(Colors.transparent)
              .borderAll(color: $border(), width: 1)
              .labelColor($defaultForeground()),
        )
        .enumVariant(
          HeroButtonVariant.ghost,
          style: RemixButtonStyle()
              .color(Colors.transparent)
              .labelColor($defaultForeground())
              .iconColor($defaultForeground())
              .onHovered(RemixButtonStyle().color($default()))
              .onPressed(RemixButtonStyle().color($default())),
        )
        .enumVariant(
          HeroButtonVariant.danger,
          style: RemixButtonStyle()
              .color($danger())
              .labelColor($dangerForeground())
              .iconColor($dangerForeground())
              .onHovered(RemixButtonStyle().color($dangerHover()))
              .onPressed(RemixButtonStyle().color($dangerHover())),
        )
        .enumVariant(
          HeroButtonVariant.dangerSoft,
          style: RemixButtonStyle()
              .color($dangerSoft())
              .labelColor($dangerSoftForeground())
              .iconColor($dangerSoftForeground())
              .onHovered(RemixButtonStyle().color($dangerSoftHover()))
              .onPressed(RemixButtonStyle().color($dangerSoftHover())),
        )
        .enumVariant(
          HeroButtonGroupVariant.group,
          style: RemixButtonStyle().borderRounded(0).border(.none),
        );
  }
}
