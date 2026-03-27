import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import 'hero_select_style.dart';

final class HeroSelectItem<T> {
  final T value;
  final String label;
  final bool enabled;

  const HeroSelectItem({
    required this.value,
    required this.label,
    this.enabled = true,
  });

  RemixSelectItem<T> _toRemix(RemixSelectMenuItemStyle itemStyle) {
    return RemixSelectItem<T>(
      value: value,
      label: label,
      enabled: enabled,
      style: itemStyle,
    );
  }
}

final class HeroSelect<T> extends StatelessWidget {
  final HeroSelectVariant variant;
  final bool fullWidth;
  final bool enabled;
  final bool error;
  final bool closeOnSelect;
  final String placeholder;
  final IconData? icon;
  final List<HeroSelectItem<T>> items;
  final T? selectedValue;
  final ValueChanged<T?>? onChanged;
  final VoidCallback? onOpen;
  final VoidCallback? onClose;
  final FocusNode? focusNode;
  final String? semanticLabel;
  final RemixSelectStyle? style;

  const HeroSelect({
    super.key,
    this.variant = HeroSelectVariant.primary,
    this.fullWidth = false,
    this.enabled = true,
    this.error = false,
    this.closeOnSelect = true,
    required this.placeholder,
    this.icon,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.onOpen,
    this.onClose,
    this.focusNode,
    this.semanticLabel,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = HeroSelectStyle.resolve(
      variant: variant,
      fullWidth: fullWidth,
      error: error,
    ).merge(style);

    final itemStyle = HeroSelectStyle.itemStyle();

    return RemixSelect<T>(
      style: resolvedStyle,
      trigger: RemixSelectTrigger(placeholder: placeholder, icon: icon),
      items: items.map((item) => item._toRemix(itemStyle)).toList(),
      selectedValue: selectedValue,
      onChanged: onChanged,
      onOpen: onOpen,
      onClose: onClose,
      enabled: enabled,
      closeOnSelect: closeOnSelect,
      focusNode: focusNode,
      semanticLabel: semanticLabel,
    );
  }
}

// TODO: Remix should add support for force the menu to open with the same size as the trigger
