import 'package:flutter/material.dart';
import 'package:hero_ui/hero_ui.dart';
import 'package:mix/mix.dart';

final class HeroSidebar extends StatelessWidget {
  final Widget? header;
  final Widget? footer;
  final List<Widget> children;

  const HeroSidebar({
    super.key,
    this.header,
    this.footer,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    final heroSidebarStyle = FlexBoxStyler()
        .crossAxisAlignment(.stretch)
        .color($background())
        .width(260)
        .padding(.horizontal(12).vertical(16));

    return ColumnBox(
      style: heroSidebarStyle,
      children: [
        ?header,
        Expanded(
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: .stretch, children: children),
          ),
        ),
        ?footer,
      ],
    );
  }
}

final class HeroSidebarSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const HeroSidebarSection({super.key, this.title, this.children = const []});

  @override
  Widget build(BuildContext context) {
    final heroSidebarSectionTitleStyle = TextStyler()
        .style($subheadingXSmall.mix())
        .color($muted())
        .wrap(.padding(.fromLTRB(12, 16, 12, 8)));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null)
          StyledText(title!, style: heroSidebarSectionTitleStyle),
        ...children,
      ],
    );
  }
}
