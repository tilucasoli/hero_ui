import 'package:flutter/material.dart';

import '../../tokens/hero_tokens.dart';
import '../button/hero_button.dart';
import 'hero_button_group_style.dart';

final class HeroButtonGroupData extends InheritedWidget {
  final HeroButtonVariant variant;
  final HeroButtonSize size;

  final bool fullWidth;
  final Axis orientation;

  const HeroButtonGroupData({
    super.key,
    required super.child,
    this.variant = .primary,
    this.size = .md,

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
        fullWidth != oldWidget.fullWidth ||
        orientation != oldWidget.orientation;
  }
}

final class HeroButtonGroup extends StatelessWidget {
  final HeroButtonVariant variant;
  final HeroButtonSize size;
  final bool enabled;
  final bool fullWidth;
  final Axis orientation;
  final List<Widget> children;

  const HeroButtonGroup({
    super.key,
    this.variant = .primary,
    this.size = .md,
    this.enabled = true,
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

          fullWidth: fullWidth,
          orientation: orientation,
          child: fullWidth && child is! HeroButtonGroupSeparator
              ? Expanded(child: child)
              : child,
        ),
      );
    }

    final container = HeroButtonGroupStyle.groupStyle(
      orientation: orientation,
      fullWidth: fullWidth,
      variant: variant,
    );

    return container(children: wrappedChildren);
  }
}

final class HeroButtonGroupSeparator extends StatelessWidget {
  const HeroButtonGroupSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final groupData = HeroButtonGroupData.maybeOf(context);
    final orientation = groupData?.orientation ?? Axis.horizontal;

    return CustomPaint(
      size: orientation == Axis.horizontal
          ? const Size(0, 20)
          : const Size(20, 0),
      painter: _SeparatorPainter(
        color: $separator.resolve(context),
        thickness: 1,
        orientation: orientation,
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
      ..strokeWidth = thickness;

    if (orientation == Axis.horizontal) {
      final x = size.width / 2;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    } else {
      final y = size.height / 2;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_SeparatorPainter oldDelegate) {
    return color != oldDelegate.color ||
        thickness != oldDelegate.thickness ||
        orientation != oldDelegate.orientation;
  }
}
