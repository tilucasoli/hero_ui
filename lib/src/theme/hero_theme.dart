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
final kHeroEclipse = _oklch(21.03, 0.0059, 285.89);

final class HeroThemeData {
  // Base
  final Color background;
  final Color foreground;

  // Surface
  final Color surface;
  final Color surfaceForeground;
  final Color surfaceSecondary;
  final Color surfaceSecondaryForeground;
  final Color surfaceTertiary;
  final Color surfaceTertiaryForeground;

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
  final Color backdrop;

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
    required this.surfaceSecondary,
    required this.surfaceSecondaryForeground,
    required this.surfaceTertiary,
    required this.surfaceTertiaryForeground,
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
    required this.backdrop,
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
    final accentColor = _oklch(62.04, 0.195, 253.83);
    return HeroThemeData(
      background: _oklch(97.02, 0, 0),
      foreground: kHeroEclipse,
      surface: kHeroWhite,
      surfaceForeground: kHeroEclipse,
      surfaceSecondary: _oklch(95.24, 0.0013, 286.37),
      surfaceSecondaryForeground: kHeroEclipse,
      surfaceTertiary: _oklch(93.73, 0.0013, 286.37),
      surfaceTertiaryForeground: kHeroEclipse,
      overlay: kHeroWhite,
      overlayForeground: kHeroEclipse,
      muted: _oklch(55.17, 0.0138, 285.94),
      scrollbar: _oklch(87.10, 0.006, 286.29),
      defaultColor: _oklch(94, 0.001, 286.375),
      defaultForeground: kHeroEclipse,
      accent: accentColor,
      accentForeground: kHeroSnow,
      accentSoft: _oklch(95.24, 0.0013, 286.37),
      accentSoftForeground: accentColor,
      fieldBackground: kHeroWhite,
      fieldForeground: kHeroEclipse,
      fieldPlaceholder: _oklch(55.17, 0.0138, 285.94),
      fieldBorder: Colors.transparent,
      segment: kHeroWhite,
      segmentForeground: kHeroEclipse,
      success: _oklch(73.29, 0.1935, 150.81),
      successForeground: kHeroEclipse,
      warning: _oklch(78.19, 0.1585, 72.33),
      warningForeground: kHeroEclipse,
      danger: _oklch(65.32, 0.2328, 25.74),
      dangerForeground: kHeroSnow,
      border: _oklch(90, 0.004, 286.32),
      separator: _oklch(92, 0.004, 286.32),
      backdrop: const Color(0x80000000),
    );
  }

  /// Dark theme from HeroUI `theme.css`.
  factory HeroThemeData.dark() {
    final accentColor = _oklch(62.04, 0.195, 253.83);
    return HeroThemeData(
      background: _oklch(12, 0.005, 285.82),
      foreground: kHeroSnow,
      surface: _oklch(21.03, 0.0059, 285.89),
      surfaceForeground: kHeroSnow,
      surfaceSecondary: _oklch(25.70, 0.0037, 286.14),
      surfaceSecondaryForeground: kHeroSnow,
      surfaceTertiary: _oklch(27.21, 0.0024, 247.91),
      surfaceTertiaryForeground: kHeroSnow,
      overlay: _oklch(21.03, 0.0059, 285.89),
      overlayForeground: kHeroSnow,
      muted: _oklch(70.50, 0.015, 286.07),
      scrollbar: _oklch(70.50, 0.015, 286.07),
      defaultColor: _oklch(27.40, 0.006, 286.03),
      defaultForeground: kHeroSnow,
      accent: accentColor,
      accentForeground: kHeroSnow,
      accentSoft: _oklch(25.70, 0.0037, 286.14),
      accentSoftForeground: accentColor,
      fieldBackground: _oklch(21.03, 0.0059, 285.89),
      fieldForeground: kHeroSnow,
      fieldPlaceholder: _oklch(70.50, 0.015, 286.07),
      fieldBorder: Colors.transparent,
      segment: _oklch(39.64, 0.01, 285.93),
      segmentForeground: kHeroSnow,
      success: _oklch(73.29, 0.1935, 150.81),
      successForeground: kHeroEclipse,
      warning: _oklch(82.03, 0.1388, 76.34),
      warningForeground: kHeroEclipse,
      danger: _oklch(59.40, 0.1967, 24.63),
      dangerForeground: kHeroSnow,
      border: _oklch(28, 0.006, 286.03),
      separator: _oklch(25, 0.006, 286.03),
      backdrop: const Color(0x99000000),
    );
  }

  HeroThemeData copyWith({
    Color? background,
    Color? foreground,
    Color? surface,
    Color? surfaceForeground,
    Color? surfaceSecondary,
    Color? surfaceSecondaryForeground,
    Color? surfaceTertiary,
    Color? surfaceTertiaryForeground,
    Color? overlay,
    Color? overlayForeground,
    Color? muted,
    Color? scrollbar,
    Color? defaultColor,
    Color? defaultForeground,
    Color? accent,
    Color? accentForeground,
    Color? accentSoft,
    Color? accentSoftForeground,
    Color? fieldBackground,
    Color? fieldForeground,
    Color? fieldPlaceholder,
    Color? fieldBorder,
    Color? segment,
    Color? segmentForeground,
    Color? success,
    Color? successForeground,
    Color? warning,
    Color? warningForeground,
    Color? danger,
    Color? dangerForeground,
    Color? border,
    Color? separator,
    Color? backdrop,
    String? fontFamily,
    TextStyle? titleH1,
    TextStyle? titleH2,
    TextStyle? titleH3,
    TextStyle? titleH4,
    TextStyle? titleH5,
    TextStyle? titleH6,
    TextStyle? labelXLarge,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? labelXSmall,
    TextStyle? paragraphXLarge,
    TextStyle? paragraphLarge,
    TextStyle? paragraphMedium,
    TextStyle? paragraphSmall,
    TextStyle? paragraphXSmall,
    TextStyle? subheadingMedium,
    TextStyle? subheadingSmall,
    TextStyle? subheadingXSmall,
    TextStyle? subheading2XSmall,
    TextStyle? docLabel,
    TextStyle? docParagraph,
  }) {
    return HeroThemeData(
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      surface: surface ?? this.surface,
      surfaceForeground: surfaceForeground ?? this.surfaceForeground,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      surfaceSecondaryForeground:
          surfaceSecondaryForeground ?? this.surfaceSecondaryForeground,
      surfaceTertiary: surfaceTertiary ?? this.surfaceTertiary,
      surfaceTertiaryForeground:
          surfaceTertiaryForeground ?? this.surfaceTertiaryForeground,
      overlay: overlay ?? this.overlay,
      overlayForeground: overlayForeground ?? this.overlayForeground,
      muted: muted ?? this.muted,
      scrollbar: scrollbar ?? this.scrollbar,
      defaultColor: defaultColor ?? this.defaultColor,
      defaultForeground: defaultForeground ?? this.defaultForeground,
      accent: accent ?? this.accent,
      accentForeground: accentForeground ?? this.accentForeground,
      accentSoft: accentSoft ?? this.accentSoft,
      accentSoftForeground: accentSoftForeground ?? this.accentSoftForeground,
      fieldBackground: fieldBackground ?? this.fieldBackground,
      fieldForeground: fieldForeground ?? this.fieldForeground,
      fieldPlaceholder: fieldPlaceholder ?? this.fieldPlaceholder,
      fieldBorder: fieldBorder ?? this.fieldBorder,
      segment: segment ?? this.segment,
      segmentForeground: segmentForeground ?? this.segmentForeground,
      success: success ?? this.success,
      successForeground: successForeground ?? this.successForeground,
      warning: warning ?? this.warning,
      warningForeground: warningForeground ?? this.warningForeground,
      danger: danger ?? this.danger,
      dangerForeground: dangerForeground ?? this.dangerForeground,
      border: border ?? this.border,
      separator: separator ?? this.separator,
      backdrop: backdrop ?? this.backdrop,
      fontFamily: fontFamily ?? this.fontFamily,
      titleH1: titleH1 ?? this.titleH1,
      titleH2: titleH2 ?? this.titleH2,
      titleH3: titleH3 ?? this.titleH3,
      titleH4: titleH4 ?? this.titleH4,
      titleH5: titleH5 ?? this.titleH5,
      titleH6: titleH6 ?? this.titleH6,
      labelXLarge: labelXLarge ?? this.labelXLarge,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      labelXSmall: labelXSmall ?? this.labelXSmall,
      paragraphXLarge: paragraphXLarge ?? this.paragraphXLarge,
      paragraphLarge: paragraphLarge ?? this.paragraphLarge,
      paragraphMedium: paragraphMedium ?? this.paragraphMedium,
      paragraphSmall: paragraphSmall ?? this.paragraphSmall,
      paragraphXSmall: paragraphXSmall ?? this.paragraphXSmall,
      subheadingMedium: subheadingMedium ?? this.subheadingMedium,
      subheadingSmall: subheadingSmall ?? this.subheadingSmall,
      subheadingXSmall: subheadingXSmall ?? this.subheadingXSmall,
      subheading2XSmall: subheading2XSmall ?? this.subheading2XSmall,
      docLabel: docLabel ?? this.docLabel,
      docParagraph: docParagraph ?? this.docParagraph,
    );
  }

  /// Mixes [a] and [b] at the given ratio.
  /// [aFraction] is the proportion of [a] (0.0–1.0).
  /// Approximates CSS `color-mix(in oklab, a X%, b Y%)`.
  static Color _colorMix(Color a, double aFraction, Color b) {
    return Color.lerp(a, b, 1.0 - aFraction)!;
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

    // Derived hover colors: color-mix(in oklab, base X%, foreground Y%)
    final accentHover =
        HeroThemeData._colorMix(d.accent, 0.90, d.accentForeground);
    final defaultHover =
        HeroThemeData._colorMix(d.defaultColor, 0.96, d.defaultForeground);
    final dangerHover =
        HeroThemeData._colorMix(d.danger, 0.90, d.dangerForeground);
    final successHover =
        HeroThemeData._colorMix(d.success, 0.90, d.successForeground);
    final warningHover =
        HeroThemeData._colorMix(d.warning, 0.90, d.warningForeground);
    final surfaceHover =
        HeroThemeData._colorMix(d.surface, 0.92, d.surfaceForeground);

    // Derived background colors
    final backgroundSecondary =
        HeroThemeData._colorMix(d.background, 0.96, d.foreground);
    final backgroundTertiary =
        HeroThemeData._colorMix(d.background, 0.92, d.foreground);

    // Derived soft colors: color-mix(in oklab, base X%, transparent)
    final accentSoftHover = d.accent.withValues(alpha: 0.20);
    final dangerSoft = d.danger.withValues(alpha: 0.15);
    final dangerSoftHover = d.danger.withValues(alpha: 0.20);
    final successSoft = d.success.withValues(alpha: 0.15);
    final successSoftHover = d.success.withValues(alpha: 0.20);
    final warningSoft = d.warning.withValues(alpha: 0.15);
    final warningSoftHover = d.warning.withValues(alpha: 0.20);

    // Derived border/separator levels
    final separatorSecondary =
        HeroThemeData._colorMix(d.surface, 0.85, d.surfaceForeground);
    final separatorTertiary =
        HeroThemeData._colorMix(d.surface, 0.81, d.surfaceForeground);
    final borderSecondary =
        HeroThemeData._colorMix(d.surface, 0.78, d.surfaceForeground);
    final borderTertiary =
        HeroThemeData._colorMix(d.surface, 0.66, d.surfaceForeground);

    // Derived field interaction states
    final fieldHover =
        HeroThemeData._colorMix(d.fieldBackground, 0.98, d.fieldForeground);
    final fieldFocus = d.fieldBackground;
    final fieldBorderHover =
        HeroThemeData._colorMix(d.fieldBorder, 0.88, d.fieldForeground);
    final fieldBorderFocus =
        HeroThemeData._colorMix(d.fieldBorder, 0.74, d.fieldForeground);

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

        // Background extended
        $backgroundSecondary: backgroundSecondary,
        $backgroundTertiary: backgroundTertiary,
        $backgroundInverse: d.foreground,

        // Surface
        $surface: d.surface,
        $surfaceForeground: d.surfaceForeground,
        $surfaceSecondary: d.surfaceSecondary,
        $surfaceSecondaryForeground: d.surfaceSecondaryForeground,
        $surfaceTertiary: d.surfaceTertiary,
        $surfaceTertiaryForeground: d.surfaceTertiaryForeground,
        $surfaceHover: surfaceHover,

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
        $link: d.foreground,
        $backdrop: d.backdrop,

        // Derived: hover states
        $accentHover: accentHover,
        $defaultHover: defaultHover,

        // Derived: accent soft
        $accentSoft: d.accentSoft,
        $accentSoftForeground: d.accentSoftForeground,
        $accentSoftHover: accentSoftHover,

        // Derived: danger
        $dangerHover: dangerHover,
        $dangerSoft: dangerSoft,
        $dangerSoftHover: dangerSoftHover,
        $dangerSoftForeground: d.danger,

        // Derived: success
        $successHover: successHover,
        $successSoft: successSoft,
        $successSoftForeground: d.success,
        $successSoftHover: successSoftHover,

        // Derived: warning
        $warningHover: warningHover,
        $warningSoft: warningSoft,
        $warningSoftForeground: d.warning,
        $warningSoftHover: warningSoftHover,

        // Derived: border/separator levels
        $borderSecondary: borderSecondary,
        $borderTertiary: borderTertiary,
        $separatorSecondary: separatorSecondary,
        $separatorTertiary: separatorTertiary,

        // Derived: field interaction states
        $fieldHover: fieldHover,
        $fieldFocus: fieldFocus,
        $fieldBorderHover: fieldBorderHover,
        $fieldBorderFocus: fieldBorderFocus,
      },
      spaces: {$spacing: 4.0},
      doubles: {
        $disabledOpacity: 0.5,
        $borderWidth: 1.0,
        $ringOffsetWidth: 2.0,
      },
      radii: {
        // theme.css: --radius: 0.5rem; --field-radius: calc(var(--radius) * 1.5)
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
