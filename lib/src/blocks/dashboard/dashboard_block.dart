import 'package:flutter/material.dart';
import 'package:hero_ui/hero_ui.dart';

final class DashboardBlock extends StatelessWidget {
  final Widget? header;
  final Widget? footer;
  final List<Widget> sidebarChildren;
  final Widget? child;

  const DashboardBlock({
    super.key,
    this.header,
    this.footer,
    this.sidebarChildren = const [],
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: $background.resolve(context),
      child: Row(
        children: [
          HeroSidebar(
            header: header,
            footer: footer,
            children: sidebarChildren,
          ),
          Expanded(
            child: Padding(
              padding: const .all(8.0),
              child: HeroCard(variant: .tertiary, child: child),
            ),
          ),
        ],
      ),
    );
  }
}
