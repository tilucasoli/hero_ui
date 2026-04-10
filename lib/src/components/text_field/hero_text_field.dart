import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../../utils/inherited_variant.dart';

part 'hero_text_field_style.dart';

final class HeroTextField extends StatelessWidget {
  final bool fullWidth;
  final bool enabled;
  final bool error;
  final bool readOnly;
  final bool obscureText;
  final bool autofocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hintText;
  final String? helperText;
  final Widget? leading;
  final Widget? trailing;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final String? semanticLabel;
  final RemixTextFieldStyle? style;

  const HeroTextField({
    super.key,
    this.fullWidth = false,
    this.enabled = true,
    this.error = false,
    this.readOnly = false,
    this.obscureText = false,
    this.autofocus = false,
    this.controller,
    this.focusNode,
    this.label,
    this.hintText,
    this.helperText,
    this.leading,
    this.trailing,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.inputFormatters,
    this.autofillHints,
    this.semanticLabel,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = HeroTextFieldStyle._baseStyle()
        .merge(style)
        .applyVariants([
          if (fullWidth) _InternalVariants.fullWidth,
        ]);

    return RemixTextField(
      style: resolvedStyle,
      controller: controller,
      focusNode: focusNode,
      label: label,
      hintText: hintText,
      helperText: helperText,
      leading: leading,
      trailing: trailing,
      enabled: enabled,
      readOnly: readOnly,
      obscureText: obscureText,
      autofocus: autofocus,
      error: error,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
      semanticLabel: semanticLabel,
    );
  }
}
