import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../tokens/hero_tokens.dart';

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
      accentHover: HSLColor.fromColor(accent)
          .withLightness(
            (HSLColor.fromColor(accent).lightness - 0.05).clamp(0.0, 1.0),
          )
          .toColor(),
      accentForeground: Colors.white,
      defaultColor: effectiveDefault,
      defaultHover: HSLColor.fromColor(effectiveDefault)
          .withLightness(
            (HSLColor.fromColor(effectiveDefault).lightness - 0.05)
                .clamp(0.0, 1.0),
          )
          .toColor(),
      defaultForeground: Colors.grey.shade900,
      accentSoftForeground: accent,
      danger: danger,
      dangerHover: HSLColor.fromColor(danger)
          .withLightness(
            (HSLColor.fromColor(danger).lightness - 0.05).clamp(0.0, 1.0),
          )
          .toColor(),
      dangerForeground: Colors.white,
      dangerSoft: danger.withValues(alpha: 0.1),
      dangerSoftHover: danger.withValues(alpha: 0.15),
      dangerSoftForeground: danger,
      border: effectiveBorder,
    );
  }
}

class HeroTheme extends StatelessWidget {
  final HeroTokenData tokens;
  final Widget child;

  const HeroTheme({
    super.key,
    required this.tokens,
    required this.child,
  });

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
