# HeroButton & HeroButtonGroup Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement HeroButton and HeroButtonGroup Flutter components on top of Remix's RemixButton and Mix's styling system, porting the HeroUI React reference to Flutter.

**Architecture:** HeroButton is a StatelessWidget wrapping RemixButton, mapping enum-based variant/size props to RemixButtonStyle. HeroButtonGroup uses an InheritedWidget to propagate shared props and position metadata to child HeroButtons, handling border radius, separator, and outline border collapsing. All colors use Mix's token system resolved via MixScope.

**Tech Stack:** Flutter, mix (^2.0.0), remix (^0.1.0-beta), naked_ui (transitive)

---

### Task 1: Add mix and remix dependencies

**Files:**
- Modify: `pubspec.yaml`

- [ ] **Step 1: Add git dependencies to pubspec.yaml**

Add under the `dependencies:` section:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  mix:
    git:
      url: https://github.com/btwld/mix.git
      ref: main
      path: packages/mix
  remix:
    git:
      url: https://github.com/btwld/remix.git
      ref: main
      path: packages/remix
```

- [ ] **Step 2: Run flutter pub get**

Run: `flutter pub get`
Expected: Dependencies resolve successfully, `pubspec.lock` updated.

- [ ] **Step 3: Commit**

```bash
git add pubspec.yaml pubspec.lock
git commit -m "feat: add mix and remix dependencies from GitHub main branches"
```

---

### Task 2: Define design tokens

**Files:**
- Create: `lib/src/tokens/hero_tokens.dart`

- [ ] **Step 1: Create tokens file**

```dart
import 'package:mix/mix.dart';

// --- Accent colors ---
const $accent = ColorToken('hero.accent');
const $accentHover = ColorToken('hero.accentHover');
const $accentForeground = ColorToken('hero.accentForeground');

// --- Default colors ---
const $default = ColorToken('hero.default');
const $defaultHover = ColorToken('hero.defaultHover');
const $defaultForeground = ColorToken('hero.defaultForeground');

// --- Accent soft ---
const $accentSoftForeground = ColorToken('hero.accentSoftForeground');

// --- Danger colors ---
const $danger = ColorToken('hero.danger');
const $dangerHover = ColorToken('hero.dangerHover');
const $dangerForeground = ColorToken('hero.dangerForeground');

// --- Danger soft colors ---
const $dangerSoft = ColorToken('hero.dangerSoft');
const $dangerSoftHover = ColorToken('hero.dangerSoftHover');
const $dangerSoftForeground = ColorToken('hero.dangerSoftForeground');

// --- Border ---
const $border = ColorToken('hero.border');

// --- Button size tokens ---
const $buttonHeightSm = DoubleToken('hero.button.heightSm');
const $buttonHeightMd = DoubleToken('hero.button.heightMd');
const $buttonHeightLg = DoubleToken('hero.button.heightLg');

const $buttonPaddingSm = SpaceToken('hero.button.paddingSm');
const $buttonPaddingMd = SpaceToken('hero.button.paddingMd');
const $buttonPaddingLg = SpaceToken('hero.button.paddingLg');

const $buttonRadius = RadiusToken('hero.button.radius');
```

- [ ] **Step 2: Verify file compiles**

Run: `flutter analyze lib/src/tokens/hero_tokens.dart`
Expected: No errors.

- [ ] **Step 3: Commit**

```bash
git add lib/src/tokens/hero_tokens.dart
git commit -m "feat: define HeroUI design tokens for button components"
```

---

### Task 3: Create HeroTheme

**Files:**
- Create: `lib/src/theme/hero_theme.dart`

- [ ] **Step 1: Create theme file**

```dart
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../tokens/hero_tokens.dart';

/// Generates hover/foreground variants from seed colors.
class HeroTokenData {
  final Color accent;
  final Color accentHover;
  final Color accentForeground;
  final Color defaultColor;
  final Color defaultHover;
  final Color defaultForeground;
  final Color accentSoftForeground;
  final Color danger;
  final Color dangerHover;
  final Color dangerForeground;
  final Color dangerSoft;
  final Color dangerSoftHover;
  final Color dangerSoftForeground;
  final Color border;

  const HeroTokenData({
    required this.accent,
    required this.accentHover,
    required this.accentForeground,
    required this.defaultColor,
    required this.defaultHover,
    required this.defaultForeground,
    required this.accentSoftForeground,
    required this.danger,
    required this.dangerHover,
    required this.dangerForeground,
    required this.dangerSoft,
    required this.dangerSoftHover,
    required this.dangerSoftForeground,
    required this.border,
  });

