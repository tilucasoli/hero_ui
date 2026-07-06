import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

part 'hero_tabs_style.dart';

/// Shared configuration propagated from [HeroTabs] to its [HeroTabBar],
/// [HeroTab] and [HeroTabPanel] descendants.
///
/// This lets the `radius` and `enabled` knobs live on the root [HeroTabs] while
/// the individual pieces (which apply their own Hero styling) stay coordinated.
class _HeroTabsScope extends InheritedWidget {
  const _HeroTabsScope({
    required this.radius,
    required this.enabled,
    required super.child,
  });

  final HeroTabsRadius? radius;
  final bool enabled;

  static _HeroTabsScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<_HeroTabsScope>();
    if (scope == null) {
      throw FlutterError(
        'HeroTabBar, HeroTab and HeroTabPanel must be placed inside a HeroTabs.',
      );
    }

    return scope;
  }

  @override
  bool updateShouldNotify(_HeroTabsScope oldWidget) {
    return radius != oldWidget.radius || enabled != oldWidget.enabled;
  }
}

/// A HeroUI-styled tabs component.
///
/// Ports React HeroUI's `<Tabs>` on top of [RemixTabs] using the `solid` style,
/// with an optional radius override. Mirrors the Remix composition model: the
/// root [HeroTabs] owns selection state and shared config, while [HeroTabBar],
/// [HeroTab] and [HeroTabPanel] are composed as children.
///
/// Selection can be controlled by passing [selectedId] together with
/// [onChanged], or left uncontrolled (seeded by [initialId]).
///
/// ```dart
/// HeroTabs(
///   initialId: 'world',
///   onChanged: (id) => print(id),
///   child: Column(
///     mainAxisSize: MainAxisSize.min,
///     crossAxisAlignment: CrossAxisAlignment.stretch,
///     children: [
///       HeroTabBar(
///         children: [
///           HeroTab(tabId: 'world', label: 'World'),
///           HeroTab(tabId: 'ny', label: 'N.Y'),
///         ],
///       ),
///       HeroTabPanel(tabId: 'world', child: Text('World content')),
///       HeroTabPanel(tabId: 'ny', child: Text('N.Y content')),
///     ],
///   ),
/// )
/// ```
final class HeroTabs extends StatefulWidget {
  /// The tab tree — typically a [Column] of a [HeroTabBar] and [HeroTabPanel]s.
  final Widget child;

  /// The corner radius applied to the [HeroTabBar] and its [HeroTab]s.
  final HeroTabsRadius? radius;

  /// Whether the whole tabs component is interactive.
  final bool enabled;

  /// The selected tab id when the component is controlled.
  final String? selectedId;

  /// The initially selected tab id when uncontrolled.
  final String? initialId;

  /// Called with the new tab id whenever the selection changes.
  final ValueChanged<String>? onChanged;

  const HeroTabs({
    super.key,
    required this.child,
    this.radius,
    this.enabled = true,
    this.selectedId,
    this.initialId,
    this.onChanged,
  }) : assert(
         selectedId != null || initialId != null,
         'Provide selectedId (controlled) or initialId (uncontrolled).',
       );

  @override
  State<HeroTabs> createState() => _HeroTabsState();
}

class _HeroTabsState extends State<HeroTabs> {
  late String _selectedId;

  bool get _isControlled => widget.selectedId != null;

  String get _currentId => _isControlled ? widget.selectedId! : _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.initialId ?? widget.selectedId!;
  }

  void _handleChanged(String id) {
    if (!_isControlled) {
      setState(() => _selectedId = id);
    }
    widget.onChanged?.call(id);
  }

  @override
  Widget build(BuildContext context) {
    return _HeroTabsScope(
      radius: widget.radius,
      enabled: widget.enabled,
      child: RemixTabs(
        selectedTabId: _currentId,
        enabled: widget.enabled,
        onChanged: _handleChanged,
        child: widget.child,
      ),
    );
  }
}

/// The tab-list container of a [HeroTabs].
///
/// Wraps [RemixTabBar] with the HeroUI `tabList` slot styling and lays its
/// [children] out as equal-width tabs.
final class HeroTabBar extends StatelessWidget {
  /// The tabs to render, in order (typically [HeroTab]s).
  final List<Widget> children;

  /// Style override merged onto the resolved tab-list (bar) style.
  final RemixTabBarStyle? style;

  const HeroTabBar({super.key, required this.children, this.style});

  @override
  Widget build(BuildContext context) {
    final scope = _HeroTabsScope.of(context);

    var barStyle = HeroTabsStyle.barStyle(radius: scope.radius).merge(style);
    if (!scope.enabled) {
      barStyle = barStyle.wrap(.opacity(0.5));
    }

    final row = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) {
        row.add(const SizedBox(width: 8));
      }
      row.add(Expanded(child: children[i]));
    }

    // RemixTabBar drops this widget straight into its internal FlexBox. Wrapping
    // the row in an Expanded makes it a real flex child so it receives a bounded
    // width for the tabs to share equally, instead of being measured unbounded.
    return RemixTabBar(
      style: barStyle,
      child: Expanded(child: Row(children: row)),
    );
  }
}

/// A single tab button inside a [HeroTabBar].
///
/// Wraps [RemixTab] with the HeroUI `tab` + `tabContent` slot styling. Selecting
/// it activates the [HeroTabPanel] whose id matches [tabId].
final class HeroTab extends StatelessWidget {
  /// Unique identifier for this tab (maps to React's `key`).
  final String tabId;

  /// Text shown in the tab. Ignored when [title] is provided.
  final String? label;

  /// Custom title widget shown in the tab. Takes precedence over [label].
  final Widget? title;

  /// Optional leading icon shown before the label.
  final IconData? icon;

  /// Whether this tab can be selected.
  final bool enabled;

  /// Style override merged onto the resolved individual-tab style.
  final RemixTabStyle? style;

  const HeroTab({
    super.key,
    required this.tabId,
    this.label,
    this.title,
    this.icon,
    this.enabled = true,
    this.style,
  }) : assert(
         label != null || title != null,
         'Either label or title must be provided',
       );

  @override
  Widget build(BuildContext context) {
    final scope = _HeroTabsScope.of(context);
    final tabStyle = HeroTabsStyle.tabStyle(radius: scope.radius).merge(style);

    return RemixTab(
      tabId: tabId,
      enabled: scope.enabled && enabled,
      style: tabStyle,
      icon: icon,
      label: title == null ? label : null,
      child: title,
    );
  }
}

/// A HeroUI-styled tab panel.
///
/// Wraps [RemixTabView] with the HeroUI `panel` slot styling. It is shown when
/// the tab whose id matches [tabId] is selected within a [HeroTabs].
final class HeroTabPanel extends StatelessWidget {
  /// The id of the tab this panel belongs to (must match a [HeroTab.tabId]).
  final String tabId;

  /// The content shown when the matching tab is selected.
  final Widget child;

  /// Style override merged onto the resolved panel style.
  final RemixTabViewStyle? style;

  const HeroTabPanel({
    super.key,
    required this.tabId,
    required this.child,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return RemixTabView(
      tabId: tabId,
      style: HeroTabsStyle.panelStyle().merge(style),
      child: child,
    );
  }
}
