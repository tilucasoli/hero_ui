import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../divider/hero_divider.dart';
import 'hero_sidebar_style.dart';

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
      style: heroSidebarContainerStyle,
      children: [
        if (header != null) ...[
          header!,
          const HeroDivider(),
        ],
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
        if (footer != null) ...[
          const HeroDivider(),
          footer!,
        ],
      ],
    );
  }
}

final class HeroSidebarHeader extends StatelessWidget {
  final Widget child;

  const HeroSidebarHeader({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Box(style: heroSidebarHeaderStyle, child: child);
  }
}

final class HeroSidebarFooter extends StatelessWidget {
  final Widget child;

  const HeroSidebarFooter({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Box(style: heroSidebarFooterStyle, child: child);
  }
}

final class HeroSidebarSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const HeroSidebarSection({
    super.key,
    this.title,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null)
          Box(
            style: heroSidebarSectionStyle,
            child: StyledText(title!, style: heroSidebarSectionTitleStyle),
          ),
        ...children,
      ],
    );
  }
}
