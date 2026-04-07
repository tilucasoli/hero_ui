# HeroSidebar Component Design

## Overview

A sidebar navigation component for HeroUI, composed of five sub-components following the flat composition pattern used by HeroCard.

## Sub-components

| Widget | Role |
|--------|------|
| `HeroSidebar` | Root container — vertical column with background, right border, and fixed width. Takes `header`, `footer`, and `children`. |
| `HeroSidebarHeader` | Top slot for branding/logo. Takes a `child` widget. Separated from content by a divider. |
| `HeroSidebarFooter` | Bottom slot for user profile/actions. Takes a `child` widget. Pinned to bottom, separated by a divider. |
| `HeroSidebarSection` | Groups items under an optional `title` label. |
| `HeroSidebarItem` | Individual navigation item with label, optional leading icon, optional trailing widget, selected state, and `onPressed` callback. |

## File Structure

```
lib/src/components/sidebar/
  hero_sidebar.dart         # HeroSidebar, HeroSidebarHeader, HeroSidebarFooter, HeroSidebarSection
  hero_sidebar_style.dart   # HeroSidebarStyle + HeroSidebarItemStyle enums and style resolvers
  hero_sidebar_item.dart    # HeroSidebarItem widget
```

## API

### HeroSidebar

```dart
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
}
```

Layout: vertical column. Header at top, then scrollable content area with `children`, footer pinned at bottom. Separators between header/content and content/footer.

### HeroSidebarHeader

```dart
final class HeroSidebarHeader extends StatelessWidget {
  final Widget child;

  const HeroSidebarHeader({super.key, required this.child});
}
```

Renders child with padding inside the header slot.

### HeroSidebarFooter

```dart
final class HeroSidebarFooter extends StatelessWidget {
  final Widget child;

  const HeroSidebarFooter({super.key, required this.child});
}
```

Renders child with padding inside the footer slot.

### HeroSidebarSection

```dart
final class HeroSidebarSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const HeroSidebarSection({
    super.key,
    this.title,
    this.children = const [],
  });
}
```

Renders an optional title label above a list of items. Title uses `$subheadingXSmall` token with `$muted` color, uppercase.

### HeroSidebarItem

```dart
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
}
```

Renders a pressable row with optional icon, label, and trailing widget. Supports hover and selected visual states.

## Styling

### HeroSidebarStyle

Container style resolver for the root `HeroSidebar`:

- Background: `$surface`
- Right border: `$border`, 1px
- Width: 260px (fixed)
- Height: fills available space

### HeroSidebarItemStyle

Item style resolver for `HeroSidebarItem`:

- **Default state:** transparent background, `$surfaceForeground` text and icon color, `$labelSmall` text style, icon size 18, border radius 8, horizontal padding 12, vertical padding 8.
- **Hovered state:** `$defaultHover` background
- **Selected state:** `$default` background, `$accentSoftForeground` text and icon color
- Transition: `ease 100ms` animation on background/color changes

### Section Title Style

- Text style: `$subheadingXSmall`
- Color: `$muted`
- Padding: horizontal 12, top 16, bottom 4

### Header/Footer

- Padding: 16 all sides
- Separated from content by `HeroDivider` (horizontal)

## Barrel Export

Add exports to `lib/hero_ui.dart`:

```dart
// Sidebar
export 'src/components/sidebar/hero_sidebar.dart';
export 'src/components/sidebar/hero_sidebar_item.dart';
export 'src/components/sidebar/hero_sidebar_style.dart';
```

## Patterns Followed

- **Flat composition** — matches HeroCard's pattern of separate header/content/footer widgets
- **Style resolver** — static `resolve()` method with private constructor, matching HeroButtonStyle
- **Token-based theming** — all colors and text styles reference design tokens
- **Final classes** — all widgets use `final class`
- **Animate** — hover/selected transitions use `.animate(.ease(100.ms))`
