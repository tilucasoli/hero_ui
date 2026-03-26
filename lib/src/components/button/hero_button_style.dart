import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

enum HeroButtonVariant {
  primary,
  secondary,
  tertiary,
  outline,
  ghost,
  danger,
  dangerSoft,
}

enum HeroButtonSize { sm, md, lg }

final class HeroButtonStyle {
  HeroButtonStyle._();

  static RemixButtonStyle resolve({
    required HeroButtonVariant variant,
    required HeroButtonSize size,
    bool iconOnly = false,
    bool fullWidth = false,
  }) {
    final sizeStyle = _sizeStyle(size, iconOnly: iconOnly);
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
    bool iconOnly = false,
  }) {
    return switch (size) {
      HeroButtonSize.sm =>
        RemixButtonStyle()
            .scale(1)
            .height(32)
            .paddingX(iconOnly ? 0 : 12)
            .borderRounded(24)
            .then((s) => iconOnly ? s.width(32) : s)
            .labelFontSize(14)
            .iconSize(16)
            .onPressed(.new().container(.scale(0.97))),
      HeroButtonSize.md =>
        RemixButtonStyle()
            .height(36)
            .paddingX(iconOnly ? 0 : 16)
            .scale(1)
            .borderRounded(24)
            .then((s) => iconOnly ? s.width(36) : s)
            .labelFontSize(14)
            .iconSize(18)
            .onPressed(.new().container(.scale(0.97))),
      HeroButtonSize.lg =>
        RemixButtonStyle()
            .height(40)
            .paddingX(iconOnly ? 0 : 16)
            .scale(1)
            .borderRounded(24)
            .then((s) => iconOnly ? s.width(40) : s)
            .labelFontSize(16)
            .iconSize(20)
            .onPressed(.new().container(.scale(0.97))),
    };
  }

  static RemixButtonStyle _variantStyle(HeroButtonVariant variant) {
    return switch (variant) {
      HeroButtonVariant.primary =>
        RemixButtonStyle()
            .color($accent())
            .labelColor($accentForeground())
            .iconColor($accentForeground())
            .onHovered(RemixButtonStyle().color($accentHover()))
            .onPressed(RemixButtonStyle().color($accentHover()))
            .onDisabled(_disabledStyle()),
      HeroButtonVariant.secondary =>
        RemixButtonStyle()
            .color($default())
            .labelColor($accentSoftForeground())
            .iconColor($accentSoftForeground())
            .onHovered(RemixButtonStyle().color($defaultHover()))
            .onPressed(RemixButtonStyle().color($defaultHover()))
            .onDisabled(_disabledStyle()),
      HeroButtonVariant.tertiary =>
        RemixButtonStyle()
            .color($default())
            .labelColor($defaultForeground())
            .iconColor($defaultForeground())
            .onHovered(RemixButtonStyle().color($defaultHover()))
            .onPressed(RemixButtonStyle().color($defaultHover()))
            .onDisabled(_disabledStyle()),
      HeroButtonVariant.outline =>
        RemixButtonStyle()
            .color(Colors.transparent)
            .borderAll(color: $border(), width: 1)
            .labelColor($defaultForeground())
            .iconColor($defaultForeground())
            .onHovered(RemixButtonStyle().color($default()))
            .onPressed(RemixButtonStyle().color($default()))
            .onDisabled(_disabledStyle()),
      HeroButtonVariant.ghost =>
        RemixButtonStyle()
            .color(Colors.transparent)
            .labelColor($defaultForeground())
            .iconColor($defaultForeground())
            .onHovered(RemixButtonStyle().color($default()))
            .onPressed(RemixButtonStyle().color($default()))
            .onDisabled(_disabledStyle()),
      HeroButtonVariant.danger =>
        RemixButtonStyle()
            .color($danger())
            .labelColor($dangerForeground())
            .iconColor($dangerForeground())
            .onHovered(RemixButtonStyle().color($dangerHover()))
            .onPressed(RemixButtonStyle().color($dangerHover()))
            .onDisabled(_disabledStyle()),
      HeroButtonVariant.dangerSoft =>
        RemixButtonStyle()
            .color($dangerSoft())
            .labelColor($dangerSoftForeground())
            .iconColor($dangerSoftForeground())
            .onHovered(RemixButtonStyle().color($dangerSoftHover()))
            .onPressed(RemixButtonStyle().color($dangerSoftHover()))
            .onDisabled(_disabledStyle()),
    };
  }

  static RemixButtonStyle _disabledStyle() {
    return RemixButtonStyle().wrap(.opacity(0.5));
  }
}

extension _RemixButtonStyleExt on RemixButtonStyle {
  RemixButtonStyle then(RemixButtonStyle Function(RemixButtonStyle) fn) {
    return fn(this);
  }
}
