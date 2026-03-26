import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

enum HeroSwitchSize { sm, md, lg }

final class HeroSwitchStyle {
  HeroSwitchStyle._();

  static RemixSwitchStyle resolve({HeroSwitchSize size = .md}) {
    return _baseStyle().merge(_sizeStyle(size));
  }

  static RemixSwitchStyle _baseStyle() {
    return RemixSwitchStyle()
        .container(
          BoxStyler().alignment(.centerLeft).paddingAll(2).borderRounded(999),
        )
        .color($default())
        .thumbColor(Colors.white)
        .thumb(
          BoxStyler()
              .borderRounded(999)
              .shadow(
                BoxShadowMix()
                    .color(const Color(0x26000000))
                    .offset(x: 0, y: 2)
                    .blurRadius(8),
              ),
        )
        .wrap(.opacity(1))
        .onHovered(RemixSwitchStyle().wrap(.opacity(0.8)))
        .onPressed(RemixSwitchStyle().color($defaultHover()))
        .onSelected(
          RemixSwitchStyle()
              .color($accent())
              .thumbColor($accentForeground())
              .onHovered(RemixSwitchStyle().color($accentHover()))
              .onPressed(RemixSwitchStyle().color($accentHover())),
        )
        .onDisabled(
          RemixSwitchStyle()
              .color($default())
              .thumbColor($defaultForeground())
              .wrap(.opacity(0.5)),
        )
        .animate(.spring(200.ms));
  }

  static RemixSwitchStyle _sizeStyle(HeroSwitchSize size) {
    return switch (size) {
      .sm => RemixSwitchStyle().size(32, 16).thumb(.size(16.5, 12)),
      .md => RemixSwitchStyle().size(40, 20).thumb(.size(22, 16)),
      .lg => RemixSwitchStyle().size(48, 24).thumb(.size(27.5, 20)),
    };
  }
}
