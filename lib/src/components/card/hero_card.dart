// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../../utils/inherited_variant.dart';
import 'hero_card_style.dart';

final class HeroCard extends StatelessWidget {
  final HeroCardVariant variant;
  final RemixCardStyle? style;
  final Widget? child;

  const HeroCard({
    super.key,
    this.variant = .defaultVariant,
    this.style,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InheritedVariant<HeroCardVariant>(
      variant: variant,
      child: RemixCard(style: heroCardStyle.merge(style), child: child),
    );
  }
}

final HeroCardHeader = BoxStyler().padding(.fromLTRB(24, 24, 24, 0)).call;

final HeroCardTitle =
    TextStyler().style($labelLarge.mix()).color($surfaceForeground()).call;

final HeroCardDescription =
    TextStyler().style($paragraphSmall.mix()).color($muted()).call;

final HeroCardContent = BoxStyler()
    .padding(.symmetric(horizontal: 24, vertical: 16))
    .call;

final HeroCardFooter = BoxStyler().padding(.fromLTRB(24, 0, 24, 24)).call;
