import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

part 'hero_link_button.g.dart';

enum HeroLinkButtonSize with EnumVariant { sm, md, lg }

@MixWidget(
  widgetParameters: .only({
    'label',
    'leadingIcon',
    'trailingIcon',
    'enabled',
    'onPressed',
  }),
)
RemixButtonStyler heroLinkButtonStyle({
  HeroLinkButtonSize size = .md,
  RemixButtonStyler? style,
}) {
  return _baseStyle().merge(_sizeStyle()).merge(style).applyVariants([size]);
}

RemixButtonStyler _baseStyle() {
  return RemixButtonStyler()
      .mainAxisSize(.min)
      .mainAxisAlignment(.center)
      .crossAxisAlignment(.center)
      .spacing(4)
      .color(Colors.transparent)
      .labelColor($accent())
      .iconColor($accent())
      .onHovered(
        RemixButtonStyler()
            .labelColor($accentHover())
            .iconColor($accentHover()),
      )
      .onPressed(
        RemixButtonStyler()
            .labelColor($accentHover())
            .iconColor($accentHover()),
      )
      .onDisabled(RemixButtonStyler().wrap(.opacity(0.5)))
      .animate(.easeOut(100.ms));
}

RemixButtonStyler _sizeStyle() {
  return RemixButtonStyler()
      .variant(
        HeroLinkButtonSize.sm,
        RemixButtonStyler().labelStyle($labelSmall.mix()).iconSize(14),
      )
      .variant(
        HeroLinkButtonSize.md,
        RemixButtonStyler().labelStyle($labelSmall.mix()).iconSize(16),
      )
      .variant(
        HeroLinkButtonSize.lg,
        RemixButtonStyler().labelStyle($labelMedium.mix()).iconSize(18),
      );
}
