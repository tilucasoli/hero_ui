import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../../utils/inherited_variant.dart';

part 'hero_checkbox_style.dart';

final class HeroCheckbox extends StatelessWidget {
  final bool? selected;
  final ValueChanged<bool?>? onChanged;
  final bool enabled;
  final bool tristate;
  final HeroCheckboxSize size;
  final RemixCheckboxStyle? style;
  final String? semanticLabel;

  const HeroCheckbox({
    super.key,
    required this.selected,
    this.onChanged,
    this.enabled = true,
    this.tristate = false,
    this.size = .md,
    this.style,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = HeroCheckboxStyle._baseStyle()
        .merge(HeroCheckboxStyle._sizeStyle())
        .merge(style)
        .applyVariants([size]);

    return RemixCheckbox(
      selected: selected,
      onChanged: onChanged,
      enabled: enabled,
      tristate: tristate,
      semanticLabel: semanticLabel,
      style: resolvedStyle,
    );
  }
}
