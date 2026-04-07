# HeroSidebar Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a sidebar navigation component with header, footer, sections, and items (with selected/hover states).

**Architecture:** Flat composition pattern matching HeroCard. Five widget types: HeroSidebar (root container), HeroSidebarHeader, HeroSidebarFooter, HeroSidebarSection, and HeroSidebarItem. Styles use static resolvers with token-based theming.

**Tech Stack:** Flutter, Mix (BoxStyler, TextStyler, IconStyler, PressableBox, StyledText, StyledIcon, Box), hero_tokens.dart

---

### Task 1: Create HeroSidebarItem style resolver

**Files:**
- Create: `lib/src/components/sidebar/hero_sidebar_style.dart`

- [ ] **Step 1: Create the style file with item styles**

```dart
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
        .mainAxisSize(.min)
        .animate(.ease(100.ms));
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

final heroSidebarContainerStyle = BoxStyler()
    .color($surface())
    .width(260)
    .borderOnly(right: BorderSideStyler().color($border()).width(1));

final heroSidebarHeaderStyle = BoxStyler().padding(.fromLTRB(16, 16, 16, 0));

final heroSidebarFooterStyle = BoxStyler().padding(.fromLTRB(16, 0, 16, 16));

final heroSidebarSectionTitleStyle =
    TextStyler().style($subheadingXSmall.mix()).color($muted());

final heroSidebarSectionStyle =
    BoxStyler().paddingX(12).paddingTop(16).paddingBottom(4);

final heroSidebarItemLabelStyle = TextStyler().style($labelSmall.mix());

final heroSidebarItemIconStyle = IconStyler().size(18);
```

- [ ] **Step 2: Verify it compiles**

Run: `cd /Users/martinmichelini/conductor/workspaces/hero_ui/islamabad && flutter analyze lib/src/components/sidebar/hero_sidebar_style.dart 2>&1 | tail -5`
Expected: No errors

- [ ] **Step 3: Commit**

```bash
git add lib/src/components/sidebar/hero_sidebar_style.dart
git commit -m "feat(sidebar): add style resolver for sidebar and item styles"
```

---

### Task 2: Create HeroSidebarItem widget

**Files:**
- Create: `lib/src/components/sidebar/hero_sidebar_item.dart`

- [ ] **Step 1: Create the item widget**

```dart
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../tokens/hero_tokens.dart';
import 'hero_sidebar_style.dart';

final class HeroSidebarItem extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Widget? trailing;
  final bool isSelected;
  final VoidCallback? onPressed;

  const HeroSidebarItem({
    super.key,
    required this.label,
    this.icon,
    this.trailing,
    this.isSelected = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final containerStyle = HeroSidebarItemStyle.resolve(isSelected: isSelected);

    final labelColor =
        isSelected ? $accentSoftForeground() : $surfaceForeground();
    final iconColor =
        isSelected ? $accentSoftForeground() : $surfaceForeground();

    return PressableBox(
      onPress: onPressed,
      style: containerStyle,
      child: Row(
        spacing: 10,
        children: [
          if (icon != null)
            StyledIcon(icon!, style: heroSidebarItemIconStyle.color(iconColor)),
          Expanded(
            child: StyledText(
              label,
              style: heroSidebarItemLabelStyle.color(labelColor),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
```

- [ ] **Step 2: Verify it compiles**

Run: `cd /Users/martinmichelini/conductor/workspaces/hero_ui/islamabad && flutter analyze lib/src/components/sidebar/hero_sidebar_item.dart 2>&1 | tail -5`
Expected: No errors

- [ ] **Step 3: Commit**

```bash
git add lib/src/components/sidebar/hero_sidebar_item.dart
git commit -m "feat(sidebar): add HeroSidebarItem widget"
```

---

### Task 3: Create HeroSidebar, HeroSidebarHeader, HeroSidebarFooter, HeroSidebarSection

**Files:**
- Create: `lib/src/components/sidebar/hero_sidebar.dart`

- [ ] **Step 1: Create the sidebar widget file**

```dart
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../tokens/hero_tokens.dart';
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
    return Box(
      style: heroSidebarContainerStyle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
      ),
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
```

- [ ] **Step 2: Verify it compiles**

Run: `cd /Users/martinmichelini/conductor/workspaces/hero_ui/islamabad && flutter analyze lib/src/components/sidebar/hero_sidebar.dart 2>&1 | tail -5`
Expected: No errors

- [ ] **Step 3: Commit**

```bash
git add lib/src/components/sidebar/hero_sidebar.dart
git commit -m "feat(sidebar): add HeroSidebar, HeroSidebarHeader, HeroSidebarFooter, HeroSidebarSection"
```

---

### Task 4: Export sidebar from barrel file

**Files:**
- Modify: `lib/hero_ui.dart`

- [ ] **Step 1: Add sidebar exports to barrel file**

Add the following lines after the Divider exports (line 52) in `lib/hero_ui.dart`:

```dart
// Sidebar
export 'src/components/sidebar/hero_sidebar.dart';
export 'src/components/sidebar/hero_sidebar_item.dart';
export 'src/components/sidebar/hero_sidebar_style.dart';
```

- [ ] **Step 2: Verify the full project compiles**

Run: `cd /Users/martinmichelini/conductor/workspaces/hero_ui/islamabad && flutter analyze lib/ 2>&1 | tail -10`
Expected: No errors

- [ ] **Step 3: Commit**

```bash
git add lib/hero_ui.dart
git commit -m "feat(sidebar): export sidebar components from barrel file"
```
