part of 'hero_divider.dart';

enum HeroDividerOrientation with EnumVariant { horizontal, vertical }

final class HeroDividerStyle {
  HeroDividerStyle._();

  static BoxStyler _baseStyle(HeroDividerOrientation orientation) {
    return switch (orientation) {
      .horizontal => BoxStyler().color($separator()).height(1),
      .vertical => BoxStyler().color($separator()).width(1),
    };
  }
}
