import 'package:hero_ui/src/utils/inherited_variant.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

enum HeroCardVariant { defaultVariant, secondary, tertiary }

final heroCardStyle = RemixCardStyle()
    .borderRounded(12)
    .paddingAll(0)
    .onVariantEnum<HeroCardVariant>(
      .defaultVariant,
      style: RemixCardStyle()
          .color($surface())
          .borderAll(color: $border(), width: 1),
    )
    .onVariantEnum<HeroCardVariant>(
      .secondary,
      style: RemixCardStyle()
          .color($default())
          .borderAll(color: $border(), width: 1),
    )
    .onVariantEnum<HeroCardVariant>(
      .tertiary,
      style: RemixCardStyle()
          .color($background())
          .borderAll(color: $border(), width: 1),
    );
