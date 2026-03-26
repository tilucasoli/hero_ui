import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../button/hero_button_variants.dart';
import 'hero_button_group.dart';

class HeroButtonGroupStyle {
  HeroButtonGroupStyle._();

  static RemixButtonStyle buttonOverride({
    required HeroButtonGroupData groupData,
    required HeroButtonVariant variant,
  }) {
    var style = RemixButtonStyle();

    final position = groupData.position;

    // --- Border radius based on position ---
    if (!position.isSingle) {
      if (groupData.orientation == Axis.horizontal) {
        if (position.isFirst) {
          style = style
              .borderRoundedTopLeft(24)
              .borderRoundedBottomLeft(24)
              .borderRoundedTopRight(0)
              .borderRoundedBottomRight(0);
        } else if (position.isLast) {
          style = style
              .borderRoundedTopLeft(0)
              .borderRoundedBottomLeft(0)
              .borderRoundedTopRight(24)
              .borderRoundedBottomRight(24);
        } else {
          style = style.borderRounded(0);
        }
      } else {
        if (position.isFirst) {
          style = style
              .borderRoundedTopLeft(24)
              .borderRoundedTopRight(24)
              .borderRoundedBottomLeft(0)
              .borderRoundedBottomRight(0);
        } else if (position.isLast) {
          style = style
              .borderRoundedTopLeft(0)
              .borderRoundedTopRight(0)
              .borderRoundedBottomLeft(24)
              .borderRoundedBottomRight(24);
        } else {
          style = style.borderRounded(0);
        }
      }
    }

    // --- Disable press scale inside group ---
    style = style.onPressed(RemixButtonStyle().scale(1.0));

    // --- Outline border collapsing via negative margin ---
    // Flutter can't paint non-uniform border widths with borderRadius > 0,
    // so we overlap adjacent buttons by -1px to hide the duplicate border.
    if (variant == HeroButtonVariant.outline &&
        !position.isSingle &&
        !position.isFirst) {
      if (groupData.orientation == Axis.horizontal) {
        style = style.marginLeft(-1);
      } else {
        style = style.marginTop(-1);
      }
    }

    return style;
  }
}
