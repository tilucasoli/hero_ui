import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:oklch/oklch.dart';

import '../tokens/hero_tokens.dart';

// == Primitive Colors (aligned with HeroUI theme.css neutrals) ==
Color _oklch(double lPercent, double chroma, double hueDeg) =>
    OKLCHColor(lPercent / 100, chroma, hueDeg).toColor();

final kHeroWhite = _oklch(100, 0, 0);
final kHeroBlack = _oklch(0, 0, 0);
final kHeroSnow = _oklch(99.11, 0, 0);
final kHeroEclipse = _oklch(21.03, 0.0059, 253.83);

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
  final Color accentSoft;
  final Color accentSoftForeground;

  // Field
  final Color fieldBackground;
  final Color fieldForeground;
  final Color fieldPlaceholder;
  final Color fieldBorder;

  // Segment (tabs, toggles)
  final Color segment;
  final Color segmentForeground;

  // Success
  final Color success;
  final Color successForeground;

  // Warning
  final Color warning;
  final Color warningForeground;

  // Danger
  final Color danger;
  final Color dangerForeground;

  // Misc
  final Color border;
  final Color separator;

  // Typography
  final String? fontFamily;

  // Title
  final TextStyle titleH1;
  final TextStyle titleH2;
  final TextStyle titleH3;
  final TextStyle titleH4;
  final TextStyle titleH5;
  final TextStyle titleH6;

  // Label
  final TextStyle labelXLarge;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;
  final TextStyle labelXSmall;

  // Paragraph
  final TextStyle paragraphXLarge;
  final TextStyle paragraphLarge;
  final TextStyle paragraphMedium;
  final TextStyle paragraphSmall;
  final TextStyle paragraphXSmall;

  // Subheading
  final TextStyle subheadingMedium;
  final TextStyle subheadingSmall;
  final TextStyle subheadingXSmall;
  final TextStyle subheading2XSmall;

  // Doc
  final TextStyle docLabel;
  final TextStyle docParagraph;

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
    required this.accentSoft,
    required this.accentSoftForeground,
    required this.fieldBackground,
    required this.fieldForeground,
    required this.fieldPlaceholder,
    required this.fieldBorder,
    required this.segment,
    required this.segmentForeground,
    required this.success,
    required this.successForeground,
    required this.warning,
    required this.warningForeground,
    required this.danger,
    required this.dangerForeground,
    required this.border,
    required this.separator,
    this.fontFamily,
    this.titleH1 = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 56,
      height: 64 / 56,
      letterSpacing: -0.56,
    ),
    this.titleH2 = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 48,
      height: 56 / 48,
      letterSpacing: -0.48,
    ),
    this.titleH3 = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 40,
      height: 48 / 40,
      letterSpacing: -0.40,
    ),
    this.titleH4 = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 32,
      height: 40 / 32,
      letterSpacing: -0.16,
    ),
    this.titleH5 = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 24,
      height: 32 / 24,
    ),
    this.titleH6 = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      height: 28 / 20,
    ),
    this.labelXLarge = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 24,
      height: 32 / 24,
      letterSpacing: -0.36,
    ),
    this.labelLarge = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: 24 / 18,
      letterSpacing: -0.27,
    ),
    this.labelMedium = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: -0.176,
    ),
    this.labelSmall = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: -0.084,
    ),
    this.labelXSmall = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 16 / 12,
    ),
    this.paragraphXLarge = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      height: 32 / 24,
      letterSpacing: -0.36,
    ),
    this.paragraphLarge = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      height: 24 / 18,
      letterSpacing: -0.27,
    ),
    this.paragraphMedium = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: -0.176,
    ),
    this.paragraphSmall = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: -0.084,
    ),
    this.paragraphXSmall = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 16 / 12,
    ),
    this.subheadingMedium = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.96,
    ),
    this.subheadingSmall = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.84,
    ),
    this.subheadingXSmall = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0.48,
    ),
    this.subheading2XSmall = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      height: 12 / 11,
      letterSpacing: 0.22,
    ),
    this.docLabel = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: 32 / 18,
      letterSpacing: -0.27,
    ),
    this.docParagraph = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      height: 32 / 18,
      letterSpacing: -0.27,
    ),
  });

  /// Light theme from HeroUI `theme.css` (light / default).
  factory HeroThemeData.light() {
    return HeroThemeData(
      background: _oklch(97.02, 0.0014, 253.83),
      foreground: _oklch(21.03, 0.0014, 253.83),
      surface: _oklch(100, 0.0007, 253.83),
      surfaceForeground: _oklch(21.03, 0.0014, 253.83),
      overlay: _oklch(100, 0.0004, 253.83),
      overlayForeground: _oklch(21.03, 0.0014, 253.83),
      muted: _oklch(55.17, 0.0028, 253.83),
      scrollbar: _oklch(87.10, 0.0014, 253.83),
      defaultColor: _oklch(94, 0.0014, 253.83),
      defaultForeground: _oklch(21.03, 0.0059, 253.83),
      accent: _oklch(62.04, 0.1950, 253.83),
      accentForeground: _oklch(99.11, 0, 0),
      accentSoft: _oklch(95.24, 0.0011, 253.83),
      accentSoftForeground: _oklch(21.03, 0.0014, 253.83),
      fieldBackground: _oklch(100, 0.0007, 253.83),
      fieldForeground: _oklch(21.03, 0.0014, 253.83),
      fieldPlaceholder: _oklch(55.17, 0.0028, 253.83),
      fieldBorder: _oklch(90, 0.0014, 253.83),
      segment: _oklch(100, 0.0014, 253.83),
      segmentForeground: _oklch(21.03, 0.0014, 253.83),
      success: _oklch(73.29, 0.1940, 150.81),
      successForeground: _oklch(21.03, 0.0059, 150.81),
      warning: _oklch(78.19, 0.1589, 72.33),
      warningForeground: _oklch(21.03, 0.0059, 72.33),
      danger: _oklch(65.32, 0.2335, 25.74),
      dangerForeground: _oklch(99.11, 0, 0),
      border: _oklch(90, 0.0014, 253.83),
      separator: _oklch(92, 0.0014, 253.83),
    );
  }

  /// Dark theme from HeroUI `theme.css`.
  factory HeroThemeData.dark() {
    return HeroThemeData(
      background: _oklch(12, 0.0014, 253.83),
      foreground: _oklch(99.11, 0.0014, 253.83),
      surface: _oklch(21.03, 0.0028, 253.83),
      surfaceForeground: _oklch(99.11, 0.0014, 253.83),
      overlay: _oklch(21.03, 0.0028, 253.83),
      overlayForeground: _oklch(99.11, 0.0014, 253.83),
      muted: _oklch(70.50, 0.0028, 253.83),
      scrollbar: _oklch(70.50, 0.0028, 253.83),
      defaultColor: _oklch(27.40, 0.0014, 253.83),
      defaultForeground: _oklch(99.11, 0, 0),
      accent: _oklch(62.04, 0.1950, 253.83),
      accentForeground: _oklch(99.11, 0, 0),
      accentSoft: _oklch(25.70, 0.0021, 253.83),
      accentSoftForeground: _oklch(99.11, 0.0014, 253.83),
      fieldBackground: _oklch(21.03, 0.0028, 253.83),
      fieldForeground: _oklch(99.11, 0.0014, 253.83),
      fieldPlaceholder: _oklch(70.50, 0.0028, 253.83),
      fieldBorder: _oklch(28, 0.0014, 253.83),
      segment: _oklch(39.64, 0.0014, 253.83),
      segmentForeground: _oklch(99.11, 0.0014, 253.83),
      success: _oklch(73.29, 0.1940, 150.81),
      successForeground: _oklch(21.03, 0.0059, 150.81),
      warning: _oklch(82.03, 0.1392, 76.34),
      warningForeground: _oklch(21.03, 0.0059, 76.34),
      danger: _oklch(59.40, 0.1973, 24.63),
      dangerForeground: _oklch(99.11, 0, 0),
      border: _oklch(28, 0.0014, 253.83),
      separator: _oklch(25, 0.0014, 253.83),
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
    final fontFamily = d.fontFamily;

    TextStyle applyFont(TextStyle style) {
      if (fontFamily == null) return style;
      return style.copyWith(fontFamily: fontFamily);
    }

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

        // Segment
        $segment: d.segment,
        $segmentForeground: d.segmentForeground,

        // Success
        $success: d.success,
        $successForeground: d.successForeground,

        // Warning
        $warning: d.warning,
        $warningForeground: d.warningForeground,

        // Danger
        $danger: d.danger,
        $dangerForeground: d.dangerForeground,

        // Misc
        $border: d.border,
        $separator: d.separator,
        $focus: d.accent,
        $link: d.accent,

        // Derived interaction colors
        $accentHover: HeroThemeData._darken(d.accent),
        $defaultHover: HeroThemeData._darken(d.defaultColor),
        $accentSoftForeground: d.accent,
        $dangerHover: HeroThemeData._darken(d.danger),
        $dangerSoft: d.danger.withValues(alpha: 0.1),
        $dangerSoftHover: d.danger.withValues(alpha: 0.15),
        $dangerSoftForeground: d.danger,
      },
      spaces: {$spacing: 4.0},
      doubles: {
        $disabledOpacity: 0.5,
        $borderWidth: 1.0,
        $ringOffsetWidth: 2.0,
      },
      radii: {
        // theme.css: --radius: 0.5rem; --field-radius: 0.75rem (16px root)
        $radius: const Radius.circular(8.0),
        $fieldRadius: const Radius.circular(12.0),
      },
      textStyles: {
        // Title
        $titleH1: applyFont(d.titleH1),
        $titleH2: applyFont(d.titleH2),
        $titleH3: applyFont(d.titleH3),
        $titleH4: applyFont(d.titleH4),
        $titleH5: applyFont(d.titleH5),
        $titleH6: applyFont(d.titleH6),

        // Label
        $labelXLarge: applyFont(d.labelXLarge),
        $labelLarge: applyFont(d.labelLarge),
        $labelMedium: applyFont(d.labelMedium),
        $labelSmall: applyFont(d.labelSmall),
        $labelXSmall: applyFont(d.labelXSmall),

        // Paragraph
        $paragraphXLarge: applyFont(d.paragraphXLarge),
        $paragraphLarge: applyFont(d.paragraphLarge),
        $paragraphMedium: applyFont(d.paragraphMedium),
        $paragraphSmall: applyFont(d.paragraphSmall),
        $paragraphXSmall: applyFont(d.paragraphXSmall),

        // Subheading
        $subheadingMedium: applyFont(d.subheadingMedium),
        $subheadingSmall: applyFont(d.subheadingSmall),
        $subheadingXSmall: applyFont(d.subheadingXSmall),
        $subheading2XSmall: applyFont(d.subheading2XSmall),

        // Doc
        $docLabel: applyFont(d.docLabel),
        $docParagraph: applyFont(d.docParagraph),
      },
      child: child,
    );
  }
}
