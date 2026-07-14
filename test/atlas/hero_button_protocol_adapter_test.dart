import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hero_ui/hero_ui.dart';
import 'package:mix/mix.dart';
import 'package:mix_protocol/mix_protocol.dart';

import 'support/hero_button_component_artifact.dart';
import 'support/hero_button_protocol_adapter.dart';

void main() {
  group('Hero Button protocol adapter', () {
    test('projects the real composite style instead of restating recipes', () {
      final projection = projectHeroButtonStyler(
        variant: HeroButtonVariant.dangerSoft,
        size: HeroButtonSize.lg,
      );

      expect(projection.container, isNotNull);
      expect(projection.label, isNotNull);
      expect(projection.icon, isNotNull);
      expect(
        projection.container!.$variants!
            .map((variant) => variant.variant)
            .whereType<WidgetStateVariant>()
            .map((variant) => variant.state),
        containsAll({WidgetState.hovered, WidgetState.pressed}),
      );
      expect(
        projection.diagnostics.map((diagnostic) => diagnostic.code),
        contains('unsupported_component_animation'),
      );
    });

    test('all public variant and size projections encode', () {
      for (final variant in HeroButtonVariant.values) {
        for (final size in HeroButtonSize.values) {
          final projection = projectHeroButtonStyler(
            variant: variant,
            size: size,
          );

          expect(
            mixProtocol.encodeStyle(projection.container!),
            isA<MixProtocolSuccess<Map<String, Object?>>>(),
            reason: '${variant.name}-${size.name} container',
          );
          expect(
            mixProtocol.encodeStyle(projection.label!),
            isA<MixProtocolSuccess<Map<String, Object?>>>(),
            reason: '${variant.name}-${size.name} label',
          );
          expect(
            mixProtocol.encodeStyle(projection.icon!),
            isA<MixProtocolSuccess<Map<String, Object?>>>(),
            reason: '${variant.name}-${size.name} icon',
          );
        }
      }
    });

    test('keeps custom spinner support explicit', () {
      final projection = projectHeroButtonStyler(
        variant: HeroButtonVariant.primary,
        size: HeroButtonSize.md,
      );

      expect(projection.spinnerSupported, isFalse);
      expect(projection.spinnerDiagnostic.code, 'unsupported_slot_primitive');
      expect(projection.spinnerDiagnostic.path, 'spinner');
    });

    test('builds a deterministic complete portable Button contract', () {
      final first = buildHeroButtonComponentArtifacts();
      final second = buildHeroButtonComponentArtifacts();
      final recipes = first.document['recipes']! as List<Object?>;
      final states = first.document['states']! as List<Object?>;
      final oracles = first.document['oracles']! as List<Object?>;

      expect(recipes, hasLength(21));
      expect(states, hasLength(6));
      expect(oracles, hasLength(2));
      expect(first.totalMatrixCells, 252);
      expect(first.nonLoadingCells, 210);
      expect(first.loadingUnsupportedCells, 42);
      expect(first.styleDocuments, hasLength(63));
      expect(first.supportedContainerRecipes, 21);
      expect(jsonEncode(first.document), jsonEncode(second.document));
      expect(
        jsonEncode(first.styleDocuments),
        jsonEncode(second.styleDocuments),
      );
      expect(
        recipes.map((value) => (value! as Map<String, Object?>)['id']),
        containsAll([
          for (final variant in HeroButtonVariant.values)
            for (final size in HeroButtonSize.values)
              '${variant.name}-${size.name}',
        ]),
      );
      expect(states.map((value) => (value! as Map<String, Object?>)['id']), [
        'default',
        'hovered',
        'pressed',
        'focused',
        'disabled',
        'loading',
      ]);
    });
  });
}
