// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

part 'hero_card.g.dart';

enum HeroCardVariant with EnumVariant { defaultVariant, secondary, tertiary }

@MixWidget(widgetParameters: .only({'child'}))
RemixCardStyler heroCardStyle({
  HeroCardVariant variant = .defaultVariant,
  RemixCardStyler? style,
}) {
  return _baseStyle().merge(style).applyVariants([variant]);
}

RemixCardStyler _baseStyle() {
  return RemixCardStyler()
      .borderRounded(12)
      .paddingAll(0)
      .borderAll(
        color: $border(),
        width: 1,
        strokeAlign: BorderSide.strokeAlignOutside,
      )
      .container(.clipBehavior(.antiAlias))
      .variant(
        HeroCardVariant.defaultVariant,
        RemixCardStyler().color($surface()),
      )
      .variant(HeroCardVariant.secondary, RemixCardStyler().color($default()))
      .variant(
        HeroCardVariant.tertiary,
        RemixCardStyler().color($background()),
      );
}

final HeroCardHeader = BoxStyler().padding(.fromLTRB(24, 24, 24, 0));

final HeroCardTitle = TextStyler()
    .style($labelLarge.mix())
    .color($surfaceForeground());

final HeroCardDescription = TextStyler()
    .style($paragraphSmall.mix())
    .color($muted());

final HeroCardContent = BoxStyler().padding(
  .symmetric(horizontal: 24, vertical: 16),
);

final HeroCardFooter = BoxStyler().padding(.fromLTRB(24, 0, 24, 24));
