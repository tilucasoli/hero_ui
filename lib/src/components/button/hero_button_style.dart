import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../../utils/inherited_variant.dart';

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
    required HeroButtonSize size,
    bool iconOnly = false,
    bool fullWidth = false,
  }) {
    final sizeStyle = _sizeStyle(size, iconOnly: iconOnly);

    var style = _baseStyle().merge(sizeStyle).merge(_variantStyles());

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
            .labelStyle($labelSmall.mix())
            .iconSize(16)
            .onPressed(.new().container(.scale(0.97))),
      HeroButtonSize.md =>
        RemixButtonStyle()
            .height(36)
            .paddingX(iconOnly ? 0 : 16)
            .scale(1)
            .borderRounded(24)
            .then((s) => iconOnly ? s.width(36) : s)
            .labelStyle($labelSmall.mix())
            .iconSize(18)
            .onPressed(.new().container(.scale(0.97))),
      HeroButtonSize.lg =>
        RemixButtonStyle()
            .height(40)
            .paddingX(iconOnly ? 0 : 16)
            .scale(1)
            .borderRounded(24)
            .then((s) => iconOnly ? s.width(40) : s)
            .labelStyle($labelMedium.mix())
            .iconSize(20)
            .onPressed(.new().container(.scale(0.97))),
    };
  }

  static RemixButtonStyle _variantStyles() {
    return RemixButtonStyle()
        .onVariantEnum<HeroButtonVariant>(
          .primary,
          style: RemixButtonStyle()
              .color($accent())
              .labelColor($accentForeground())
              .iconColor($accentForeground())
              .onHovered(RemixButtonStyle().color($accentHover()))
              .onPressed(RemixButtonStyle().color($accentHover()))
              .onDisabled(_disabledStyle()),
        )
        .onVariantEnum<HeroButtonVariant>(
          .secondary,
          style: RemixButtonStyle()
              .color($default())
              .labelColor($accentSoftForeground())
              .iconColor($accentSoftForeground())
              .onHovered(RemixButtonStyle().color($defaultHover()))
              .onPressed(RemixButtonStyle().color($defaultHover()))
              .onDisabled(_disabledStyle()),
        )
        .onVariantEnum<HeroButtonVariant>(
          .tertiary,
          style: RemixButtonStyle()
              .color($default())
              .labelColor($defaultForeground())
              .iconColor($defaultForeground())
              .onHovered(RemixButtonStyle().color($defaultHover()))
              .onPressed(RemixButtonStyle().color($defaultHover()))
              .onDisabled(_disabledStyle()),
        )
        .onVariantEnum<HeroButtonVariant>(
          .outline,
          style: RemixButtonStyle()
              .color(Colors.transparent)
              .borderAll(color: $border(), width: 1)
              .labelColor($defaultForeground())
              .iconColor($defaultForeground())
              .onHovered(RemixButtonStyle().color($default()))
              .onPressed(RemixButtonStyle().color($default()))
              .onDisabled(_disabledStyle()),
        )
        .onVariantEnum<HeroButtonVariant>(
          .ghost,
          style: RemixButtonStyle()
              .color(Colors.transparent)
              .labelColor($defaultForeground())
              .iconColor($defaultForeground())
              .onHovered(RemixButtonStyle().color($default()))
              .onPressed(RemixButtonStyle().color($default()))
              .onDisabled(_disabledStyle()),
        )
        .onVariantEnum<HeroButtonVariant>(
          .danger,
          style: RemixButtonStyle()
              .color($danger())
              .labelColor($dangerForeground())
              .iconColor($dangerForeground())
              .onHovered(RemixButtonStyle().color($dangerHover()))
              .onPressed(RemixButtonStyle().color($dangerHover()))
              .onDisabled(_disabledStyle()),
        )
        .onVariantEnum<HeroButtonVariant>(
          .dangerSoft,
          style: RemixButtonStyle()
              .color($dangerSoft())
              .labelColor($dangerSoftForeground())
              .iconColor($dangerSoftForeground())
              .onHovered(RemixButtonStyle().color($dangerSoftHover()))
              .onPressed(RemixButtonStyle().color($dangerSoftHover()))
              .onDisabled(_disabledStyle()),
        );
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
