// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_slider.dart';

// **************************************************************************
// MixWidgetGenerator
// **************************************************************************

class HeroSlider extends StatelessWidget {
  const HeroSlider({
    super.key,
    this.size = .md,
    this.style,
    required this.value,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.enabled = true,
    this.enableFeedback = true,
    this.focusNode,
    this.autofocus = false,
    this.snapDivisions,
  });

  final HeroSliderSize size;

  final RemixSliderStyler? style;

  final double value;

  final ValueChanged<double>? onChanged;

  final ValueChanged<double>? onChangeStart;

  final ValueChanged<double>? onChangeEnd;

  final double min;

  final double max;

  final bool enabled;

  final bool enableFeedback;

  final FocusNode? focusNode;

  final bool autofocus;

  final int? snapDivisions;

  @override
  Widget build(BuildContext context) {
    return heroSliderStyle(size: this.size, style: this.style).call(
      key: this.key,
      value: this.value,
      onChanged: this.onChanged,
      onChangeStart: this.onChangeStart,
      onChangeEnd: this.onChangeEnd,
      min: this.min,
      max: this.max,
      enabled: this.enabled,
      enableFeedback: this.enableFeedback,
      focusNode: this.focusNode,
      autofocus: this.autofocus,
      snapDivisions: this.snapDivisions,
    );
  }
}