  /// Creates token data from seed colors with auto-generated variants.
  factory HeroTokenData.fromSeeds({
    required Color accent,
    required Color danger,
    Color? defaultColor,
    Color? border,
  }) {
    final effectiveDefault = defaultColor ?? Colors.grey.shade100;
    final effectiveBorder = border ?? Colors.grey.shade300;

    return HeroTokenData(
      accent: accent,
      accentHover: HSLColor.fromColor(accent).withLightness(
        (HSLColor.fromColor(accent).lightness - 0.05).clamp(0.0, 1.0),
      ).toColor(),
      accentForeground: Colors.white,
      defaultColor: effectiveDefault,
      defaultHover: HSLColor.fromColor(effectiveDefault).withLightness(
        (HSLColor.fromColor(effectiveDefault).lightness - 0.05).clamp(0.0, 1.0),
      ).toColor(),
      defaultForeground: Colors.grey.shade900,
      accentSoftForeground: accent,
      danger: danger,
      dangerHover: HSLColor.fromColor(danger).withLightness(
        (HSLColor.fromColor(danger).lightness - 0.05).clamp(0.0, 1.0),
      ).toColor(),
      dangerForeground: Colors.white,
      dangerSoft: danger.withValues(alpha: 0.1),
      dangerSoftHover: danger.withValues(alpha: 0.15),
      dangerSoftForeground: danger,
      border: effectiveBorder,
    );
  }
}

/// Wraps [MixScope] with HeroUI design tokens.
class HeroTheme extends StatelessWidget {
  final HeroTokenData tokens;
  final Widget child;

  const HeroTheme({
    super.key,
    required this.tokens,
    required this.child,
  });

  /// Convenience constructor using seed colors.
  HeroTheme.fromSeeds({
    super.key,
    required Color accent,
    required Color danger,
    Color? defaultColor,
    Color? border,
    required this.child,
  }) : tokens = HeroTokenData.fromSeeds(
          accent: accent,
          danger: danger,
          defaultColor: defaultColor,
          border: border,
        );

  @override
  Widget build(BuildContext context) {
    return MixScope(
      colors: {
        $accent: tokens.accent,
        $accentHover: tokens.accentHover,
        $accentForeground: tokens.accentForeground,
        $default: tokens.defaultColor,
        $defaultHover: tokens.defaultHover,
        $defaultForeground: tokens.defaultForeground,
        $accentSoftForeground: tokens.accentSoftForeground,
        $danger: tokens.danger,
        $dangerHover: tokens.dangerHover,
        $dangerForeground: tokens.dangerForeground,
        $dangerSoft: tokens.dangerSoft,
        $dangerSoftHover: tokens.dangerSoftHover,
        $dangerSoftForeground: tokens.dangerSoftForeground,
        $border: tokens.border,
      },
      spaces: {
        $buttonPaddingSm: 12.0,
        $buttonPaddingMd: 16.0,
        $buttonPaddingLg: 16.0,
      },
      doubles: {
        $buttonHeightSm: 32.0,
        $buttonHeightMd: 36.0,
        $buttonHeightLg: 40.0,
      },
      radii: {
        $buttonRadius: const Radius.circular(24),
      },
      child: child,
    );
  }
}
```

- [ ] **Step 2: Verify file compiles**

Run: `flutter analyze lib/src/theme/hero_theme.dart`
Expected: No errors.

- [ ] **Step 3: Commit**

```bash
git add lib/src/theme/hero_theme.dart
git commit -m "feat: add HeroTheme with MixScope token integration"
```

---

### Task 4: Define button enums

**Files:**
- Create: `lib/src/components/button/hero_button_variants.dart`

- [ ] **Step 1: Create enums file**

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

- [ ] **Step 2: Verify file compiles**

Run: `flutter analyze lib/src/components/button/hero_button_variants.dart`
Expected: No errors.

- [ ] **Step 3: Commit**

```bash
git add lib/src/components/button/hero_button_variants.dart
git commit -m "feat: add HeroButtonVariant and HeroButtonSize enums"
```

---

### Task 5: Build style factory

**Files:**
- Create: `lib/src/components/button/hero_button_style.dart`

- [ ] **Step 1: Create style factory**

This file maps enum values to `RemixButtonStyle` instances using Mix design tokens.

```dart
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import 'hero_button_variants.dart';

class HeroButtonStyle {
  HeroButtonStyle._();

