import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../tokens/hero_tokens.dart';

final class HeroSidebarItemStyle {
  HeroSidebarItemStyle._();

  static BoxStyler resolve({bool isSelected = false}) {
    var style = _baseStyle();

    if (isSelected) {
      style = style.merge(_selectedStyle());
    } else {
      style = style.merge(_defaultStyle());
    }

    return style;
  }

  static BoxStyler _baseStyle() {
    return BoxStyler()
        .borderRounded(8)
        .paddingX(12)
        .paddingY(8)
        .animate(AnimationConfig.ease(100.ms));
  }

  static BoxStyler _defaultStyle() {
    return BoxStyler()
        .color(Colors.transparent)
        .onHovered(.color($defaultHover()));
  }

  static BoxStyler _selectedStyle() {
    return BoxStyler().color($default());
  }
}

final heroSidebarContainerStyle = FlexBoxStyler()
    .crossAxisAlignment(.stretch)
    .color($surface())
    .width(260)
    .borderRight(color: $border(), width: 1);

final heroSidebarHeaderStyle = BoxStyler().padding(.fromLTRB(16, 16, 16, 0));

final heroSidebarFooterStyle = BoxStyler().padding(.fromLTRB(16, 0, 16, 16));

final heroSidebarSectionTitleStyle =
    TextStyler().style($subheadingXSmall.mix()).color($muted());

final heroSidebarSectionStyle =
    BoxStyler().paddingX(12).paddingTop(16).paddingBottom(4);

final heroSidebarItemLabelStyle = TextStyler().style($labelSmall.mix());

final heroSidebarItemIconStyle = IconStyler().size(18);
