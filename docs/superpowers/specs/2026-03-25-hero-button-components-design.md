# HeroButton & HeroButtonGroup Design Spec

## Overview

Two Flutter components built on top of Remix's `RemixButton` and Mix's styling system, porting the HeroUI reference (React/TSX) button and button-group components to Flutter.

## Dependencies

- `mix` (GitHub main: https://github.com/btwld/mix)
- `remix` (GitHub main: https://github.com/btwld/remix) — brings `naked_ui` transitively

## File Structure

```
lib/
├── hero_ui.dart                                # barrel export
└── src/
    ├── tokens/
    │   └── hero_tokens.dart                    # ColorTokens, SpaceTokens
    ├── theme/
    │   └── hero_theme.dart                     # MixScope wrapper with defaults
    └── components/
        ├── button/
        │   ├── hero_button.dart                # HeroButton widget
        │   ├── hero_button_style.dart          # enum → RemixButtonStyle mapping
        │   └── hero_button_variants.dart       # HeroButtonVariant & HeroButtonSize enums
        └── button_group/
            ├── hero_button_group.dart          # HeroButtonGroup widget + InheritedWidget
            ├── hero_button_group_separator.dart # separator widget
            └── hero_button_group_style.dart    # group-specific styling
```

---

## Component 1: HeroButton

### API

```dart
HeroButton(
  variant: HeroButtonVariant.primary,   // required
  size: HeroButtonSize.md,              // default: md
  label: 'Submit',                      // optional, omit for icon-only buttons
  iconLeft: Icons.add,                  // optional leading icon
  iconRight: Icons.arrow_forward,       // optional trailing icon
  isIconOnly: false,                    // default: false, when true uses square dimensions and hides label
  isLoading: false,                     // default: false, shows spinner + disables
  isDisabled: false,                    // default: false
  fullWidth: false,                     // default: false
  onPressed: () {},                     // required
  style: null,                          // optional RemixButtonStyle override
)
```

### Enums

```dart
enum HeroButtonVariant {
  primary,
  secondary,
  tertiary,
  outline,
  ghost,
  danger,
  dangerSoft,
}

enum HeroButtonSize {
  sm,
  md,
  lg,
}
```

### Internals

`HeroButton` is a `StatelessWidget` that:

1. Checks for `HeroButtonGroupData` inherited widget (group context)
2. Resolves final props: direct prop > group context > default
3. Calls `HeroButtonStyle.resolve(variant, size, ...)` to produce a `RemixButtonStyle`
4. If a custom `style` is passed, merges it on top
5. Passes the resolved style to `RemixButton`

### Variant → Style Mapping

| Variant      | Background     | Hover/Pressed BG       | Foreground                |
|-------------|----------------|------------------------|---------------------------|
| primary     | `$accent`      | `$accentHover`         | `$accentForeground`       |
| secondary   | `$default`     | `$defaultHover`        | `$accentSoftForeground`   |
| tertiary    | `$default`     | `$defaultHover`        | `$defaultForeground`      |
| outline     | transparent + `$border` border | `$default` 60% | `$defaultForeground`    |
| ghost       | transparent    | `$default`             | `$defaultForeground`      |
| danger      | `$danger`      | `$dangerHover`         | `$dangerForeground`       |
| dangerSoft  | `$dangerSoft`  | `$dangerSoftHover`     | `$dangerSoftForeground`   |

### Size → Style Mapping

| Size | Height | Padding X | Icon Size | Font Size | Press Scale |
|------|--------|-----------|-----------|-----------|-------------|
| sm   | 32     | 12        | 16        | 14        | 0.98        |
| md   | 36     | 16        | 18        | 14        | 0.97        |
| lg   | 40     | 16        | 20        | 16        | 0.96        |

Icon-only buttons use square dimensions (width = height, no padding).

Full-width buttons stretch to fill available width.

### Interactive States

- **Hover**: swaps to hover background color
- **Pressed**: hover background + scale transform
- **Disabled**: reduced opacity (0.5), no pointer events
- **Focused**: 2px focus ring with offset
- **Loading**: spinner shown, button disabled visually

---

## Component 2: HeroButtonGroup

### API

```dart
HeroButtonGroup(
  variant: HeroButtonVariant.tertiary,  // propagated to children
  size: HeroButtonSize.md,             // propagated to children
  isDisabled: false,                   // propagated to children
  fullWidth: false,                    // propagated to children
  orientation: Axis.horizontal,        // default: horizontal
  children: [
    HeroButton(label: 'First', onPressed: () {}),
    HeroButtonGroupSeparator(),
    HeroButton(label: 'Second', onPressed: () {}),
  ],
)
```

### Context Propagation

Uses `HeroButtonGroupData` (InheritedWidget) carrying:
- `variant`, `size`, `isDisabled`, `fullWidth`
- `orientation`
- `position` metadata (`isFirst`, `isLast`) for border radius

Resolution order in HeroButton: **direct prop > group context > default**.

### Child Position Detection

`HeroButtonGroup` lays out children in a `Flex` widget. It iterates the children list, filters out separators, determines button positions, and passes `isFirst`/`isLast` through the inherited widget.

### ButtonGroup Style Overrides

When inside a group, buttons get:
- `borderRadius: 0` (except first gets start radius, last gets end radius)
- Press scale disabled (no transform)
- Focus ring uses inset style
- Outline variant: adjacent borders collapsed

### Border Radius Rules

**Horizontal:**
- First button: start corners rounded (topLeft, bottomLeft in LTR)
- Last button: end corners rounded (topRight, bottomRight in LTR)
- Single button: all corners rounded

**Vertical:**
- First button: top corners rounded
- Last button: bottom corners rounded
- Single button: all corners rounded

### Outline Border Collapsing

**Horizontal:**
- First: no end border
- Last: no start border
- Middle: no inline borders

**Vertical:**
- First: no bottom border
- Last: no top border
- Middle: no block borders

### Separator

`HeroButtonGroupSeparator`:
- Horizontal: vertical line, 1px wide, 50% button height, centered, absolute positioned to left edge
- Vertical: horizontal line, 1px high, 50% button width, centered, absolute positioned to top edge
- Color: `currentColor` at 15% opacity
- Reads orientation from group inherited widget

---

## Tokens

### Color Tokens

```dart
// Accent
$accent, $accentHover, $accentForeground

// Default
$default, $defaultHover, $defaultForeground

// Accent soft
$accentSoftForeground

// Danger
$danger, $dangerHover, $dangerForeground

// Danger soft
$dangerSoft, $dangerSoftHover, $dangerSoftForeground

// Border
$border
```

### Size Tokens

```dart
$buttonHeightSm   // 32
$buttonHeightMd   // 36
$buttonHeightLg   // 40

$buttonPaddingSm  // 12
$buttonPaddingMd  // 16
$buttonPaddingLg  // 16

$buttonRadius     // 24
```

### HeroTheme

Convenience widget wrapping `MixScope`:

```dart
HeroTheme(
  accent: Colors.blue,    // seeds accent tokens
  danger: Colors.red,     // seeds danger tokens
  child: MyApp(),
)
```

Generates hover/foreground/soft variants from the seed colors automatically. Full control available via `HeroTokenData`.
