// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_select.dart';

// **************************************************************************
// MixWidgetGenerator
// **************************************************************************

class HeroSelect<T> extends StatelessWidget {
  const HeroSelect({
    super.key,
    this.variant = .primary,
    this.error = false,
    this.style,
    required this.trigger,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.onOpen,
    this.onClose,
    this.enabled = true,
    this.closeOnSelect = true,
    this.semanticLabel,
    this.focusNode,
  });

  const HeroSelect.primary({
    super.key,
    this.error = false,
    this.style,
    required this.trigger,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.onOpen,
    this.onClose,
    this.enabled = true,
    this.closeOnSelect = true,
    this.semanticLabel,
    this.focusNode,
  }) : variant = HeroSelectVariant.primary;

  const HeroSelect.secondary({
    super.key,
    this.error = false,
    this.style,
    required this.trigger,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.onOpen,
    this.onClose,
    this.enabled = true,
    this.closeOnSelect = true,
    this.semanticLabel,
    this.focusNode,
  }) : variant = HeroSelectVariant.secondary;

  final HeroSelectVariant variant;

  final bool error;

  final RemixSelectStyler? style;

  final RemixSelectTrigger trigger;

  final List<RemixSelectItem<T>> items;

  final T? selectedValue;

  final ValueChanged<T?>? onChanged;

  final VoidCallback? onOpen;

  final VoidCallback? onClose;

  final bool enabled;

  final bool closeOnSelect;

  final String? semanticLabel;

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return heroSelectStyle(
      variant: this.variant,
      error: this.error,
      style: this.style,
    ).call<T>(
      key: this.key,
      trigger: this.trigger,
      items: this.items,
      selectedValue: this.selectedValue,
      onChanged: this.onChanged,
      onOpen: this.onOpen,
      onClose: this.onClose,
      enabled: this.enabled,
      closeOnSelect: this.closeOnSelect,
      semanticLabel: this.semanticLabel,
      focusNode: this.focusNode,
    );
  }
}
