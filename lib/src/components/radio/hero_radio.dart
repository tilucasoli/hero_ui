import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../../utils/inherited_variant.dart';

part 'hero_radio_style.dart';

final class HeroRadio<T> extends StatelessWidget {
  final T value;
  final bool enabled;
  final HeroRadioSize size;
  final RemixRadioStyle? style;

  const HeroRadio({
    super.key,
    required this.value,
    this.enabled = true,
    this.size = .md,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = HeroRadioStyle._baseStyle()
        .merge(HeroRadioStyle._sizeStyle())
        .merge(style)
        .applyVariants([size]);

    return RemixRadio<T>(
      value: value,
      enabled: enabled,
      style: resolvedStyle,
    );
  }
}
