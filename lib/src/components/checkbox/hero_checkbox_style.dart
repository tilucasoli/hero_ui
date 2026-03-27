import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

enum HeroCheckboxSize { sm, md, lg }

final class HeroCheckboxStyle {
  HeroCheckboxStyle._();

  static RemixCheckboxStyle resolve({
    HeroCheckboxSize size = .md,
  }) {
    return _baseStyle().merge(_sizeStyle(size));
  }

  static RemixCheckboxStyle _baseStyle() {
    return RemixCheckboxStyle()
        .color($fieldBackground())
        .indicatorColor($accentForeground())
        .borderAll(
          color: $fieldBorder(),
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
        )
        .borderRounded(6)
        .wrap(.opacity(1))
        .onHovered(
          RemixCheckboxStyle()
              .wrap(.opacity(0.8)),
        )
        .onSelected(
          RemixCheckboxStyle()
              .color($accent())
              .indicatorColor($accentForeground())
              .borderAll(color: Colors.transparent, width: 0)
              .onHovered(
                RemixCheckboxStyle()
                    .color($accentHover())
                    .wrap(.opacity(1)),
              ),
        )
        .onDisabled(
          RemixCheckboxStyle()
              .wrap(.opacity(0.5)),
        )
        .animate(.spring(200.ms));
  }

  static RemixCheckboxStyle _sizeStyle(HeroCheckboxSize size) {
    return switch (size) {
      .sm => RemixCheckboxStyle().size(14, 14).iconSize(10),
      .md => RemixCheckboxStyle().size(16, 16).iconSize(12),
      .lg => RemixCheckboxStyle().size(20, 20).iconSize(16),
    };
  }
}
