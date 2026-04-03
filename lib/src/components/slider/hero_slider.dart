import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import 'hero_slider_style.dart';

final class HeroSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final double min;
  final double max;
  final bool enabled;
  final bool autofocus;
  final int? snapDivisions;
  final FocusNode? focusNode;
  final HeroSliderSize size;
  final RemixSliderStyle? style;
  final String? label;
  final bool showOutput;
  final String? semanticLabel;
  final String Function(double value)? outputFormatter;

  const HeroSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 100.0,
    this.enabled = true,
    this.autofocus = false,
    this.snapDivisions,
    this.focusNode,
    this.size = .md,
    this.style,
    this.label,
    this.showOutput = true,
    this.semanticLabel,
    this.outputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = HeroSliderStyle.resolve(size: size).merge(style);
    final labelStyle = TextStyler().style($labelSmall.mix());
    final outputValue = outputFormatter?.call(value) ?? _defaultOutput(value);

    return ColumnBox(
      style: FlexBoxStyler().crossAxisAlignment(.start).mainAxisSize(.min),
      children: [
        if (label != null || showOutput)
          RowBox(
            style: FlexBoxStyler()
                .paddingBottom(4)
                .mainAxisAlignment(.spaceBetween)
                .crossAxisAlignment(.center),
            children: [
              if (label != null) StyledText(label!, style: labelStyle),
              if (showOutput) StyledText(outputValue, style: labelStyle),
            ],
          ),
        Semantics(
          label: semanticLabel ?? label,
          child: RemixSlider(
            value: value,
            onChanged: onChanged,
            onChangeStart: onChangeStart,
            onChangeEnd: onChangeEnd,
            min: min,
            max: max,
            enabled: enabled,
            autofocus: autofocus,
            focusNode: focusNode,
            snapDivisions: snapDivisions,
            style: resolvedStyle,
          ),
        ),
      ],
    );
  }

  static String _defaultOutput(double value) {
    final rounded = value.roundToDouble();
    if ((value - rounded).abs() < 0.0001) {
      return rounded.toInt().toString();
    }
    return value.toStringAsFixed(2);
  }
}
