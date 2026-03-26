import 'package:flutter/material.dart';
import 'package:hero_ui/src/tokens/hero_tokens.dart';
import '../button/hero_button_style.dart';

class HeroButtonGroupData extends InheritedWidget {
  final HeroButtonVariant? variant;
  final HeroButtonSize? size;
  final bool isDisabled;
  final bool fullWidth;
  final Axis orientation;

  const HeroButtonGroupData({
    super.key,
    required super.child,
    this.variant,
    this.size,
    this.isDisabled = false,
    this.fullWidth = false,
    required this.orientation,
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
        orientation != oldWidget.orientation;
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
    final wrappedChildren = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      wrappedChildren.add(
        HeroButtonGroupData(
          variant: variant,
          size: size,
          isDisabled: isDisabled,
          fullWidth: fullWidth,
          orientation: orientation,
          child: fullWidth && child is! HeroButtonGroupSeparator
              ? Expanded(child: child)
              : child,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Flex(
        direction: orientation,
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        children: wrappedChildren,
      ),
    );
  }
}

class HeroButtonGroupSeparator extends StatelessWidget {
  const HeroButtonGroupSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final groupData = HeroButtonGroupData.maybeOf(context);

    return CustomPaint(
      size: const Size(0, 20),
      painter: _SeparatorPainter(
        color: $border.resolve(context).withValues(alpha: 0.50),
        thickness: 1,
        orientation: groupData?.orientation ?? Axis.horizontal,
      ),
    );
  }
}

class _SeparatorPainter extends CustomPainter {
  final Color color;
  final double thickness;
  final Axis orientation;

  _SeparatorPainter({
    required this.color,
    required this.thickness,
    required this.orientation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    if (orientation == Axis.horizontal) {
      canvas.drawLine(Offset.zero, Offset(size.width, size.height), paint);
    } else {
      canvas.drawLine(Offset.zero, Offset(size.width, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(_SeparatorPainter oldDelegate) {
    return color != oldDelegate.color ||
        thickness != oldDelegate.thickness ||
        orientation != oldDelegate.orientation;
  }
}
