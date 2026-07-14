import 'package:hero_ui/hero_ui.dart';
import 'package:mix_protocol/mix_protocol.dart';

import 'hero_button_protocol_adapter.dart';

final class HeroButtonComponentArtifacts {
  HeroButtonComponentArtifacts({
    required this.document,
    required Map<String, Map<String, Object?>> styleDocuments,
    required List<HeroButtonProjectionDiagnostic> projectionDiagnostics,
  }) : styleDocuments = Map.unmodifiable(styleDocuments),
       projectionDiagnostics = List.unmodifiable(projectionDiagnostics);

  final Map<String, Object?> document;
  final Map<String, Map<String, Object?>> styleDocuments;
  final List<HeroButtonProjectionDiagnostic> projectionDiagnostics;

  int get recipeCount =>
      HeroButtonVariant.values.length * HeroButtonSize.values.length;
  int get stateCount => 6;
  int get themeCount => 2;
  int get totalMatrixCells => recipeCount * stateCount * themeCount;
  int get nonLoadingCells => recipeCount * (stateCount - 1) * themeCount;
  int get loadingUnsupportedCells => recipeCount * themeCount;

  int get supportedContainerRecipes {
    final recipes = document['recipes']! as List<Object?>;

    return recipes.where((value) {
      final recipe = value! as Map<String, Object?>;
      final styles = recipe['styles']! as Map<String, Object?>;
      final container = styles['container']! as Map<String, Object?>;

      return container['status'] == 'supported';
    }).length;
  }
}

