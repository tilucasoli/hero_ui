import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../toggle_button_group/hero_toggle_button_group_style.dart';

part 'hero_toggle_button.g.dart';

enum HeroToggleButtonVariant with EnumVariant { defaultVariant, ghost }

enum HeroToggleButtonSize with EnumVariant { sm, md, lg }

/// A pressable button that stays visually active while [selected].
///
/// Unlike [HeroSwitch], which is a sliding on/off control, a toggle button is
/// a button that reflects an on/off state in place. At least one of [label] or
/// [icon] must be provided.
///
@MixWidget(
  widgetParameters: .only({
    'selected',
    'onChanged',
    'enabled',
    'label',
    'icon',
    'enableFeedback',
    'focusNode',
    'autofocus',
    'semanticLabel',
  }),
)
RemixToggleStyler heroToggleButtonStyle({
  HeroToggleButtonVariant variant = .defaultVariant,
  HeroToggleButtonSize size = .md,
  bool iconOnly = false,
  bool grouped = false,
  RemixToggleStyler? style,
}) {
  return _baseStyle()
      .merge(_sizeStyle())
      .merge(_variantStyles())
      .merge(iconOnly ? _iconOnlyStyle(size) : null)
      .merge(style)
      .applyVariants([
        variant,
        size,
        if (grouped) HeroToggleButtonGroupVariant.group,
      ]);
}

RemixToggleStyler _baseStyle() {
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
      .onDisabled(RemixToggleStyler().wrap(.opacity(0.5)));
}

RemixToggleStyler _sizeStyle() {
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

RemixToggleStyler _variantStyles() {
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
            .onPressed(RemixToggleStyler().backgroundColor($accentSoftHover())),
      );
}

RemixToggleStyler _iconOnlyStyle(HeroToggleButtonSize size) {
  final side = switch (size) {
    HeroToggleButtonSize.sm => 32.0,
    HeroToggleButtonSize.md => 36.0,
    HeroToggleButtonSize.lg => 40.0,
  };

  return RemixToggleStyler().paddingX(0).width(side);
}
