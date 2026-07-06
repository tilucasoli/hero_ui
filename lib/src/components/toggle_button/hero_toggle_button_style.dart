part of 'hero_toggle_button.dart';

/// Visual variants for [HeroToggleButton], mirroring HeroUI's
/// `toggle-button.css` (`.toggle-button--default` and `.toggle-button--ghost`).
///
/// Both variants share the same *selected* appearance (accent-soft); they
/// differ only in the unselected background.
enum HeroToggleButtonVariant with EnumVariant { defaultVariant, ghost }

enum HeroToggleButtonSize with EnumVariant { sm, md, lg }

final class HeroToggleButtonStyle {
  HeroToggleButtonStyle._();

  static RemixToggleStyle baseStyle() {
    return RemixToggleStyle()
        .mainAxisSize(.min)
        .mainAxisAlignment(.center)
        .crossAxisAlignment(.center)
        .spacing(8)
        .borderRounded(24)
        .labelFontWeight(.w500)
        .label(
          .textHeightBehavior(
            TextHeightBehaviorMix()
                .applyHeightToFirstAscent(false)
                .applyHeightToLastDescent(false),
          ),
        )
        .animate(.easeOut(250.ms))
        .onPressed(RemixToggleStyle().container(.scale(0.97)))
        // Selected state is shared across variants (accent-soft).
        .onDisabled(RemixToggleStyle().wrap(.opacity(0.5)));
  }

  static RemixToggleStyle sizeStyle() {
    return RemixToggleStyle()
        .variant(
          HeroToggleButtonSize.sm,
          RemixToggleStyle()
              .height(32)
              .paddingX(12)
              .labelStyle($labelSmall.mix())
              .iconSize(16)
              .onPressed(RemixToggleStyle().container(.scale(0.98))),
        )
        .variant(
          HeroToggleButtonSize.md,
          RemixToggleStyle()
              .height(36)
              .paddingX(16)
              .labelStyle($labelSmall.mix())
              .iconSize(16),
        )
        .variant(
          HeroToggleButtonSize.lg,
          RemixToggleStyle()
              .height(40)
              .paddingX(16)
              .labelStyle($labelMedium.mix())
              .iconSize(16)
              .onPressed(RemixToggleStyle().container(.scale(0.96))),
        );
  }

  static RemixToggleStyle variantStyles() {
    return RemixToggleStyle()
        .onHovered(RemixToggleStyle().backgroundColor($default()))
        .onPressed(RemixToggleStyle().backgroundColor($default()))
        .variant(
          HeroToggleButtonVariant.defaultVariant,
          RemixToggleStyle()
              .backgroundColor($default())
              .foregroundColor($defaultForeground()),
        )
        .variant(
          HeroToggleButtonVariant.ghost,
          RemixToggleStyle()
              .backgroundColor(Colors.transparent)
              .foregroundColor($defaultForeground()),
        )
        .variant(
          HeroToggleButtonGroupVariant.group,
          RemixToggleStyle().borderRounded(0).border(.none),
        )
        .onSelected(
          RemixToggleStyle()
              .backgroundColor($accentSoft())
              .foregroundColor($accentSoftForeground())
              .onHovered(RemixToggleStyle().backgroundColor($accentSoftHover()))
              .onPressed(
                RemixToggleStyle().backgroundColor($accentSoftHover()),
              ),
        );
  }

  /// Icon-only toggles are square with no horizontal padding
  /// (`.toggle-button--icon-only`).
  static RemixToggleStyle iconOnlyStyle(HeroToggleButtonSize size) {
    final side = switch (size) {
      HeroToggleButtonSize.sm => 32.0,
      HeroToggleButtonSize.md => 36.0,
      HeroToggleButtonSize.lg => 40.0,
    };

    return RemixToggleStyle().paddingX(0).width(side);
  }
}
