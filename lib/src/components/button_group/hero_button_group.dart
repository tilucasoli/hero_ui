import 'package:flutter/material.dart';

import '../button/hero_button_variants.dart';

class HeroButtonPosition {
  final bool isFirst;
  final bool isLast;

  const HeroButtonPosition({required this.isFirst, required this.isLast});

  bool get isSingle => isFirst && isLast;
  bool get isMiddle => !isFirst && !isLast;
}

class HeroButtonGroupData extends InheritedWidget {
  final HeroButtonVariant? variant;
  final HeroButtonSize? size;
  final bool? isDisabled;
  final bool? fullWidth;
  final Axis orientation;
  final HeroButtonPosition position;

  const HeroButtonGroupData({
    super.key,
    required super.child,
    this.variant,
    this.size,
    this.isDisabled,
    this.fullWidth,
    required this.orientation,
    required this.position,
  });

  static HeroButtonGroupData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HeroButtonGroupData>();
  }

  @override
  bool updateShouldNotify(HeroButtonGroupData oldWidget) {
    return variant != oldWidget.variant ||
        size != oldWidget.size ||
        isDisabled != oldWidget.isDisabled ||
        fullWidth != oldWidget.fullWidth ||
        orientation != oldWidget.orientation ||
        position.isFirst != oldWidget.position.isFirst ||
        position.isLast != oldWidget.position.isLast;
  }
}

class HeroButtonGroup extends StatelessWidget {
  final HeroButtonVariant? variant;
  final HeroButtonSize? size;
  final bool isDisabled;
  final bool fullWidth;
  final Axis orientation;
  final List<Widget> children;

  const HeroButtonGroup({
    super.key,
    this.variant,
    this.size,
    this.isDisabled = false,
    this.fullWidth = false,
    this.orientation = Axis.horizontal,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    // Identify button positions (excluding separators)
    final buttonIndices = <int>[];
    for (var i = 0; i < children.length; i++) {
      if (children[i] is! HeroButtonGroupSeparator) {
        buttonIndices.add(i);
      }
    }

    final wrappedChildren = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      final child = children[i];

      if (child is HeroButtonGroupSeparator) {
        wrappedChildren.add(
          HeroButtonGroupData(
            variant: variant,
            size: size,
            isDisabled: isDisabled ? true : null,
            fullWidth: fullWidth ? true : null,
            orientation: orientation,
            position: const HeroButtonPosition(isFirst: false, isLast: false),
            child: child,
          ),
        );
      } else {
        final buttonIndex = buttonIndices.indexOf(i);
        final isFirst = buttonIndex == 0;
        final isLast = buttonIndex == buttonIndices.length - 1;

        wrappedChildren.add(
          HeroButtonGroupData(
            variant: variant,
            size: size,
            isDisabled: isDisabled ? true : null,
            fullWidth: fullWidth ? true : null,
            orientation: orientation,
            position: HeroButtonPosition(isFirst: isFirst, isLast: isLast),
            child: fullWidth ? Expanded(child: child) : child,
          ),
        );
      }
    }

    return Flex(
      direction: orientation,
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      children: wrappedChildren,
    );
  }
}

class HeroButtonGroupSeparator extends StatelessWidget {
  const HeroButtonGroupSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final groupData = HeroButtonGroupData.maybeOf(context);
    final isHorizontal =
        (groupData?.orientation ?? Axis.horizontal) == Axis.horizontal;

    return SizedBox(
      width: isHorizontal ? 0 : null,
      height: isHorizontal ? null : 0,
      child: OverflowBox(
        maxWidth: isHorizontal ? 1 : null,
        maxHeight: isHorizontal ? null : 1,
        child: FractionallySizedBox(
          widthFactor: isHorizontal ? null : 0.5,
          heightFactor: isHorizontal ? 0.5 : null,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: IconTheme.of(context).color?.withValues(alpha: 0.15) ??
                  Colors.grey.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