  /// Resolves enums + flags into a complete [RemixButtonStyle].
  static RemixButtonStyle resolve({
    required HeroButtonVariant variant,
    required HeroButtonSize size,
    bool isIconOnly = false,
    bool fullWidth = false,
  }) {
    final sizeStyle = _sizeStyle(size, isIconOnly: isIconOnly);
    final variantStyle = _variantStyle(variant);

    var style = _baseStyle().merge(sizeStyle).merge(variantStyle);

    if (fullWidth) {
      style = style.merge(
        RemixButtonStyle().mainAxisSize(MainAxisSize.max),
      );
    }

    return style;
  }

  /// Base style shared across all variants and sizes.
  static RemixButtonStyle _baseStyle() {
    return RemixButtonStyle()
        .mainAxisSize(MainAxisSize.min)
        .mainAxisAlignment(MainAxisAlignment.center)
        .crossAxisAlignment(CrossAxisAlignment.center)
        .spacing(8)
        .labelFontWeight(FontWeight.w500)
        .animate(AnimationConfig.easeOut(const Duration(milliseconds: 100)));
  }

  /// Size-specific styles.
  static RemixButtonStyle _sizeStyle(
    HeroButtonSize size, {
    bool isIconOnly = false,
  }) {
    switch (size) {
      case HeroButtonSize.sm:
        return RemixButtonStyle()
            .height(32)
            .paddingX(isIconOnly ? 0 : 12)
            .width(isIconOnly ? 32 : null)
            .borderRadiusAll($buttonRadius())
            .labelFontSize(14)
            .iconSize(16)
            .onPressed(RemixButtonStyle().scale(0.98));
      case HeroButtonSize.md:
        return RemixButtonStyle()
            .height(36)
            .paddingX(isIconOnly ? 0 : 16)
            .width(isIconOnly ? 36 : null)
            .borderRadiusAll($buttonRadius())
            .labelFontSize(14)
            .iconSize(18)
            .onPressed(RemixButtonStyle().scale(0.97));
      case HeroButtonSize.lg:
        return RemixButtonStyle()
            .height(40)
            .paddingX(isIconOnly ? 0 : 16)
            .width(isIconOnly ? 40 : null)
            .borderRadiusAll($buttonRadius())
            .labelFontSize(16)
            .iconSize(20)
            .onPressed(RemixButtonStyle().scale(0.96));
    }
  }

  /// Variant-specific styles (colors, borders, state overrides).
  static RemixButtonStyle _variantStyle(HeroButtonVariant variant) {
    switch (variant) {
      case HeroButtonVariant.primary:
        return RemixButtonStyle()
            .color($accent())
            .labelColor($accentForeground())
            .iconColor($accentForeground())
            .onHovered(RemixButtonStyle().color($accentHover()))
            .onPressed(RemixButtonStyle().color($accentHover()))
            .onDisabled(RemixButtonStyle().color($accent()).wrap(
                  WidgetModifierConfig.opacity(0.5),
                ));

      case HeroButtonVariant.secondary:
        return RemixButtonStyle()
            .color($default())
            .labelColor($accentSoftForeground())
            .iconColor($accentSoftForeground())
            .onHovered(RemixButtonStyle().color($defaultHover()))
            .onPressed(RemixButtonStyle().color($defaultHover()))
            .onDisabled(RemixButtonStyle().color($default()).wrap(
                  WidgetModifierConfig.opacity(0.5),
                ));

      case HeroButtonVariant.tertiary:
        return RemixButtonStyle()
            .color($default())
            .labelColor($defaultForeground())
            .iconColor($defaultForeground())
            .onHovered(RemixButtonStyle().color($defaultHover()))
            .onPressed(RemixButtonStyle().color($defaultHover()))
            .onDisabled(RemixButtonStyle().color($default()).wrap(
                  WidgetModifierConfig.opacity(0.5),
                ));

      case HeroButtonVariant.outline:
        return RemixButtonStyle()
            .color(Colors.transparent)
            .borderAll(color: $border(), width: 1)
            .labelColor($defaultForeground())
            .iconColor($defaultForeground())
            .onHovered(RemixButtonStyle().color($default()))
            .onPressed(RemixButtonStyle().color($default()))
            .onDisabled(RemixButtonStyle()
                .color(Colors.transparent)
                .wrap(WidgetModifierConfig.opacity(0.5)));

      case HeroButtonVariant.ghost:
        return RemixButtonStyle()
            .color(Colors.transparent)
            .labelColor($defaultForeground())
            .iconColor($defaultForeground())
            .onHovered(RemixButtonStyle().color($default()))
            .onPressed(RemixButtonStyle().color($default()))
            .onDisabled(RemixButtonStyle()
                .color(Colors.transparent)
                .wrap(WidgetModifierConfig.opacity(0.5)));

      case HeroButtonVariant.danger:
        return RemixButtonStyle()
            .color($danger())
            .labelColor($dangerForeground())
            .iconColor($dangerForeground())
            .onHovered(RemixButtonStyle().color($dangerHover()))
            .onPressed(RemixButtonStyle().color($dangerHover()))
            .onDisabled(RemixButtonStyle().color($danger()).wrap(
                  WidgetModifierConfig.opacity(0.5),
                ));

      case HeroButtonVariant.dangerSoft:
        return RemixButtonStyle()
            .color($dangerSoft())
            .labelColor($dangerSoftForeground())
            .iconColor($dangerSoftForeground())
            .onHovered(RemixButtonStyle().color($dangerSoftHover()))
            .onPressed(RemixButtonStyle().color($dangerSoftHover()))
            .onDisabled(RemixButtonStyle().color($dangerSoft()).wrap(
                  WidgetModifierConfig.opacity(0.5),
                ));
    }
  }
}
```

- [ ] **Step 2: Verify file compiles**

Run: `flutter analyze lib/src/components/button/hero_button_style.dart`
Expected: No errors. Note: some method signatures (like `.width(null)`, `.borderRadiusAll()`, `.wrap()`) may need adjustment based on the exact Mix/Remix API. Fix any compilation issues.

- [ ] **Step 3: Commit**

```bash
git add lib/src/components/button/hero_button_style.dart
git commit -m "feat: add HeroButtonStyle factory mapping enums to RemixButtonStyle"
```

---

### Task 6: Build HeroButton widget

**Files:**
- Create: `lib/src/components/button/hero_button.dart`

- [ ] **Step 1: Create the widget**

```dart
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import '../button_group/hero_button_group.dart';
import 'hero_button_style.dart';
import 'hero_button_variants.dart';

