import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

enum HeroRadioSize { sm, md, lg }

final class HeroRadioStyle {
  HeroRadioStyle._();

  static RemixRadioStyle resolve({HeroRadioSize size = .md}) {
    return _baseStyle().merge(_sizeStyle(size));
  }

  static RemixRadioStyle _baseStyle() {
    return RemixRadioStyle()
        .container(
          BoxStyler()
              .borderRounded(999)
              .borderAll(
                color: $fieldBorder(),
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              )
              .color($fieldBackground())
              .alignment(.center)
              .scale(1),
        )
        .indicator(BoxStyler().borderRounded(999).color($fieldBackground()))
        .onHovered(
          RemixRadioStyle().container(
            BoxStyler().borderAll(color: $defaultHover(), width: 1),
          ),
        )
        .onPressed(RemixRadioStyle().container(BoxStyler().scale(0.95)))
        .onSelected(
          RemixRadioStyle()
              .container(
                BoxStyler()
                    .color($accent())
                    .borderAll(color: $accent(), width: 1),
              )
              .indicator(BoxStyler().color($accentForeground()))
              .onHovered(
                RemixRadioStyle().container(BoxStyler().color($accentHover())),
              )
              .onPressed(
                RemixRadioStyle().container(BoxStyler().color($accentHover())),
              ),
        )
        .onDisabled(RemixRadioStyle().wrap(.opacity(0.5)))
        .animate(AnimationConfig.spring(200.ms));
  }

  static RemixRadioStyle _sizeStyle(HeroRadioSize size) {
    return switch (size) {
      .sm => .new().container(.size(16, 16)).indicator(.size(6, 6)),
      .md => .new().container(.size(20, 20)).indicator(.size(8, 8)),
      .lg => .new().container(.size(24, 24)).indicator(.size(10, 10)),
    };
  }
}
