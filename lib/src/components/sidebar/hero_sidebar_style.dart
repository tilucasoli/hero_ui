import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../tokens/hero_tokens.dart';

final heroSidebarItemStyle = BoxStyler()
    .borderRounded(8)
    .paddingX(12)
    .paddingY(8)
    .color(Colors.transparent)
    .animate(AnimationConfig.ease(100.ms))
    .onHovered(.color($defaultHover()))
    .variant(
      ContextVariant.widgetState(.selected),
      .color($default()).onHovered(.color($default())),
    );

final heroSidebarContainerStyle = FlexBoxStyler()
    .crossAxisAlignment(.stretch)
    .color($background())
    .width(260);

final heroSidebarHeaderStyle = BoxStyler().padding(.fromLTRB(16, 16, 16, 0));

final heroSidebarFooterStyle = BoxStyler().padding(.fromLTRB(16, 0, 16, 16));

final heroSidebarSectionTitleStyle = TextStyler()
    .style($subheadingXSmall.mix())
    .color($muted());

final heroSidebarSectionStyle = BoxStyler()
    .paddingX(12)
    .paddingTop(16)
    .paddingBottom(4);

final heroSidebarItemLabelStyle = TextStyler().style($labelSmall.mix());

final heroSidebarItemIconStyle = IconStyler().size(18);
