import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../components/sidebar/hero_sidebar.dart';
import '../../components/sidebar/hero_sidebar_item.dart';
import '../../tokens/hero_tokens.dart';

final class DashboardBlock extends StatelessWidget {
  final String selectedItem;
  final ValueChanged<String>? onItemSelected;

  const DashboardBlock({
    super.key,
    this.selectedItem = 'overview',
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeroSidebar(
          header: HeroSidebarHeader(
            child: StyledText(
              'Acme Inc',
              style: TextStyler()
                  .style($labelLarge.mix())
                  .color($surfaceForeground()),
            ),
          ),
          footer: HeroSidebarFooter(
            child: Row(
              spacing: 10,
              children: [
                Icon(Icons.account_circle, size: 28, color: $muted.resolve(context)),
                Expanded(
                  child: StyledText(
                    'John Doe',
                    style: TextStyler()
                        .style($labelSmall.mix())
                        .color($surfaceForeground()),
                  ),
                ),
              ],
            ),
          ),
          children: [
            HeroSidebarSection(
              title: 'Main',
              children: [
                HeroSidebarItem(
                  label: 'Overview',
                  icon: Icons.dashboard_outlined,
                  isSelected: selectedItem == 'overview',
                  onPressed: () => onItemSelected?.call('overview'),
                ),
                HeroSidebarItem(
                  label: 'Analytics',
                  icon: Icons.bar_chart_outlined,
                  isSelected: selectedItem == 'analytics',
                  onPressed: () => onItemSelected?.call('analytics'),
                ),
                HeroSidebarItem(
                  label: 'Reports',
                  icon: Icons.description_outlined,
                  isSelected: selectedItem == 'reports',
                  onPressed: () => onItemSelected?.call('reports'),
                ),
              ],
            ),
            HeroSidebarSection(
              title: 'Settings',
              children: [
                HeroSidebarItem(
                  label: 'Account',
                  icon: Icons.person_outline,
                  isSelected: selectedItem == 'account',
                  onPressed: () => onItemSelected?.call('account'),
                ),
                HeroSidebarItem(
                  label: 'Preferences',
                  icon: Icons.settings_outlined,
                  isSelected: selectedItem == 'preferences',
                  onPressed: () => onItemSelected?.call('preferences'),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: StyledText(
              selectedItem[0].toUpperCase() + selectedItem.substring(1),
              style: TextStyler()
                  .style($titleH4.mix())
                  .color($muted()),
            ),
          ),
        ),
      ],
    );
  }
}
