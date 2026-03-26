import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../tokens/hero_tokens.dart';

// == Primitive Colors ==
const kHeroWhite = Color(0xFFFFFFFF);
const kHeroBlack = Color(0xFF000000);
const kHeroSnow = Color(0xFFFAFAFA);
const kHeroEclipse = Color(0xFF18181B);

final class HeroThemeData {
  // Base
  final Color background;
  final Color foreground;

  // Surface
  final Color surface;
  final Color surfaceForeground;

  // Overlay
  final Color overlay;
  final Color overlayForeground;

  // Muted
  final Color muted;
  final Color scrollbar;

  // Default
  final Color defaultColor;
  final Color defaultForeground;

  // Accent
  final Color accent;
  final Color accentForeground;

  // Field
  final Color fieldBackground;
  final Color fieldForeground;
  final Color fieldPlaceholder;
  final Color fieldBorder;

  // Success
  final Color success;
  final Color successForeground;

  // Warning
  final Color warning;
  final Color warningForeground;

  // Danger
  final Color danger;
  final Color dangerForeground;

  // Segment
  final Color segment;
  final Color segmentForeground;

  // Misc
  final Color border;
  final Color separator;
  final Color focus;
  final Color link;

  const HeroThemeData({
    required this.background,
    required this.foreground,
    required this.surface,
    required this.surfaceForeground,
    required this.overlay,
    required this.overlayForeground,
    required this.muted,
    required this.scrollbar,
    required this.defaultColor,
    required this.defaultForeground,
    required this.accent,
    required this.accentForeground,
    required this.fieldBackground,
    required this.fieldForeground,
    required this.fieldPlaceholder,
    required this.fieldBorder,
    required this.success,
    required this.successForeground,
    required this.warning,
    required this.warningForeground,
    required this.danger,
    required this.dangerForeground,
    required this.segment,
    required this.segmentForeground,
    required this.border,
    required this.separator,
    required this.focus,
    required this.link,
  });

  /// Light theme matching the HeroUI default CSS theme.
  factory HeroThemeData.light() {
    const accent = Color(0xFF006FEE);

    return HeroThemeData(
      background: const Color(0xFFF4F4F5),
      foreground: kHeroEclipse,
      surface: kHeroWhite,
      surfaceForeground: kHeroEclipse,
      overlay: kHeroWhite,
      overlayForeground: kHeroEclipse,
      muted: const Color(0xFF71717A),
      scrollbar: const Color(0xFFD4D4D8),
      defaultColor: const Color(0xFFE8E8EC),
      defaultForeground: kHeroEclipse,
      accent: accent,
      accentForeground: kHeroSnow,
      fieldBackground: kHeroWhite,
      fieldForeground: kHeroEclipse,
      fieldPlaceholder: const Color(0xFF71717A),
      fieldBorder: Colors.transparent,
      success: const Color(0xFF17C964),
      successForeground: kHeroEclipse,
      warning: const Color(0xFFF5A524),
      warningForeground: kHeroEclipse,
      danger: const Color(0xFFF5312E),
      dangerForeground: kHeroSnow,
      segment: kHeroWhite,
      segmentForeground: kHeroEclipse,
      border: const Color(0xFFE4E4E7),
      separator: const Color(0xFFE4E4E7),
      focus: accent,
      link: kHeroEclipse,
    );
  }

  /// Dark theme matching the HeroUI default CSS dark theme.
  factory HeroThemeData.dark() {
    const accent = Color(0xFF006FEE);

    return HeroThemeData(
      background: const Color(0xFF0D0D11),
      foreground: kHeroSnow,
      surface: kHeroEclipse,
      surfaceForeground: kHeroSnow,
      overlay: const Color(0xFF1C1C21),
      overlayForeground: kHeroSnow,
      muted: const Color(0xFFA1A1AA),
      scrollbar: const Color(0xFFA1A1AA),
      defaultColor: const Color(0xFF27272A),
      defaultForeground: kHeroSnow,
      accent: accent,
      accentForeground: kHeroSnow,
      fieldBackground: const Color(0xFF27272A),
      fieldForeground: kHeroSnow,
      fieldPlaceholder: const Color(0xFFA1A1AA),
      fieldBorder: Colors.transparent,
      success: const Color(0xFF17C964),
      successForeground: kHeroEclipse,
      warning: const Color(0xFFFAB53B),
      warningForeground: kHeroEclipse,
      danger: const Color(0xFFE8433E),
      dangerForeground: kHeroSnow,
      segment: const Color(0xFF3F3F46),
      segmentForeground: kHeroSnow,
      border: const Color(0xFF1F1F24),
      separator: const Color(0xFF1F1F24),
      focus: accent,
      link: kHeroSnow,
    );
  }

  /// Derives a hover color by darkening [color] via HSL lightness.
  static Color _darken(Color color, [double amount = 0.05]) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}

final class HeroTheme extends StatelessWidget {
  final HeroThemeData data;
  final Widget child;

  const HeroTheme({super.key, required this.data, required this.child});

  @override
  Widget build(BuildContext context) {
    final d = data;

    return MixScope(
      colors: {
        // Primitives
        $white: kHeroWhite,
        $black: kHeroBlack,
        $snow: kHeroSnow,
        $eclipse: kHeroEclipse,

        // Base
        $background: d.background,
        $foreground: d.foreground,

        // Surface
        $surface: d.surface,
        $surfaceForeground: d.surfaceForeground,

        // Overlay
        $overlay: d.overlay,
        $overlayForeground: d.overlayForeground,

        // Muted
        $muted: d.muted,
        $scrollbar: d.scrollbar,

        // Default
        $default: d.defaultColor,
        $defaultForeground: d.defaultForeground,

        // Accent
        $accent: d.accent,
        $accentForeground: d.accentForeground,

        // Field
        $fieldBackground: d.fieldBackground,
        $fieldForeground: d.fieldForeground,
        $fieldPlaceholder: d.fieldPlaceholder,
        $fieldBorder: d.fieldBorder,

        // Success
        $success: d.success,
        $successForeground: d.successForeground,

        // Warning
        $warning: d.warning,
        $warningForeground: d.warningForeground,

        // Danger
        $danger: d.danger,
        $dangerForeground: d.dangerForeground,

        // Segment
        $segment: d.segment,
        $segmentForeground: d.segmentForeground,

        // Misc
        $border: d.border,
        $separator: d.separator,
        $focus: d.focus,
        $link: d.link,

        // Derived interaction colors
        $accentHover: HeroThemeData._darken(d.accent),
        $defaultHover: HeroThemeData._darken(d.defaultColor),
        $accentSoftForeground: d.accent,
        $dangerHover: HeroThemeData._darken(d.danger),
        $dangerSoft: d.danger.withValues(alpha: 0.1),
        $dangerSoftHover: d.danger.withValues(alpha: 0.15),
        $dangerSoftForeground: d.danger,
      },
      spaces: {
        $spacing: 4.0,
      },
      doubles: {
        $disabledOpacity: 0.5,
        $borderWidth: 1.0,
        $ringOffsetWidth: 2.0,
      },
      radii: {
        $radius: const Radius.circular(8.0),
        $fieldRadius: const Radius.circular(12.0),
      },
      child: child,
    );
  }
}
