// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_card.dart';

// **************************************************************************
// MixWidgetGenerator
// **************************************************************************

class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
    this.variant = .defaultVariant,
    this.style,
    this.child,
  });

  const HeroCard.defaultVariant({super.key, this.style, this.child})
    : variant = HeroCardVariant.defaultVariant;

  const HeroCard.secondary({super.key, this.style, this.child})
    : variant = HeroCardVariant.secondary;

  const HeroCard.tertiary({super.key, this.style, this.child})
    : variant = HeroCardVariant.tertiary;

  final HeroCardVariant variant;

  final RemixCardStyler? style;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return heroCardStyle(
      variant: this.variant,
      style: this.style,
    ).call(key: this.key, child: this.child);
  }
}
