import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

enum HeroLinkButtonSize { sm, md, lg }

final class HeroLinkButtonStyle {
  HeroLinkButtonStyle._();

  static RemixButtonStyle resolve({required HeroLinkButtonSize size}) {
    return _baseStyle().merge(_sizeStyle(size));
  }

  static RemixButtonStyle _baseStyle() {
    return RemixButtonStyle()
        .mainAxisSize(.min)
        .mainAxisAlignment(.center)
        .crossAxisAlignment(.center)
        .spacing(4)
        .color(Colors.transparent)
        .labelFontWeight(.w500)
        .labelColor($accent())
        .iconColor($accent())
        .onHovered(
          RemixButtonStyle()
              .labelColor($accentHover())
              .iconColor($accentHover()),
        )
        .onPressed(
          RemixButtonStyle()
              .labelColor($accentHover())
              .iconColor($accentHover()),
        )
        .onDisabled(RemixButtonStyle().wrap(.opacity(0.5)))
        .animate(.easeOut(100.ms));
  }

  static RemixButtonStyle _sizeStyle(HeroLinkButtonSize size) {
    return switch (size) {
      .sm => RemixButtonStyle().labelFontSize(14).iconSize(14),
      .md => RemixButtonStyle().labelFontSize(14).iconSize(16),
      .lg => RemixButtonStyle().labelFontSize(16).iconSize(18),
    };
  }
}
