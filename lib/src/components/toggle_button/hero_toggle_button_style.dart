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

  static RemixToggleStyler baseStyle() {
    return RemixToggleStyler()
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
        .onPressed(RemixToggleStyler().container(.scale(0.97)))
        // Selected state is shared across variants (accent-soft).
        .onDisabled(RemixToggleStyler().wrap(.opacity(0.5)));
  }

  static RemixToggleStyler sizeStyle() {
    return RemixToggleStyler()
        .variant(
          HeroToggleButtonSize.sm,
          RemixToggleStyler()
              .height(32)
              .paddingX(12)
              .labelStyle($labelSmall.mix())
              .iconSize(16)
              .onPressed(RemixToggleStyler().container(.scale(0.98))),
        )
        .variant(
          HeroToggleButtonSize.md,
          RemixToggleStyler()
              .height(36)
              .paddingX(16)
              .labelStyle($labelSmall.mix())
              .iconSize(16),
        )
        .variant(
          HeroToggleButtonSize.lg,
          RemixToggleStyler()
              .height(40)
              .paddingX(16)
              .labelStyle($labelMedium.mix())
              .iconSize(16)
              .onPressed(RemixToggleStyler().container(.scale(0.96))),
        );
  }

  static RemixToggleStyler variantStyles() {
    return RemixToggleStyler()
        .onHovered(RemixToggleStyler().backgroundColor($default()))
        .onPressed(RemixToggleStyler().backgroundColor($default()))
        .variant(
          HeroToggleButtonVariant.defaultVariant,
          RemixToggleStyler()
              .backgroundColor($default())
              .foregroundColor($defaultForeground()),
        )
        .variant(
          HeroToggleButtonVariant.ghost,
          RemixToggleStyler()
              .backgroundColor(Colors.transparent)
              .foregroundColor($defaultForeground()),
        )
        .variant(
          HeroToggleButtonGroupVariant.group,
          RemixToggleStyler().borderRounded(0).border(.none),
        )
        .onSelected(
          RemixToggleStyler()
              .backgroundColor($accentSoft())
              .foregroundColor($accentSoftForeground())
              .onHovered(RemixToggleStyler().backgroundColor($accentSoftHover()))
              .onPressed(
                RemixToggleStyler().backgroundColor($accentSoftHover()),
              ),
        );
  }

  /// Icon-only toggles are square with no horizontal padding
  /// (`.toggle-button--icon-only`).
  static RemixToggleStyler iconOnlyStyle(HeroToggleButtonSize size) {
    final side = switch (size) {
      HeroToggleButtonSize.sm => 32.0,
      HeroToggleButtonSize.md => 36.0,
      HeroToggleButtonSize.lg => 40.0,
    };

    return RemixToggleStyler().paddingX(0).width(side);
  }
}
