import 'package:hero_ui/hero_ui.dart';
import 'package:remix/remix.dart';

final class HeroButtonProjectionDiagnostic {
  const HeroButtonProjectionDiagnostic({
    required this.code,
    required this.severity,
    required this.path,
    required this.message,
  });

  final String code;
  final String severity;
  final String path;
  final String message;

  Map<String, Object?> toJson() => {
    'code': code,
    'severity': severity,
    'path': path,
    'message': message,
  };
}

final class HeroButtonProtocolProjection {
  HeroButtonProtocolProjection({
    required this.container,
    required this.label,
    required this.icon,
    required List<HeroButtonProjectionDiagnostic> diagnostics,
  }) : diagnostics = List.unmodifiable(diagnostics);

  final FlexBoxStyler? container;
  final TextStyler? label;
  final IconStyler? icon;
  final List<HeroButtonProjectionDiagnostic> diagnostics;

  bool get spinnerSupported => false;

  HeroButtonProjectionDiagnostic get spinnerDiagnostic =>
      const HeroButtonProjectionDiagnostic(
        code: 'unsupported_slot_primitive',
        severity: 'error',
        path: 'spinner',
        message: 'RemixSpinner has no neutral Mix protocol primitive.',
      );
}

/// Projects the real Hero Button composite style into protocol leaf stylers.
///
/// The adapter reads the component's existing Mix sources and variants. It
/// does not restate colors, dimensions, or interaction styles.
HeroButtonProtocolProjection projectHeroButtonStyler({
  required HeroButtonVariant variant,
  required HeroButtonSize size,
}) {
  final effectiveStyle = RemixButtonStyler()
      .mainAxisSize(.min)
      .merge(heroButtonStyle(variant: variant, size: size));
  final container = _projectContainer(effectiveStyle, depth: 0);
  final label = _projectLabel(effectiveStyle, depth: 0);
  final icon = _projectIcon(effectiveStyle, depth: 0);
  final diagnostics = <HeroButtonProjectionDiagnostic>[
    ...container.diagnostics,
    ...label.diagnostics,
    ...icon.diagnostics,
    ..._componentDiagnostics(effectiveStyle),
  ];

  return HeroButtonProtocolProjection(
    container: container.value,
    label: label.value,
    icon: icon.value,
    diagnostics: _uniqueDiagnostics(diagnostics),
  );
}

final class _Projection<T extends Object> {
  const _Projection({required this.value, required this.diagnostics});

  final T? value;
  final List<HeroButtonProjectionDiagnostic> diagnostics;
}

_Projection<FlexBoxStyler> _projectContainer(
  RemixButtonStyler style, {
  required int depth,
}) {
  if (depth > 16) return _depthFailure('container');
  final diagnostics = <HeroButtonProjectionDiagnostic>[];
  FlexBoxStyler? result;
  final property = style.$container;
  if (property != null) {
    if (property.$directives?.isNotEmpty ?? false) {
      diagnostics.add(_unsupportedSource('container', 'directives'));
    }
    for (final source in property.sources) {
      if (source is MixSource<StyleSpec<FlexBoxSpec>> &&
          source.mix is FlexBoxStyler) {
        final leaf = source.mix as FlexBoxStyler;
        result = result == null ? leaf : result.merge(leaf);
      } else {
        diagnostics.add(
          _unsupportedSource('container', source.runtimeType.toString()),
        );
      }
    }
  }
  final variants = <VariantStyle<FlexBoxSpec>>[];
  for (final variant
      in style.$variants ?? const <VariantStyle<RemixButtonSpec>>[]) {
    final nested = variant.value;
    if (nested is! RemixButtonStyler) {
      diagnostics.add(
        _unsupportedSource('container', nested.runtimeType.toString()),
      );
      continue;
    }
    final projected = _projectContainer(nested, depth: depth + 1);
    diagnostics.addAll(projected.diagnostics);
    if (projected.value != null) {
      variants.add(VariantStyle(variant.variant, projected.value!));
    }
  }
  if (variants.isNotEmpty) {
    result = (result ?? FlexBoxStyler()).variants(variants);
  }

  return _Projection(value: result, diagnostics: diagnostics);
}

