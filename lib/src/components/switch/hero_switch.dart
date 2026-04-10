import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../../utils/inherited_variant.dart';

part 'hero_switch_style.dart';

final class HeroSwitch extends StatelessWidget {
  final bool selected;
  final ValueChanged<bool> onChanged;
  final bool enabled;
  final HeroSwitchSize size;
  final RemixSwitchStyle? style;
  final String? semanticLabel;

  const HeroSwitch({
    super.key,
    required this.selected,
    required this.onChanged,
    this.enabled = true,
    this.size = .md,
    this.style,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = HeroSwitchStyle._baseStyle()
        .merge(HeroSwitchStyle._sizeStyle())
        .merge(style)
        .applyVariants([size]);

    return RemixSwitch(
      selected: selected,
      onChanged: onChanged,
      enabled: enabled,
      semanticLabel: semanticLabel,
      style: resolvedStyle,
    );
  }
}
