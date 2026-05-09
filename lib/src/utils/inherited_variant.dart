import 'package:mix/mix.dart';

extension WidgetStateVariantMixinExt<T extends Style<S>, S extends Spec<S>>
    on WidgetStateVariantMixin<T, S> {
  T enumVariant<V extends EnumVariant>(V value, {required T style}) {
    return variant(value, style);
  }
}
