// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_text_field.dart';

// **************************************************************************
// MixWidgetGenerator
// **************************************************************************

/// Styler recipe for `HeroTextField`.
///
/// `widgetParameters` keeps the generated widget API aligned with the curated
/// design-system surface instead of exposing the full editable-text API.
class HeroTextField extends StatelessWidget {
  const HeroTextField({
    super.key,
    this.fullWidth = false,
    this.style,
    this.controller,
    this.focusNode,
    this.label,
    this.hintText,
    this.helperText,
    this.error = false,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.autofillHints,
    this.leading,
    this.trailing,
    this.semanticLabel,
  });

  final bool fullWidth;

  final RemixTextFieldStyler? style;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final String? label;

  final String? hintText;

  final String? helperText;

  final bool error;

  final TextInputType? keyboardType;

  final TextInputAction? textInputAction;

  final bool obscureText;

  final bool enabled;

  final bool readOnly;

  final bool autofocus;

  final int? maxLines;

  final int? minLines;

  final int? maxLength;

  final ValueChanged<String>? onChanged;

  final VoidCallback? onEditingComplete;

  final ValueChanged<String>? onSubmitted;

  final List<TextInputFormatter>? inputFormatters;

  final Iterable<String>? autofillHints;

  final Widget? leading;

  final Widget? trailing;

  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return heroTextFieldStyle(
      fullWidth: this.fullWidth,
      style: this.style,
    ).call(
      key: this.key,
      controller: this.controller,
      focusNode: this.focusNode,
      label: this.label,
      hintText: this.hintText,
      helperText: this.helperText,
      error: this.error,
      keyboardType: this.keyboardType,
      textInputAction: this.textInputAction,
      obscureText: this.obscureText,
      enabled: this.enabled,
      readOnly: this.readOnly,
      autofocus: this.autofocus,
      maxLines: this.maxLines,
      minLines: this.minLines,
      maxLength: this.maxLength,
      onChanged: this.onChanged,
      onEditingComplete: this.onEditingComplete,
      onSubmitted: this.onSubmitted,
      inputFormatters: this.inputFormatters,
      autofillHints: this.autofillHints,
      leading: this.leading,
      trailing: this.trailing,
      semanticLabel: this.semanticLabel,
    );
  }
}