HeroButtonComponentArtifacts buildHeroButtonComponentArtifacts() {
  final styleDocuments = <String, Map<String, Object?>>{};
  final recipes = <Map<String, Object?>>[];
  final diagnostics = <HeroButtonProjectionDiagnostic>[];
  for (final variant in HeroButtonVariant.values) {
    for (final size in HeroButtonSize.values) {
      final id = '${variant.name}-${size.name}';
      final projection = projectHeroButtonStyler(variant: variant, size: size);
      diagnostics.addAll(projection.diagnostics);
      final container = _encodeSlot(
        projection.container,
        path: 'styles/button/$id/container.mix.json',
        documents: styleDocuments,
      );
      final label = _encodeSlot(
        projection.label,
        path: 'styles/button/$id/label.mix.json',
        documents: styleDocuments,
      );
      final icon = _encodeSlot(
        projection.icon,
        path: 'styles/button/$id/icon.mix.json',
        documents: styleDocuments,
      );
      recipes.add({
        'id': id,
        'properties': {'variant': variant.name, 'size': size.name},
        'styles': {
          'container': container,
          'label': label,
          'leadingIcon': Map<String, Object?>.of(icon),
          'trailingIcon': Map<String, Object?>.of(icon),
          'spinner': {
            'status': 'unsupported',
            'evidence': 'declared',
            'diagnostics': [projection.spinnerDiagnostic.toJson()],
          },
        },
      });
    }
  }

  return HeroButtonComponentArtifacts(
    document: {
      'schema': 'mix_atlas/component/v1',
      'id': 'button',
      'label': 'Hero Button',
      'properties': [
        {
          'id': 'variant',
          'kind': 'enum',
          'values': [for (final value in HeroButtonVariant.values) value.name],
          'default': HeroButtonVariant.primary.name,
        },
        {
          'id': 'size',
          'kind': 'enum',
          'values': [for (final value in HeroButtonSize.values) value.name],
          'default': HeroButtonSize.md.name,
        },
        {'id': 'label', 'kind': 'string', 'default': 'Button'},
        {'id': 'leadingIcon', 'kind': 'icon', 'required': false},
        {'id': 'trailingIcon', 'kind': 'icon', 'required': false},
        {'id': 'enabled', 'kind': 'boolean', 'default': true},
        {'id': 'loading', 'kind': 'boolean', 'default': false},
      ],
      'states': [
        {
          'id': 'default',
          'widgetStates': <Object?>[],
          'properties': <String, Object?>{},
        },
        {
          'id': 'hovered',
          'widgetStates': ['hovered'],
          'properties': <String, Object?>{},
        },
        {
          'id': 'pressed',
          'widgetStates': ['pressed'],
          'properties': <String, Object?>{},
        },
        {
          'id': 'focused',
          'widgetStates': ['focused'],
          'properties': <String, Object?>{},
        },
        {
          'id': 'disabled',
          'widgetStates': ['disabled'],
          'properties': {'enabled': false},
        },
        {
          'id': 'loading',
          'widgetStates': ['disabled'],
          'properties': {'enabled': false, 'loading': true},
        },
      ],
      'slots': [
        {'id': 'container', 'kind': 'flex_box'},
        {'id': 'label', 'kind': 'text'},
        {'id': 'leadingIcon', 'kind': 'icon'},
        {'id': 'trailingIcon', 'kind': 'icon'},
        {'id': 'spinner', 'kind': 'spinner'},
      ],
      'anatomy': {
        'root': 'root',
        'nodes': [
          {
            'id': 'root',
            'kind': 'stack',
            'alignment': 'center',
            'children': ['content', 'spinner'],
          },
          {
            'id': 'content',
            'kind': 'slot',
            'slot': 'container',
            'children': ['leadingIcon', 'label', 'trailingIcon'],
            'visibleWhen': {
              'property': 'loading',
              'operator': 'equals',
              'value': false,
            },
            'maintain': ['size', 'state', 'animation'],
          },
          {
            'id': 'leadingIcon',
            'kind': 'slot',
            'slot': 'leadingIcon',
            'children': <Object?>[],
            'visibleWhen': {'property': 'leadingIcon', 'operator': 'present'},
          },
          {
            'id': 'label',
            'kind': 'slot',
            'slot': 'label',
            'children': <Object?>[],
          },
          {
            'id': 'trailingIcon',
            'kind': 'slot',
            'slot': 'trailingIcon',
            'children': <Object?>[],
            'visibleWhen': {'property': 'trailingIcon', 'operator': 'present'},
          },
          {
            'id': 'spinner',
            'kind': 'slot',
            'slot': 'spinner',
            'children': <Object?>[],
            'visibleWhen': {
              'property': 'loading',
              'operator': 'equals',
              'value': true,
            },
          },
        ],
      },
      'recipes': recipes,
      'semantics': {
        'role': 'button',
        'labelProperty': 'label',
        'enabledProperty': 'enabled',
        'loadingProperty': 'loading',
      },
      'oracles': [
        {
          'theme': 'light',
          'image': 'light/button.png',
          'metadata': 'light/button.json',
          'evidence': 'rendered',
        },
        {
          'theme': 'dark',
          'image': 'dark/button.png',
          'metadata': 'dark/button.json',
          'evidence': 'rendered',
        },
      ],
    },
    styleDocuments: styleDocuments,
    projectionDiagnostics: _uniqueDiagnostics(diagnostics),
  );
}

Map<String, Object?> _encodeSlot(
  Object? style, {
  required String path,
  required Map<String, Map<String, Object?>> documents,
}) {
  if (style == null) {
    return {
      'status': 'unsupported',
      'evidence': 'declared',
      'diagnostics': [
        {
          'code': 'missing_component_slot_style',
          'severity': 'error',
          'path': path,
          'message': 'The composite style did not declare this slot.',
        },
      ],
    };
  }
  final encoded = mixProtocol.encodeStyle(style);

  return switch (encoded) {
    MixProtocolSuccess<Map<String, Object?>>(:final value) => () {
      documents[path] = value;

      return {'status': 'supported', 'evidence': 'declared', 'document': path};
    }(),
    MixProtocolFailure<Map<String, Object?>>(:final errors) => {
      'status': 'unsupported',
      'evidence': 'declared',
      'diagnostics': [for (final error in errors) error.toJson()],
    },
  };
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