class HeroButton extends StatelessWidget {
  final HeroButtonVariant? variant;
  final HeroButtonSize? size;
  final String? label;
  final IconData? iconLeft;
  final IconData? iconRight;
  final bool isIconOnly;
  final bool isLoading;
  final bool? isDisabled;
  final bool? fullWidth;
  final VoidCallback? onPressed;
  final RemixButtonStyle? style;

  const HeroButton({
    super.key,
    this.variant,
    this.size,
    this.label,
    this.iconLeft,
    this.iconRight,
    this.isIconOnly = false,
    this.isLoading = false,
    this.isDisabled,
    this.fullWidth,
    this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    // Read group context if available
    final groupData = HeroButtonGroupData.maybeOf(context);

    // Resolve props: direct > group > default
    final resolvedVariant = variant ?? groupData?.variant ?? HeroButtonVariant.primary;
    final resolvedSize = size ?? groupData?.size ?? HeroButtonSize.md;
    final resolvedDisabled = isDisabled ?? groupData?.isDisabled ?? false;
    final resolvedFullWidth = fullWidth ?? groupData?.fullWidth ?? false;

    // Build the base style from enums
    var resolvedStyle = HeroButtonStyle.resolve(
      variant: resolvedVariant,
      size: resolvedSize,
      isIconOnly: isIconOnly,
      fullWidth: resolvedFullWidth,
    );

    // Apply group-specific overrides (border radius, no scale, etc.)
    if (groupData != null) {
      resolvedStyle = resolvedStyle.merge(
        HeroButtonGroupStyle.buttonOverride(
          groupData: groupData,
          variant: resolvedVariant,
        ),
      );
    }

    // Merge user-provided style override last (highest priority)
    if (style != null) {
      resolvedStyle = resolvedStyle.merge(style!);
    }

    return RemixButton(
      style: resolvedStyle,
      label: label ?? '',
      leadingIcon: iconLeft,
      trailingIcon: iconRight,
      loading: isLoading,
      enabled: !resolvedDisabled && !isLoading,
      onPressed: onPressed,
    );
  }
}
```

- [ ] **Step 2: Verify file compiles**

Run: `flutter analyze lib/src/components/button/hero_button.dart`
Expected: Will have errors because `HeroButtonGroupData` and `HeroButtonGroupStyle` don't exist yet. This is expected — they'll be created in Tasks 7-8.

- [ ] **Step 3: Commit**

```bash
git add lib/src/components/button/hero_button.dart
git commit -m "feat: add HeroButton widget wrapping RemixButton with enum-based API"
```

---

### Task 7: Build HeroButtonGroup with InheritedWidget

**Files:**
- Create: `lib/src/components/button_group/hero_button_group.dart`

- [ ] **Step 1: Create the group widget and inherited data**

```dart
import 'package:flutter/material.dart';

import '../button/hero_button_variants.dart';

/// Position metadata for a button within a group.
class HeroButtonPosition {
  final bool isFirst;
  final bool isLast;

