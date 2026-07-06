part of 'hero_tabs.dart';

enum HeroTabsRadius { none, sm, md, lg, full }

final class HeroTabsStyle {
  HeroTabsStyle._();

  static const double _fullRadius = 9999;
  static const double _tabHeight = 32;
  static const double _iconSize = 18;
  static const HeroTabsRadius _defaultRadius = HeroTabsRadius.md;

  // == Metrics ==

  static TextStyler _labelStyle() => TextStyler().style($labelSmall.mix());

  static double _listRadius(HeroTabsRadius? radius) {
    return switch (radius ?? _defaultRadius) {
      HeroTabsRadius.none => 0,
      HeroTabsRadius.sm => 12,
      HeroTabsRadius.md => 12,
      HeroTabsRadius.lg => 14,
      HeroTabsRadius.full => _fullRadius,
    };
  }

  static double _tabRadius(HeroTabsRadius? radius) {
    return switch (radius ?? _defaultRadius) {
      HeroTabsRadius.none => 0,
      HeroTabsRadius.sm => 8,
      HeroTabsRadius.md => 8,
      HeroTabsRadius.lg => 12,
      HeroTabsRadius.full => _fullRadius,
    };
  }

  // == Styles ==

  /// The tab-list container (React's `tabList` slot).
  static RemixTabBarStyle barStyle({HeroTabsRadius? radius}) {
    return RemixTabBarStyle().container(
      FlexBoxStyler()
          .direction(.horizontal)
          .mainAxisSize(.max)
          .mainAxisAlignment(.center)
          .crossAxisAlignment(.center)
          .padding(.all(4))
          .borderRounded(_listRadius(radius))
          .color($default()),
    );
  }

  /// A single tab button (React's `tab` + `tabContent` slots).
  static RemixTabStyle tabStyle({HeroTabsRadius? radius}) {
    return RemixTabStyle()
        .container(
          FlexBoxStyler()
              .height(_tabHeight)
              .paddingX(12)
              .borderRounded(_tabRadius(radius))
              .mainAxisSize(.min)
              .mainAxisAlignment(.center)
              .crossAxisAlignment(.center)
              .spacing(6),
        )
        .label(_labelStyle().color($muted()))
        .icon(IconStyler(color: $muted(), size: _iconSize))
        .animate(.easeOut(250.ms))
        .onHovered(RemixTabStyle().wrap(.opacity(0.7)))
        .onDisabled(RemixTabStyle().wrap(.opacity(0.4)))
        .onSelected(
          RemixTabStyle()
              .wrap(.opacity(1))
              .color($segment())
              .label(
                _labelStyle().color($segmentForeground()).fontWeight(.w500),
              )
              .icon(IconStyler(color: $segmentForeground(), size: _iconSize)),
        );
  }

  /// A tab panel (React's `panel` slot).
  static RemixTabViewStyle panelStyle() {
    return RemixTabViewStyle().padding(
      .only(top: 12, bottom: 12, left: 4, right: 4),
    );
  }
}