_Projection<TextStyler> _projectLabel(
  RemixButtonStyler style, {
  required int depth,
}) {
  if (depth > 16) return _depthFailure('label');
  final diagnostics = <HeroButtonProjectionDiagnostic>[];
  TextStyler? result;
  final property = style.$label;
  if (property != null) {
    if (property.$directives?.isNotEmpty ?? false) {
      diagnostics.add(_unsupportedSource('label', 'directives'));
    }
    for (final source in property.sources) {
      if (source is MixSource<StyleSpec<TextSpec>> &&
          source.mix is TextStyler) {
        final leaf = source.mix as TextStyler;
        result = result == null ? leaf : result.merge(leaf);
      } else {
        diagnostics.add(
          _unsupportedSource('label', source.runtimeType.toString()),
        );
      }
    }
  }
  final variants = <VariantStyle<TextSpec>>[];
  for (final variant
      in style.$variants ?? const <VariantStyle<RemixButtonSpec>>[]) {
    final nested = variant.value;
    if (nested is! RemixButtonStyler) {
      diagnostics.add(
        _unsupportedSource('label', nested.runtimeType.toString()),
      );
      continue;
    }
    final projected = _projectLabel(nested, depth: depth + 1);
    diagnostics.addAll(projected.diagnostics);
    if (projected.value != null) {
      variants.add(VariantStyle(variant.variant, projected.value!));
    }
  }
  if (variants.isNotEmpty) {
    result = (result ?? TextStyler()).variants(variants);
  }

  return _Projection(value: result, diagnostics: diagnostics);
}

_Projection<IconStyler> _projectIcon(
  RemixButtonStyler style, {
  required int depth,
}) {
  if (depth > 16) return _depthFailure('icon');
  final diagnostics = <HeroButtonProjectionDiagnostic>[];
  IconStyler? result;
  final property = style.$icon;
  if (property != null) {
    if (property.$directives?.isNotEmpty ?? false) {
      diagnostics.add(_unsupportedSource('icon', 'directives'));
    }
    for (final source in property.sources) {
      if (source is MixSource<StyleSpec<IconSpec>> &&
          source.mix is IconStyler) {
        final leaf = source.mix as IconStyler;
        result = result == null ? leaf : result.merge(leaf);
      } else {
        diagnostics.add(
          _unsupportedSource('icon', source.runtimeType.toString()),
        );
      }
    }
  }
  final variants = <VariantStyle<IconSpec>>[];
  for (final variant
      in style.$variants ?? const <VariantStyle<RemixButtonSpec>>[]) {
    final nested = variant.value;
    if (nested is! RemixButtonStyler) {
      diagnostics.add(
        _unsupportedSource('icon', nested.runtimeType.toString()),
      );
      continue;
    }
    final projected = _projectIcon(nested, depth: depth + 1);
    diagnostics.addAll(projected.diagnostics);
    if (projected.value != null) {
      variants.add(VariantStyle(variant.variant, projected.value!));
    }
  }
  if (variants.isNotEmpty) {
    result = (result ?? IconStyler()).variants(variants);
  }

  return _Projection(value: result, diagnostics: diagnostics);
}

List<HeroButtonProjectionDiagnostic> _componentDiagnostics(
  RemixButtonStyler style,
) {
  final diagnostics = <HeroButtonProjectionDiagnostic>[];

  void visit(RemixButtonStyler current, String path, int depth) {
    if (depth > 16) return;
    if (current.$modifier != null) {
      diagnostics.add(
        HeroButtonProjectionDiagnostic(
          code: 'unsupported_component_modifier',
          severity: 'warning',
          path: '$path/modifier',
          message:
              'Button-level widget modifiers are not projected to a leaf slot.',
        ),
      );
    }
    if (current.$animation != null) {
      diagnostics.add(
        HeroButtonProjectionDiagnostic(
          code: 'unsupported_component_animation',
          severity: 'warning',
          path: '$path/animation',
          message:
              'Button-level animation is omitted from the static portable capture.',
        ),
      );
    }
    if (current.$iconAlignment != null) {
      diagnostics.add(
        HeroButtonProjectionDiagnostic(
          code: 'unsupported_component_scalar',
          severity: 'warning',
          path: '$path/iconAlignment',
          message: 'Icon alignment requires an explicit anatomy property.',
        ),
      );
    }
    for (final variant
        in current.$variants ?? const <VariantStyle<RemixButtonSpec>>[]) {
      final nested = variant.value;
      if (nested is RemixButtonStyler) {
        visit(
          nested,
          '$path/variants/${variant.variant.runtimeType}',
          depth + 1,
        );
      }
    }
  }

  visit(style, 'button', 0);

  return diagnostics;
}

List<HeroButtonProjectionDiagnostic> _uniqueDiagnostics(
  List<HeroButtonProjectionDiagnostic> diagnostics,
) {
  final seen = <String>{};

  return [
    for (final diagnostic in diagnostics)
      if (seen.add(
        '${diagnostic.code}|${diagnostic.severity}|${diagnostic.path}|'
        '${diagnostic.message}',
      ))
        diagnostic,
  ];
}

_Projection<T> _depthFailure<T extends Object>(String path) => _Projection(
  value: null,
  diagnostics: [
    HeroButtonProjectionDiagnostic(
      code: 'component_projection_limit',
      severity: 'error',
      path: path,
      message: 'Button variant nesting exceeds the projection limit.',
    ),
  ],
);

HeroButtonProjectionDiagnostic _unsupportedSource(String path, String source) =>
    HeroButtonProjectionDiagnostic(
      code: 'unsupported_component_source',
      severity: 'error',
      path: path,
      message: 'Cannot project $source into a built-in $path styler.',
    );