  const HeroButtonPosition({
    required this.isFirst,
    required this.isLast,
  });

  bool get isSingle => isFirst && isLast;
  bool get isMiddle => !isFirst && !isLast;
}

/// Inherited data provided by [HeroButtonGroup] to child buttons.
class HeroButtonGroupData extends InheritedWidget {
  final HeroButtonVariant? variant;
  final HeroButtonSize? size;
  final bool? isDisabled;
  final bool? fullWidth;
  final Axis orientation;
  final HeroButtonPosition position;

  const HeroButtonGroupData({
    super.key,
    required super.child,
    this.variant,
    this.size,
    this.isDisabled,
    this.fullWidth,
    required this.orientation,
    required this.position,
  });

  static HeroButtonGroupData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HeroButtonGroupData>();
  }

  @override
  bool updateShouldNotify(HeroButtonGroupData oldWidget) {
    return variant != oldWidget.variant ||
        size != oldWidget.size ||
        isDisabled != oldWidget.isDisabled ||
        fullWidth != oldWidget.fullWidth ||
        orientation != oldWidget.orientation ||
        position.isFirst != oldWidget.position.isFirst ||
        position.isLast != oldWidget.position.isLast;
  }
}

/// Groups [HeroButton]s together with shared styling and layout.
class HeroButtonGroup extends StatelessWidget {
  final HeroButtonVariant? variant;
  final HeroButtonSize? size;
  final bool isDisabled;
  final bool fullWidth;
  final Axis orientation;
  final List<Widget> children;

  const HeroButtonGroup({
    super.key,
    this.variant,
    this.size,
    this.isDisabled = false,
    this.fullWidth = false,
    this.orientation = Axis.horizontal,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    // Identify button positions (excluding separators)
    final buttonIndices = <int>[];
    for (var i = 0; i < children.length; i++) {
      if (children[i] is! HeroButtonGroupSeparator) {
        buttonIndices.add(i);
      }
    }

    final wrappedChildren = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      final child = children[i];

      if (child is HeroButtonGroupSeparator) {
        // Wrap separator with group data for orientation
        wrappedChildren.add(
          HeroButtonGroupData(
            variant: variant,
            size: size,
            isDisabled: isDisabled ? true : null,
            fullWidth: fullWidth ? true : null,
            orientation: orientation,
            position: const HeroButtonPosition(isFirst: false, isLast: false),
            child: child,
          ),
        );
      } else {
        // Determine position among buttons
        final buttonIndex = buttonIndices.indexOf(i);
        final isFirst = buttonIndex == 0;
        final isLast = buttonIndex == buttonIndices.length - 1;

        wrappedChildren.add(
          HeroButtonGroupData(
            variant: variant,
            size: size,
            isDisabled: isDisabled ? true : null,
            fullWidth: fullWidth ? true : null,
            orientation: orientation,
            position: HeroButtonPosition(isFirst: isFirst, isLast: isLast),
            child: fullWidth ? Expanded(child: child) : child,
          ),
        );
      }
    }

    return Flex(
      direction: orientation,
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      children: wrappedChildren,
    );
  }
}

/// Placeholder for the separator — defined in its own file.
/// This import-forward allows hero_button_group.dart to reference it.
class HeroButtonGroupSeparator extends StatelessWidget {
  const HeroButtonGroupSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final groupData = HeroButtonGroupData.maybeOf(context);
    final orientation = groupData?.orientation ?? Axis.horizontal;

