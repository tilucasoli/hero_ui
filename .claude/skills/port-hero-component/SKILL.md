---
name: port-hero-component
description: Use whenever the user asks to port, translate, recreate, or scaffold a HeroUI component from the React reference in `hero_ui_reference/` into a new Flutter component under `lib/src/components/`. Trigger on phrases like "port the X component", "create the HeroX widget", "add a HeroSwitch", "translate the switch from the reference", or any request that maps a folder under `hero_ui_reference/` to a new folder under `lib/src/components/`. Also trigger when the user hands you a React/HeroUI reference file and asks for its Flutter equivalent, even if they don't name the architecture explicitly.
---

# Porting HeroUI React components to Flutter

This project is a Flutter component library that mirrors the React HeroUI library. Every component under `hero_ui_reference/<name>/` has a Flutter counterpart under `lib/src/components/<name>/` built on top of [Remix](https://pub.dev/packages/remix) (which itself wraps Mix + Naked UI). Your job when this skill triggers is to produce a Flutter port that follows the existing architecture *exactly* — not your general intuition about how a Flutter widget "should" look.

The architecture is load-bearing: every component in this library uses the same shape so that consumers get a consistent API, the Fortal/Hero token system stays in control of visuals, and variant/state logic lives in one predictable place. If you invent a new shape you will introduce drift that the user will have to undo by hand.

## The core architecture

Every Hero component is a **two-file unit** living in its own directory:

```
lib/src/components/<snake_name>/
├── hero_<snake_name>.dart         # the widget
└── hero_<snake_name>_style.dart   # the style + variant enums
```

Naming rules:
- Directory uses `snake_case` matching the React folder name converted from kebab-case (`button-group` → `button_group`).
- Widget class is `Hero<PascalName>` (`HeroButton`, `HeroButtonGroup`, `HeroCard`).
- Style file exposes `hero<PascalName>Style` (a top-level final) OR `Hero<PascalName>Style` (a class with static methods). See "Two shapes" below.
- Variant enums are `Hero<PascalName>Variant`, `Hero<PascalName>Size`, etc.

Every widget class is declared `final class` — we lean on Dart 3's class modifiers to prevent accidental subclassing of library primitives.

## Two shapes: simple vs. rich

The codebase has two valid shapes for the style file. Pick the one that matches what the React component does — don't mix them.

### Shape A — Simple (`hero_card.dart` / `hero_card_style.dart`)

Use when the component has **one dimension of variance** (just "variant", no size axis, no internal boolean states like `iconOnly`). The style file is a standalone Dart file with its own imports, and exposes a top-level `hero<Name>Style` built as a single expression chain.

Widget file pattern:
```dart
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import 'hero_card_style.dart';

final class HeroCard extends StatelessWidget {
  final HeroCardVariant variant;
  final RemixCardStyle? style;
  final Widget? child;

  const HeroCard({
    super.key,
    this.variant = .defaultVariant,
    this.style,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RemixCard(
      style: heroCardStyle.merge(style).applyVariants([variant]),
      child: child,
    );
  }
}

// Top-level slot stylers for subcomponents (React's <Card.Header>, <Card.Title>, ...)
final HeroCardHeader = BoxStyler().padding(.fromLTRB(24, 24, 24, 0));
final HeroCardTitle = TextStyler().style($labelLarge.mix()).color($surfaceForeground());
```

Style file pattern:
```dart
import 'package:flutter/widgets.dart';
import 'package:hero_ui/src/utils/inherited_variant.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

enum HeroCardVariant with EnumVariant { defaultVariant, secondary, tertiary }

final heroCardStyle = RemixCardStyle()
    .borderRounded(12)
    // ... base styles ...
    .enumVariant(
      HeroCardVariant.defaultVariant,
      style: RemixCardStyle().color($surface()),
    )
    .enumVariant(
      HeroCardVariant.secondary,
      style: RemixCardStyle().color($default()),
    );
```

Notes:
- `// ignore_for_file: non_constant_identifier_names` is required at the top of the widget file if you declare PascalCase top-level stylers like `HeroCardHeader` (Dart lint otherwise complains).
- Subcomponent slots (`HeroCardHeader`, `HeroCardTitle`, `HeroCardContent`, `HeroCardFooter`) map to React's `Card.Header`, `Card.Title`, etc. — they are not widgets, they are `BoxStyler`/`TextStyler` values the consumer applies themselves. Only add slots that the React reference actually exposes.

### Shape B — Rich (`hero_button.dart` / `hero_button_style.dart`)

Use when the component has **multiple variant axes** (variant + size), **internal state variants** (iconOnly, fullWidth, loading), or **group context** (e.g. `ButtonGroup` providing defaults to its children). The style file becomes a `part of` the widget file, allowing private `_InternalVariants` enums and a `HeroXStyle` class with static `_baseStyle()` / `_sizeStyle()` / `_variantStyles()` methods that get merged together at build time.

Widget file pattern:
```dart
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../../utils/inherited_variant.dart';

part 'hero_button_style.dart';

final class HeroButton extends StatelessWidget {
  final HeroButtonVariant variant;
  final HeroButtonSize size;
  // ... other props ...
  final RemixButtonStyle? style;

  const HeroButton({
    super.key,
    this.variant = .primary,
    this.size = .md,
    // ...
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = HeroButtonStyle._baseStyle()
        .merge(HeroButtonStyle._sizeStyle())
        .merge(HeroButtonStyle._variantStyles())
        .merge(style)
        .applyVariants([
          variant,
          size,
          if (iconOnly) _InternalVariants.iconOnly,
          if (fullWidth) _InternalVariants.fullWidth,
        ]);

    return RemixButton(style: resolvedStyle, /* ... */);
  }
}
```

Style file pattern (note the `part of` — no imports here, they come from the widget file):
```dart
part of 'hero_button.dart';

enum HeroButtonVariant with EnumVariant { primary, secondary, tertiary, outline, ghost, danger, dangerSoft }
enum HeroButtonSize with EnumVariant { sm, md, lg }
enum _InternalVariants with EnumVariant { iconOnly, fullWidth }

final class HeroButtonStyle {
  HeroButtonStyle._();

  static RemixButtonStyle _baseStyle() { /* ... */ }
  static RemixButtonStyle _sizeStyle() { /* size.enumVariant(...) chains */ }
  static RemixButtonStyle _variantStyles() { /* variant.enumVariant(...) chains */ }
}
```

Why the `part` split in the rich shape: it lets `_InternalVariants` and the static `HeroButtonStyle._baseStyle()` methods stay file-private while still being organised into their own file. Don't use `part` in the simple shape — it's unnecessary ceremony there.

### How to choose

Read the React reference first. If you see:
- A single `variant` prop (or no variants at all) → **Shape A (simple)**.
- A `size` prop alongside `variant`, boolean flags like `isIconOnly`/`fullWidth`/`isLoading` that change appearance, or a sibling `<X>Group` component → **Shape B (rich)**.

When in doubt, `hero_card.dart` and `hero_button.dart` are your canonical references — open them side by side with the component you're porting.

## Conventions that apply to every component

### Variant enums use `EnumVariant`

Never use raw `enum` for anything Remix needs to variant on. Always mix in `EnumVariant` from `lib/src/utils/inherited_variant.dart`:

```dart
enum HeroSwitchVariant with EnumVariant { defaultVariant, success, danger }
enum HeroSwitchSize with EnumVariant { sm, md, lg }
```

`EnumVariant` makes the enum implement Remix's `NamedVariant` so it can be passed to `.enumVariant(...)` and `.applyVariants([...])`. If you use `default` as a case name, rename it to `defaultVariant` — `default` is a reserved keyword in Dart. Use `sm` / `md` / `lg` for sizes (not `small`/`medium`/`large`) to match the React reference.

### Use Dart 3 dot-shorthand everywhere it works

This codebase leans heavily on Dart 3.6+ enum / constructor shorthand. Defaults and style calls use the leading-dot form when the target type is inferred:

```dart
this.variant = .primary,                             // not HeroButtonVariant.primary
this.size = .md,
.padding(.fromLTRB(24, 24, 24, 0))                   // not EdgeInsets.fromLTRB(...)
.container(.clipBehavior(.antiAlias))
.animate(.easeOut(100.ms))
.onPressed(.new().container(.scale(0.97)))           // .new() = RemixXStyle()
```

Match this style — full names like `RemixButtonStyle().mainAxisSize(MainAxisSize.max)` read as noise next to the rest of the file.

### Tokens, not raw colours

Colours, text styles, and durations come from `lib/src/tokens/hero_tokens.dart` — never hardcode a `Color(0xFF...)`. Common tokens:

- Surfaces/backgrounds: `$background()`, `$surface()`, `$overlay()`, `$muted()`
- Foregrounds: `$foreground()`, `$surfaceForeground()`, `$overlayForeground()`, `$mutedForeground()`
- Semantic: `$accent()` / `$accentForeground()` / `$accentHover()`, `$danger()` / `$dangerSoft()` / `$dangerHover()`, `$success()`, `$warning()`
- Defaults: `$default()` / `$defaultForeground()` / `$defaultHover()`
- Chrome: `$border()`, `$separator()`, `$focus()`, `$link()`
- Fields: `$fieldBackground()`, `$fieldForeground()`, `$fieldPlaceholder()`, `$fieldBorder()`
- Text: `$labelSmall`, `$labelMedium`, `$labelLarge`, `$paragraphSmall`, etc. (used via `.style($labelSmall.mix())`)

If you need a token that doesn't exist, stop and ask the user before inventing one — the token list is the contract with the design system.

### Group context via `InheritedWidget`

When the React reference has an `<XGroup>` whose child `<X>` reads context (e.g. `ButtonGroupContext` in React), port it as a Flutter `InheritedWidget` named `Hero<X>GroupData`. See `hero_button_group.dart` for the canonical example:

1. Define `HeroXGroupData extends InheritedWidget` with the shared props and a `static maybeOf(BuildContext context)`.
2. In the child widget's `build`, do `final groupData = HeroXGroupData.maybeOf(context);` and let group values take precedence over the widget's own defaults (`groupData?.variant ?? variant`).
3. If the group needs to override styles on its children (e.g. square the corners of middle buttons), expose a static method on `HeroXGroupStyle` that returns a `RemixXStyle` override, and `.merge(groupData != null ? HeroXGroupStyle.buttonOverride() : null)` in the child's build.

Don't use `Provider`, `Riverpod`, or callbacks for this — `InheritedWidget` is the established pattern and keeps the library dependency-free.

### Imports

From inside `lib/src/components/<name>/`, use relative imports for everything in-package:

```dart
import 'package:flutter/material.dart';     // or widgets.dart if you don't need Material
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../../utils/inherited_variant.dart';  // only if you need InheritedWidget helpers
// sibling component, e.g. from button importing button_group:
import '../button_group/hero_button_group.dart';
```

Do NOT import via `package:hero_ui/...` from inside `lib/` — that creates circular-import hazards. (The one exception is `hero_button_group_style.dart`, which imports `package:hero_ui/hero_ui.dart` to access the public variant enum; prefer relative imports when you can.)

### Export from `lib/hero_ui.dart`

After creating the component, add exports to `lib/hero_ui.dart` so consumers can reach it. Follow the order and grouping of the existing exports in that file — don't just append to the end without checking.

## Workflow when this skill triggers

1. **Read both canonical references first**: `hero_ui_reference/<name>/<name>.tsx` (and `<name>.stories.tsx` if present) to understand the API surface, props, and visual variants the component needs to support. The stories file is especially valuable — each story usually maps to a visual state or variant combination you'll need to cover.
2. **Decide Shape A vs Shape B** using the rules above.
3. **Pick the closest existing Hero component as your template** and keep it open. For Shape A: `hero_card.dart`. For Shape B with size: `hero_button.dart`. For group context: `hero_button_group.dart`. Copy the structure, then adapt.
4. **Check that the Remix primitive exists.** Every Hero component delegates to a `Remix<X>` widget and styles a `Remix<X>Style`. If Remix doesn't have the primitive you need (`RemixSwitch`, `RemixSlider`, etc.), stop and surface that to the user — don't try to implement the behaviour from scratch.
5. **Map React prop → Flutter prop** using the naming in the existing components:
   - `isDisabled` → `enabled` (inverted default `true`)
   - `isLoading` / `isPending` → `loading`
   - `isIconOnly` → `iconOnly`
   - `fullWidth` → `fullWidth`
   - `onPress` → `onPressed`
   - `children` → `child` (single) or `children` (list) or specific props like `label`/`leadingIcon`/`trailingIcon`
   - React `startContent`/`endContent` icons → explicit `iconLeft: IconData?` / `iconRight: IconData?`
6. **Port variants to `EnumVariant` enums.** Every React `variant`/`size`/`color` string union becomes a Dart enum; every boolean that changes appearance (not just behaviour) becomes either a widget prop fed into `applyVariants` or a private `_InternalVariants` case.
7. **Translate Tailwind / `tv()` classes into Remix style calls** using tokens — not hex codes. `bg-accent text-accent-foreground` → `.color($accent()).labelColor($accentForeground())`. If you find yourself reaching for a hex literal, the answer is almost always "there's a token for that" — check `hero_tokens.dart`.
8. **Wire group context** if the reference has one (`ButtonGroupContext`, etc.), following the InheritedWidget pattern.
9. **Export from `lib/hero_ui.dart`**.
10. **Run `dart analyze`** on the new files (or tell the user you'd recommend it) to catch lint issues before handing back.

## Things to avoid

- **Don't invent a new file layout.** Exactly two files per component, named `hero_<name>.dart` and `hero_<name>_style.dart`. No `widgets/`, `theme/`, or `variants/` subfolders.
- **Don't use raw colours, text styles, or magic numbers** when a token exists. If a spacing value looks arbitrary, check the React reference for the Tailwind class it came from and see whether a token is the right match.
- **Don't subclass `RemixButton` / `RemixCard` / etc.** Hero components *compose* Remix widgets — they don't extend them.
- **Don't add `Provider`, `GetIt`, `Riverpod`, `ChangeNotifier`, or any state-management dependency.** Group/shared state uses `InheritedWidget`; local state uses `StatefulWidget`. Nothing else.
- **Don't write tests, storybook equivalents, or example apps** unless the user asks. The React `.stories.tsx` is a reference for you, not a file you need to reproduce.
- **Don't skim the React source.** Read the whole `.tsx` file including the variant definitions (often in `@heroui/styles`) so you capture every case. Missing a `dangerSoft` variant because you didn't scroll to the bottom of the stories is a common failure mode.
- **Don't stop at "it compiles".** A port is correct when it compiles *and* covers every variant/size/state the React reference supports. Cross-check against the stories file at the end.

## When to ask the user before proceeding

- The Remix package is missing a primitive you'd need (`RemixDatePicker`, etc.).
- The React reference depends on behaviour that has no obvious Flutter equivalent (e.g. `react-aria-components` focus-scoping that Naked UI doesn't cover).
- A token you'd want doesn't exist in `hero_tokens.dart`.
- The component naturally wants three or more files (e.g. multiple sibling widgets like `HeroButtonGroup` + `HeroButtonGroupSeparator`) — confirm the split before writing code.

In all these cases, stop and surface the question. The user would much rather answer a short question than untangle a bad port.
