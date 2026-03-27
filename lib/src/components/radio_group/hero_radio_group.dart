import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

final class HeroRadioGroup<T> extends StatelessWidget {
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final bool enabled;
  final Widget child;

  const HeroRadioGroup({
    super.key,
    required this.groupValue,
    required this.onChanged,
    this.enabled = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: Opacity(
        opacity: enabled ? 1.0 : 0.5,
        child: RemixRadioGroup<T>(
          groupValue: groupValue,
          onChanged: onChanged,
          child: child,
        ),
      ),
    );
  }
}
