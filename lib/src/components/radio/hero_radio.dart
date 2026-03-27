import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import 'hero_radio_style.dart';

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
    final resolvedStyle = HeroRadioStyle.resolve(size: size).merge(style);
    return RemixRadio<T>(
      value: value,
      enabled: enabled,
      style: resolvedStyle,
    );
  }
}
