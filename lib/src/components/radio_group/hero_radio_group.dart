import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

final class HeroRadioGroup<T> extends StatelessWidget {
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final Widget child;

  const HeroRadioGroup({
    super.key,
    required this.groupValue,
    required this.onChanged,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RemixRadioGroup<T>(
      groupValue: groupValue,
      onChanged: onChanged,
      child: child,
    );
  }
}
