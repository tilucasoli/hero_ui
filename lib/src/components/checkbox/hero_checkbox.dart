import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

part 'hero_checkbox_style.dart';

final class HeroCheckbox extends StatelessWidget {
  final bool? selected;
  final ValueChanged<bool?>? onChanged;
  final bool enabled;
  final bool tristate;
  final HeroCheckboxSize size;
  final HeroCheckboxVariant variant;
  final bool error;
  final RemixCheckboxStyle? style;
  final String? semanticLabel;

  const HeroCheckbox({
    super.key,
    required this.selected,
    this.onChanged,
    this.enabled = true,
    this.tristate = false,
    this.size = .md,
    this.variant = .primary,
    this.error = false,
    this.style,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = HeroCheckboxStyle._baseStyle()
        .merge(HeroCheckboxStyle._variantStyles())
        .merge(HeroCheckboxStyle._sizeStyle())
        .merge(style)
        .applyVariants([size, variant, if (error) _InternalVariants.error]);

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
