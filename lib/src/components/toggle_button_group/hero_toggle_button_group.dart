import 'package:flutter/material.dart';

import '../../tokens/hero_tokens.dart';
import '../toggle_button/hero_toggle_button.dart';
import 'hero_toggle_button_group_style.dart';

/// Shared context provided by a [HeroToggleButtonGroup] to its child
/// [HeroToggleButton]s. Group values take precedence over the ones set on the
/// individual buttons.
final class HeroToggleButtonGroupData extends InheritedWidget {
  final HeroToggleButtonVariant variant;
  final HeroToggleButtonSize size;
  final bool fullWidth;
  final Axis orientation;

  const HeroToggleButtonGroupData({
    super.key,
    required super.child,
    this.variant = .defaultVariant,
    this.size = .md,
    this.fullWidth = false,
    required this.orientation,
  });

  static HeroToggleButtonGroupData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<HeroToggleButtonGroupData>();
  }

  @override
  bool updateShouldNotify(HeroToggleButtonGroupData oldWidget) {
    return variant != oldWidget.variant ||
        size != oldWidget.size ||
        fullWidth != oldWidget.fullWidth ||
        orientation != oldWidget.orientation;
  }
}

/// Visually joins a set of [HeroToggleButton]s into a single segmented control
/// and supplies them with shared [variant]/[size] defaults.
///
/// Each child toggle keeps managing its own `selected`/`onChanged` — this group
/// is purely presentational. Insert [HeroToggleButtonGroupSeparator]s between
/// children to draw dividers.
final class HeroToggleButtonGroup extends StatelessWidget {
  final HeroToggleButtonVariant variant;
  final HeroToggleButtonSize size;
  final bool fullWidth;
  final Axis orientation;
  final List<Widget> children;

  const HeroToggleButtonGroup({
    super.key,
    this.variant = .defaultVariant,
    this.size = .md,
    this.fullWidth = false,
    this.orientation = Axis.horizontal,
    required this.children,
  });

  Widget _resolveChild(Widget child) {
    return switch (child) {
      HeroToggleButton button => HeroToggleButton(
        key: button.key,
        variant: variant,
        size: size,
        iconOnly: button.iconOnly || button.label == null,
        grouped: true,
        style: button.style,
        selected: button.selected,
        onChanged: button.onChanged,
        enabled: button.enabled,
        label: button.label,
        icon: button.icon,
        enableFeedback: button.enableFeedback,
        focusNode: button.focusNode,
        autofocus: button.autofocus,
        semanticLabel: button.semanticLabel,
      ),
      _ => child,
    };
  }

  @override
  Widget build(BuildContext context) {
    final wrappedChildren = <Widget>[];

    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      final resolvedChild = _resolveChild(child);
      wrappedChildren.add(
        HeroToggleButtonGroupData(
          variant: variant,
          size: size,
          fullWidth: fullWidth,
          orientation: orientation,
          child: fullWidth && resolvedChild is! HeroToggleButtonGroupSeparator
              ? Expanded(child: resolvedChild)
              : resolvedChild,
        ),
      );
    }

    final container = HeroToggleButtonGroupStyle.groupStyle(
      orientation: orientation,
      fullWidth: fullWidth,
    ).applyVariants([variant]);

    return container(children: wrappedChildren);
  }
}

/// A thin divider intended to be placed between children of a
/// [HeroToggleButtonGroup].
final class HeroToggleButtonGroupSeparator extends StatelessWidget {
  const HeroToggleButtonGroupSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final groupData = HeroToggleButtonGroupData.maybeOf(context);
    final orientation = groupData?.orientation ?? .horizontal;

    return CustomPaint(
      size: orientation == .horizontal ? const .new(0, 20) : const .new(20, 0),
      painter: _SeparatorPainter(
        color: $border.resolve(context),
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

    if (orientation == .horizontal) {
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
