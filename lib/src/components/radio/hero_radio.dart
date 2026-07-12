import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

part 'hero_radio_style.dart';

final class HeroRadio<T> extends StatelessWidget {
  final T value;
  final bool enabled;
  final bool error;
  final HeroRadioSize size;
  final HeroRadioVariant variant;
  final RemixRadioStyler? style;

  const HeroRadio({
    super.key,
    required this.value,
    this.enabled = true,
    this.error = false,
    this.size = .md,
    this.variant = .primary,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = HeroRadioStyle._baseStyle()
        .merge(HeroRadioStyle._variantStyles())
        .merge(HeroRadioStyle._sizeStyle())
        .merge(style)
        .applyVariants([size, variant, if (error) _InternalVariants.error]);

    return RemixRadio<T>(value: value, enabled: enabled, style: resolvedStyle);
  }
}
