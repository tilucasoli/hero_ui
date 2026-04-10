import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../tokens/hero_tokens.dart';

part 'hero_sidebar_style.dart';

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
    return ColumnBox(
      style: HeroSidebarStyle._baseStyle(),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null)
          StyledText(title!, style: HeroSidebarStyle._sectionTitleStyle()),
        ...children,
      ],
    );
  }
}
