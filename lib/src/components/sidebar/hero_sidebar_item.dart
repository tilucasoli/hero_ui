import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

part 'hero_sidebar_item.g.dart';

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
RemixToggleStyler heroSidebarItemStyle({RemixToggleStyler? style}) {
  return _baseStyle().merge(style);
}

RemixToggleStyler _baseStyle() {
  return RemixToggleStyler()
      .borderRounded(8)
      .paddingX(12)
      .paddingY(8)
      .backgroundColor($background())
      .spacing(10)
      .marginY(1)
      .scale(1)
      .iconSize(18)
      .iconColor($muted())
      .labelStyle($labelSmall.mix())
      .labelColor($foreground())
      .onHovered(RemixToggleStyler().backgroundColor($default()))
      .onSelected(
        RemixToggleStyler()
            .backgroundColor($default())
            .iconColor($accentSoftForeground()),
      )
      .onPressed(RemixToggleStyler().scale(0.98))
      .animate(.ease(150.ms));
}
