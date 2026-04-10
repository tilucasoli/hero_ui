import 'package:flutter/widgets.dart';
import 'package:hero_ui/src/utils/inherited_variant.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

enum HeroCardVariant with EnumVariant { defaultVariant, secondary, tertiary }

final heroCardStyle = RemixCardStyle()
    .borderRounded(12)
    .paddingAll(0)
    .borderAll(
      color: $border(),
      width: 1,
      strokeAlign: BorderSide.strokeAlignOutside,
    )
    .container(.clipBehavior(.antiAlias))
    .enumVariant(
      HeroCardVariant.defaultVariant,
      style: RemixCardStyle().color($surface()),
    )
    .enumVariant(
      HeroCardVariant.secondary,
      style: RemixCardStyle().color($default()),
    )
    .enumVariant(
      HeroCardVariant.tertiary,
      style: RemixCardStyle().color($background()),
    );
