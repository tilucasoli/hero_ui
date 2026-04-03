import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

class InheritedVariant<T extends Enum> extends InheritedWidget {
  final T variant;

  const InheritedVariant({
    super.key,
    required this.variant,
    required super.child,
  });

  static T? of<T extends Enum>(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<InheritedVariant<T>>();
    return widget?.variant;
  }

  @override
  bool updateShouldNotify(InheritedVariant<T> oldWidget) {
    return variant != oldWidget.variant;
  }
}

class OnInheritedVariant<T extends Enum> extends ContextVariant {
  final T variant;

  OnInheritedVariant({required this.variant})
    : super('on_inherited_${T.toString()}_$variant', (context) {
        return InheritedVariant.of<T>(context) == variant;
      });
}

extension WidgetStateVariantMixinExt<T extends Style<S>, S extends Spec<S>>
    on WidgetStateVariantMixin<T, S> {
  T onVariantEnum<V extends Enum>(V value, {required T style}) {
    return variant(OnInheritedVariant<V>(variant: value), style);
  }
}
