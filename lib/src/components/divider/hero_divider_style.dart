import 'package:mix/mix.dart';

import '../../tokens/hero_tokens.dart';

enum HeroDividerOrientation { horizontal, vertical }

final class HeroDividerStyle {
  HeroDividerStyle._();

  static BoxStyler resolve({
    HeroDividerOrientation orientation = .horizontal,
  }) {
    return switch (orientation) {
      .horizontal => BoxStyler().color($separator()).height(1),
      .vertical => BoxStyler().color($separator()).width(1),
    };
  }
}
