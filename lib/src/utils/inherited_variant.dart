import 'package:mix/mix.dart';

extension WidgetStateVariantMixinExt<T extends Style<S>, S extends Spec<S>>
    on WidgetStateVariantMixin<T, S> {
  T enumVariant<V extends EnumVariant>(V value, {required T style}) {
    return variant(value, style);
  }
}

mixin EnumVariant on Enum implements NamedVariant {
  @override
  String get key => _EnumName(this).name;

  @override
  String get name => _EnumName(this).name;
}

extension type _EnumName(Enum value) {
  String get name => value.name;
}
