import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
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
    final isOutline = variant == HeroButtonVariant.outline;

    // --- Border radius based on position ---
    if (!position.isSingle) {
      // Outline buttons in a group use 0 radius everywhere so that
      // per-side border collapsing works (Flutter requires uniform
      // borders when borderRadius > 0).
      if (isOutline) {
        style = style.borderRounded(0);
      } else if (groupData.orientation == Axis.horizontal) {
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

    // --- Outline border collapsing ---
    // With borderRadius 0 we can safely use non-uniform border widths.
    if (isOutline && !position.isSingle) {
      if (groupData.orientation == Axis.horizontal) {
        if (position.isFirst) {
          style = style.borderRight(color: $border(), width: 0);
        } else if (position.isLast) {
          style = style.borderLeft(color: $border(), width: 0);
        } else {
          style = style
              .borderLeft(color: $border(), width: 0)
              .borderRight(color: $border(), width: 0);
        }
      } else {
        if (position.isFirst) {
          style = style.borderBottom(color: $border(), width: 0);
        } else if (position.isLast) {
          style = style.borderTop(color: $border(), width: 0);
        } else {
          style = style
              .borderTop(color: $border(), width: 0)
              .borderBottom(color: $border(), width: 0);
        }
      }
    }

    return style;
  }
}
