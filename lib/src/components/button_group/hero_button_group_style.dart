import 'package:remix/remix.dart';

import '../button/hero_button_style.dart';
import 'hero_button_group.dart';

class HeroButtonGroupStyle {
  HeroButtonGroupStyle._();

  static RemixButtonStyle buttonOverride({
    required HeroButtonGroupData groupData,
    required HeroButtonVariant variant,
  }) {
    // All buttons in a group get radius 0 — the group's ClipRRect
    // handles the outer rounding.
    var style = RemixButtonStyle().borderRounded(0);

    // Disable press scale inside group
    style = style.onPressed(RemixButtonStyle().scale(1.0));

    return style;
  }
}