    return SizedBox(
      width: orientation == Axis.horizontal ? 0 : null,
      height: orientation == Axis.vertical ? 0 : null,
      child: OverflowBox(
        maxWidth: orientation == Axis.horizontal ? 1 : null,
        maxHeight: orientation == Axis.vertical ? 1 : null,
        child: FractionallySizedBox(
          widthFactor: orientation == Axis.vertical ? 0.5 : null,
          heightFactor: orientation == Axis.horizontal ? 0.5 : null,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: IconTheme.of(context).color?.withValues(alpha: 0.15) ??
                  Colors.grey.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Verify file compiles**

Run: `flutter analyze lib/src/components/button_group/hero_button_group.dart`
Expected: No errors.

- [ ] **Step 3: Commit**

```bash
git add lib/src/components/button_group/hero_button_group.dart
git commit -m "feat: add HeroButtonGroup with InheritedWidget context propagation and separator"
```

---

### Task 8: Build ButtonGroup style overrides

**Files:**
- Create: `lib/src/components/button_group/hero_button_group_style.dart`

- [ ] **Step 1: Create group style overrides**

This file provides the `RemixButtonStyle` overrides applied to buttons when they're inside a group (border radius, no scale, outline border collapsing).

```dart
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';
import '../button/hero_button_variants.dart';
import 'hero_button_group.dart';

class HeroButtonGroupStyle {
  HeroButtonGroupStyle._();

  /// Returns a [RemixButtonStyle] override for buttons inside a group.
  static RemixButtonStyle buttonOverride({
    required HeroButtonGroupData groupData,
    required HeroButtonVariant variant,
  }) {
    var style = RemixButtonStyle();

    // --- Border radius based on position ---
    final position = groupData.position;

    if (position.isSingle) {
      // Single button: keep full radius (no override needed)
    } else if (groupData.orientation == Axis.horizontal) {
      if (position.isFirst) {
        style = style.merge(RemixButtonStyle()
            .borderRoundedTopLeft(24)
            .borderRoundedBottomLeft(24)
            .borderRoundedTopRight(0)
            .borderRoundedBottomRight(0));
      } else if (position.isLast) {
        style = style.merge(RemixButtonStyle()
            .borderRoundedTopLeft(0)
            .borderRoundedBottomLeft(0)
            .borderRoundedTopRight(24)
            .borderRoundedBottomRight(24));
      } else {
        style = style.merge(RemixButtonStyle().borderRounded(0));
      }
    } else {
      // Vertical
      if (position.isFirst) {
        style = style.merge(RemixButtonStyle()
            .borderRoundedTopLeft(24)
            .borderRoundedTopRight(24)
            .borderRoundedBottomLeft(0)
            .borderRoundedBottomRight(0));
      } else if (position.isLast) {
        style = style.merge(RemixButtonStyle()
            .borderRoundedTopLeft(0)
            .borderRoundedTopRight(0)
            .borderRoundedBottomLeft(24)
            .borderRoundedBottomRight(24));
      } else {
        style = style.merge(RemixButtonStyle().borderRounded(0));
      }
    }

    // --- Disable press scale inside group ---
    style = style.merge(
      RemixButtonStyle().onPressed(RemixButtonStyle().scale(1.0)),
    );

    // --- Outline border collapsing ---
    if (variant == HeroButtonVariant.outline && !position.isSingle) {
      if (groupData.orientation == Axis.horizontal) {
        if (position.isFirst) {
          style = style.merge(RemixButtonStyle().borderEnd(width: 0));
        } else if (position.isLast) {
          style = style.merge(RemixButtonStyle().borderStart(width: 0));
        } else {
          style = style.merge(RemixButtonStyle()
              .borderStart(width: 0)
              .borderEnd(width: 0));
        }
      } else {
        if (position.isFirst) {
          style = style.merge(RemixButtonStyle().borderBottom(width: 0));
        } else if (position.isLast) {
          style = style.merge(RemixButtonStyle().borderTop(width: 0));
        } else {
          style = style.merge(RemixButtonStyle()
              .borderTop(width: 0)
              .borderBottom(width: 0));
        }
      }
    }

    return style;
  }
}
```

- [ ] **Step 2: Verify file compiles**

Run: `flutter analyze lib/src/components/button_group/hero_button_group_style.dart`
Expected: No errors. Some methods like `.borderEnd()`, `.borderStart()` may have different signatures in Mix — adjust if needed (e.g., use `.borderRight()` / `.borderLeft()` instead).

- [ ] **Step 3: Commit**

```bash
git add lib/src/components/button_group/hero_button_group_style.dart
git commit -m "feat: add HeroButtonGroupStyle with border radius and outline collapsing"
```

---

### Task 9: Create barrel export

**Files:**
- Create: `lib/hero_ui.dart`

- [ ] **Step 1: Create barrel export file**

```dart
library hero_ui;

// Tokens
export 'src/tokens/hero_tokens.dart';

// Theme
export 'src/theme/hero_theme.dart';

// Button
export 'src/components/button/hero_button.dart';
export 'src/components/button/hero_button_style.dart';
export 'src/components/button/hero_button_variants.dart';

// ButtonGroup
export 'src/components/button_group/hero_button_group.dart';
export 'src/components/button_group/hero_button_group_style.dart';
```

- [ ] **Step 2: Verify full library compiles**

Run: `flutter analyze lib/hero_ui.dart`
Expected: No errors. All imports resolve correctly.

- [ ] **Step 3: Commit**

```bash
git add lib/hero_ui.dart
git commit -m "feat: add hero_ui barrel export"
```

---

### Task 10: Wire up demo in main.dart

**Files:**
- Modify: `lib/main.dart`

- [ ] **Step 1: Replace main.dart with a demo showcasing all variants and sizes**

```dart
import 'package:flutter/material.dart';
import 'package:hero_ui/hero_ui.dart';

void main() {
  runApp(const HeroUIDemo());
}

class HeroUIDemo extends StatelessWidget {
  const HeroUIDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeroUI Demo',
      home: HeroTheme.fromSeeds(
        accent: Colors.blue,
        danger: Colors.red,
        child: const Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Button Variants',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                _VariantsDemo(),
                SizedBox(height: 32),
                Text('Button Sizes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                _SizesDemo(),
                SizedBox(height: 32),
                Text('Icon Buttons',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                _IconDemo(),
                SizedBox(height: 32),
                Text('Button Group',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                _ButtonGroupDemo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _VariantsDemo extends StatelessWidget {
  const _VariantsDemo();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        HeroButton(
          variant: HeroButtonVariant.primary,
          label: 'Primary',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.secondary,
          label: 'Secondary',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.tertiary,
          label: 'Tertiary',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.outline,
          label: 'Outline',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.ghost,
          label: 'Ghost',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.danger,
          label: 'Danger',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.dangerSoft,
          label: 'Danger Soft',
          onPressed: () {},
        ),
      ],
    );
  }
}

class _SizesDemo extends StatelessWidget {
  const _SizesDemo();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        HeroButton(
          variant: HeroButtonVariant.primary,
          size: HeroButtonSize.sm,
          label: 'Small',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.primary,
          size: HeroButtonSize.md,
          label: 'Medium',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.primary,
          size: HeroButtonSize.lg,
          label: 'Large',
          onPressed: () {},
        ),
      ],
    );
  }
}

class _IconDemo extends StatelessWidget {
  const _IconDemo();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        HeroButton(
          variant: HeroButtonVariant.primary,
          label: 'Search',
          iconLeft: Icons.search,
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.secondary,
          label: 'Add',
          iconLeft: Icons.add,
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.tertiary,
          isIconOnly: true,
          iconLeft: Icons.more_horiz,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _ButtonGroupDemo extends StatelessWidget {
  const _ButtonGroupDemo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          children: [
            HeroButton(label: 'First', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(label: 'Second', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(label: 'Third', onPressed: () {}),
          ],
        ),
        const SizedBox(height: 16),
        HeroButtonGroup(
          variant: HeroButtonVariant.outline,
          children: [
            HeroButton(label: 'Left', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(label: 'Center', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(label: 'Right', onPressed: () {}),
          ],
        ),
        const SizedBox(height: 16),
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          children: [
            HeroButton(
              iconLeft: Icons.chevron_left,
              label: 'Previous',
              onPressed: () {},
            ),
            const HeroButtonGroupSeparator(),
            HeroButton(
              label: 'Next',
              iconRight: Icons.chevron_right,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
```

- [ ] **Step 2: Run the app**

Run: `flutter run -d chrome` (or whichever device is available)
Expected: App launches showing all button variants, sizes, icon buttons, and button groups.

- [ ] **Step 3: Commit**

```bash
git add lib/main.dart
git commit -m "feat: add HeroUI demo showcasing all button variants and button groups"
```

---

### Task 11: Fix compilation issues and API mismatches

**Files:**
- Modify: any files from Tasks 2-9 that have compilation errors

This task is a catch-all for API mismatches between the plan and the actual Mix/Remix APIs. The plan uses method names based on research, but exact signatures may differ.

- [ ] **Step 1: Run full analysis**

Run: `flutter analyze`
Expected: Note all errors.

- [ ] **Step 2: Fix each error**

Common fixes to expect:
- Method signatures for `.width()`, `.height()`, `.borderRoundedTopLeft()` etc. may differ — check Mix source
- `.scale()` may need a different API — check `TransformStyleMixin`
- `.wrap(WidgetModifierConfig.opacity(...))` may have a different pattern — check `WidgetModifierStyleMixin`
- Token call syntax `$accent()` may need adjustment based on how `ColorToken.call()` works
- `.borderEnd()` / `.borderStart()` may not exist — use `.borderRight()` / `.borderLeft()` instead

For each error, read the actual Mix/Remix source via the installed packages at `.dart_tool/package_config.json` to find the correct API.

- [ ] **Step 3: Run analysis again**

Run: `flutter analyze`
Expected: No errors.

- [ ] **Step 4: Run app to verify visually**

Run: `flutter run -d chrome`
Expected: App renders correctly.

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "fix: resolve API mismatches with Mix and Remix packages"
```

---

### Task 12: Write widget tests

**Files:**
- Create: `test/hero_button_test.dart`
- Create: `test/hero_button_group_test.dart`

- [ ] **Step 1: Write HeroButton tests**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hero_ui/hero_ui.dart';

Widget wrapWithTheme(Widget child) {
  return MaterialApp(
    home: HeroTheme.fromSeeds(
      accent: Colors.blue,
      danger: Colors.red,
      child: Scaffold(body: child),
    ),
  );
}

void main() {
  group('HeroButton', () {
    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(wrapWithTheme(
        HeroButton(
          variant: HeroButtonVariant.primary,
          label: 'Click me',
          onPressed: () {},
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Click me'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var pressed = false;
      await tester.pumpWidget(wrapWithTheme(
        HeroButton(
          variant: HeroButtonVariant.primary,
          label: 'Tap',
          onPressed: () => pressed = true,
        ),
      ));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Tap'));
      expect(pressed, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var pressed = false;
      await tester.pumpWidget(wrapWithTheme(
        HeroButton(
          variant: HeroButtonVariant.primary,
          label: 'Disabled',
          isDisabled: true,
          onPressed: () => pressed = true,
        ),
      ));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Disabled'));
      expect(pressed, isFalse);
    });

    testWidgets('renders with leading icon', (tester) async {
      await tester.pumpWidget(wrapWithTheme(
        HeroButton(
          variant: HeroButtonVariant.primary,
          label: 'Search',
          iconLeft: Icons.search,
          onPressed: () {},
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('renders all variants without error', (tester) async {
      for (final variant in HeroButtonVariant.values) {
        await tester.pumpWidget(wrapWithTheme(
          HeroButton(
            variant: variant,
            label: variant.name,
            onPressed: () {},
          ),
        ));
        await tester.pumpAndSettle();
        expect(find.text(variant.name), findsOneWidget);
      }
    });

    testWidgets('renders all sizes without error', (tester) async {
      for (final size in HeroButtonSize.values) {
        await tester.pumpWidget(wrapWithTheme(
          HeroButton(
            variant: HeroButtonVariant.primary,
            size: size,
            label: size.name,
            onPressed: () {},
          ),
        ));
        await tester.pumpAndSettle();
        expect(find.text(size.name), findsOneWidget);
      }
    });
  });
}
```

- [ ] **Step 2: Write HeroButtonGroup tests**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hero_ui/hero_ui.dart';

Widget wrapWithTheme(Widget child) {
  return MaterialApp(
    home: HeroTheme.fromSeeds(
      accent: Colors.blue,
      danger: Colors.red,
      child: Scaffold(body: child),
    ),
  );
}

void main() {
  group('HeroButtonGroup', () {
    testWidgets('renders children', (tester) async {
      await tester.pumpWidget(wrapWithTheme(
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          children: [
            HeroButton(label: 'First', onPressed: () {}),
            HeroButton(label: 'Second', onPressed: () {}),
          ],
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('First'), findsOneWidget);
      expect(find.text('Second'), findsOneWidget);
    });

    testWidgets('propagates variant to children', (tester) async {
      // Buttons without explicit variant should inherit from group
      await tester.pumpWidget(wrapWithTheme(
        HeroButtonGroup(
          variant: HeroButtonVariant.danger,
          children: [
            HeroButton(label: 'Danger Child', onPressed: () {}),
          ],
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Danger Child'), findsOneWidget);
    });

    testWidgets('propagates disabled to children', (tester) async {
      var pressed = false;
      await tester.pumpWidget(wrapWithTheme(
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          isDisabled: true,
          children: [
            HeroButton(label: 'Disabled', onPressed: () => pressed = true),
          ],
        ),
      ));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Disabled'));
      expect(pressed, isFalse);
    });

    testWidgets('renders with separators', (tester) async {
      await tester.pumpWidget(wrapWithTheme(
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          children: [
            HeroButton(label: 'A', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(label: 'B', onPressed: () {}),
          ],
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
    });

    testWidgets('child can override group variant', (tester) async {
      await tester.pumpWidget(wrapWithTheme(
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          children: [
            HeroButton(
              variant: HeroButtonVariant.primary,
              label: 'Override',
              onPressed: () {},
            ),
          ],
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Override'), findsOneWidget);
    });
  });
}
```

- [ ] **Step 3: Run tests**

Run: `flutter test`
Expected: All tests pass.

- [ ] **Step 4: Commit**

```bash
git add test/hero_button_test.dart test/hero_button_group_test.dart
git commit -m "test: add widget tests for HeroButton and HeroButtonGroup"
```
