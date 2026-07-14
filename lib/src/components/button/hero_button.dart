import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../button_group/hero_button_group_style.dart';

part 'hero_button.g.dart';

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

@MixWidget(
  widgetParameters: .only({
    'label',
    'leadingIcon',
    'trailingIcon',
    'loading',
    'enabled',
    'onPressed',
  }),
)
RemixButtonStyler heroButtonStyle({
  HeroButtonVariant variant = .primary,
  HeroButtonSize size = .md,
  bool fullWidth = false,
  bool grouped = false,
  RemixButtonStyler? style,
}) {
  return _baseStyle()
      .merge(_sizeStyle())
      .merge(_variantStyles())
      .merge(style)
      .applyVariants([
        variant,
        size,
        if (grouped) HeroButtonGroupVariant.group,
        if (fullWidth) _InternalVariants.fullWidth,
      ]);
}

RemixButtonStyler _baseStyle() {
  return RemixButtonStyler()
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
      .spinner(RemixSpinnerStyler().size(16).strokeWidth(0.8))
      .animate(.easeOut(250.ms))
      .variant(
        _InternalVariants.fullWidth,
        RemixButtonStyler().mainAxisSize(.max),
      )
      .onDisabled(RemixButtonStyler().wrap(.opacity(0.5)));
}

RemixButtonStyler _sizeStyle() {
  return RemixButtonStyler()
      .variant(
        HeroButtonSize.sm,
        RemixButtonStyler()
            .scale(1)
            .height(32)
            .paddingX(12)
            .borderRounded(24)
            .labelStyle($labelSmall.mix())
            .iconSize(16)
            .onPressed(RemixButtonStyler().container(.scale(0.98))),
      )
      .variant(
        HeroButtonSize.md,
        RemixButtonStyler()
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
        RemixButtonStyler()
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
        RemixButtonStyler().borderRounded(0),
      );
}

RemixButtonStyler _variantStyles() {
  return RemixButtonStyler()
      .variant(
        HeroButtonVariant.primary,
        RemixButtonStyler()
            .color($accent())
            .foregroundColorWithSpinner($accentForeground())
            .onHovered(RemixButtonStyler().color($accentHover()))
            .onPressed(RemixButtonStyler().color($accentHover())),
      )
      .variant(
        HeroButtonVariant.secondary,
        RemixButtonStyler()
            .color($default())
            .foregroundColorWithSpinner($accentSoftForeground())
            .onHovered(RemixButtonStyler().color($defaultHover()))
            .onPressed(RemixButtonStyler().color($defaultHover())),
      )
      .variant(
        HeroButtonVariant.tertiary,
        RemixButtonStyler()
            .color($default())
            .onHovered(RemixButtonStyler().color($defaultHover()))
            .onPressed(RemixButtonStyler().color($defaultHover())),
      )
      .variant(
        HeroButtonVariant.outline,
        RemixButtonStyler()
            .color(Colors.transparent)
            .borderAll(color: $border(), width: 1)
            .foregroundColorWithSpinner($defaultForeground())
            .onHovered(RemixButtonStyler().color($default()))
            .onPressed(RemixButtonStyler().color($default())),
      )
      .variant(
        HeroButtonVariant.ghost,
        RemixButtonStyler()
            .color(Colors.transparent)
            .foregroundColorWithSpinner($defaultForeground())
            .onHovered(RemixButtonStyler().color($default()))
            .onPressed(RemixButtonStyler().color($default())),
      )
      .variant(
        HeroButtonVariant.danger,
        RemixButtonStyler()
            .color($danger())
            .foregroundColorWithSpinner($dangerForeground())
            .onHovered(RemixButtonStyler().color($dangerHover()))
            .onPressed(RemixButtonStyler().color($dangerHover())),
      )
      .variant(
        HeroButtonVariant.dangerSoft,
        RemixButtonStyler()
            .color($dangerSoft())
            .foregroundColorWithSpinner($dangerSoftForeground())
            .onHovered(RemixButtonStyler().color($dangerSoftHover()))
            .onPressed(RemixButtonStyler().color($dangerSoftHover())),
      )
      .variant(
        HeroButtonGroupVariant.group,
        RemixButtonStyler().borderRounded(0).border(.none),
      );
}

extension on RemixButtonStyler {
  RemixButtonStyler foregroundColorWithSpinner(Color color) {
    return spinner(
      RemixSpinnerStyler().indicatorColor(color),
    ).foregroundColor(color);
  }
}
