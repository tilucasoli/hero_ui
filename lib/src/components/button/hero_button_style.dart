import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import 'hero_button_variants.dart';

class HeroButtonStyle {
  HeroButtonStyle._();

  static RemixButtonStyle resolve({
    required HeroButtonVariant variant,
    required HeroButtonSize size,
    bool isIconOnly = false,
    bool fullWidth = false,
  }) {
    final sizeStyle = _sizeStyle(size, isIconOnly: isIconOnly);
    final variantStyle = _variantStyle(variant);

    var style = _baseStyle().merge(sizeStyle).merge(variantStyle);

    if (fullWidth) {
      style = style.mainAxisSize(.max);
    }

    return style;
  }

  static RemixButtonStyle _baseStyle() {
    return RemixButtonStyle()
        .mainAxisSize(.min)
        .mainAxisAlignment(.center)
        .crossAxisAlignment(.center)
        .spacing(8)
        .labelFontWeight(.w500)
        .animate(.easeOut(100.ms));
  }

  static RemixButtonStyle _sizeStyle(
    HeroButtonSize size, {
    bool isIconOnly = false,
  }) {
    return switch (size) {
      HeroButtonSize.sm => RemixButtonStyle()
          .height(32)
          .paddingX(isIconOnly ? 0 : 12)
          .then((s) => isIconOnly ? s.width(32) : s)
          .borderRounded(24)
          .labelFontSize(14)
          .iconSize(16)
          .onPressed(RemixButtonStyle().scale(0.98)),
      HeroButtonSize.md => RemixButtonStyle()
          .height(36)
          .paddingX(isIconOnly ? 0 : 16)
          .then((s) => isIconOnly ? s.width(36) : s)
          .borderRounded(24)
          .labelFontSize(14)
          .iconSize(18)
          .onPressed(RemixButtonStyle().scale(0.97)),
      HeroButtonSize.lg => RemixButtonStyle()
          .height(40)
          .paddingX(isIconOnly ? 0 : 16)
          .then((s) => isIconOnly ? s.width(40) : s)
          .borderRounded(24)
          .labelFontSize(16)
          .iconSize(20)
          .onPressed(RemixButtonStyle().scale(0.96)),
    };
  }

  static RemixButtonStyle _variantStyle(HeroButtonVariant variant) {
    return switch (variant) {
      HeroButtonVariant.primary => RemixButtonStyle()
          .color($accent())
          .labelColor($accentForeground())
          .iconColor($accentForeground())
          .onHovered(RemixButtonStyle().color($accentHover()))
          .onPressed(RemixButtonStyle().color($accentHover()))
          .onDisabled(
            RemixButtonStyle()
                .color($accent())
                .labelColor($accentForeground())
                .iconColor($accentForeground()),
          ),
      HeroButtonVariant.secondary => RemixButtonStyle()
          .color($default())
          .labelColor($accentSoftForeground())
          .iconColor($accentSoftForeground())
          .onHovered(RemixButtonStyle().color($defaultHover()))
          .onPressed(RemixButtonStyle().color($defaultHover()))
          .onDisabled(
            RemixButtonStyle()
                .color($default())
                .labelColor($accentSoftForeground())
                .iconColor($accentSoftForeground()),
          ),
      HeroButtonVariant.tertiary => RemixButtonStyle()
          .color($default())
          .labelColor($defaultForeground())
          .iconColor($defaultForeground())
          .onHovered(RemixButtonStyle().color($defaultHover()))
          .onPressed(RemixButtonStyle().color($defaultHover()))
          .onDisabled(
            RemixButtonStyle()
                .color($default())
                .labelColor($defaultForeground())
                .iconColor($defaultForeground()),
          ),
      HeroButtonVariant.outline => RemixButtonStyle()
          .color(Colors.transparent)
          .borderAll(color: $border(), width: 1)
          .labelColor($defaultForeground())
          .iconColor($defaultForeground())
          .onHovered(RemixButtonStyle().color($default()))
          .onPressed(RemixButtonStyle().color($default()))
          .onDisabled(
            RemixButtonStyle()
                .color(Colors.transparent)
                .labelColor($defaultForeground())
                .iconColor($defaultForeground()),
          ),
      HeroButtonVariant.ghost => RemixButtonStyle()
          .color(Colors.transparent)
          .labelColor($defaultForeground())
          .iconColor($defaultForeground())
          .onHovered(RemixButtonStyle().color($default()))
          .onPressed(RemixButtonStyle().color($default()))
          .onDisabled(
            RemixButtonStyle()
                .color(Colors.transparent)
                .labelColor($defaultForeground())
                .iconColor($defaultForeground()),
          ),
      HeroButtonVariant.danger => RemixButtonStyle()
          .color($danger())
          .labelColor($dangerForeground())
          .iconColor($dangerForeground())
          .onHovered(RemixButtonStyle().color($dangerHover()))
          .onPressed(RemixButtonStyle().color($dangerHover()))
          .onDisabled(
            RemixButtonStyle()
                .color($danger())
                .labelColor($dangerForeground())
                .iconColor($dangerForeground()),
          ),
      HeroButtonVariant.dangerSoft => RemixButtonStyle()
          .color($dangerSoft())
          .labelColor($dangerSoftForeground())
          .iconColor($dangerSoftForeground())
          .onHovered(RemixButtonStyle().color($dangerSoftHover()))
          .onPressed(RemixButtonStyle().color($dangerSoftHover()))
          .onDisabled(
            RemixButtonStyle()
                .color($dangerSoft())
                .labelColor($dangerSoftForeground())
                .iconColor($dangerSoftForeground()),
          ),
    };
  }
}

extension _RemixButtonStyleExt on RemixButtonStyle {
  RemixButtonStyle then(RemixButtonStyle Function(RemixButtonStyle) fn) {
    return fn(this);
  }
}
