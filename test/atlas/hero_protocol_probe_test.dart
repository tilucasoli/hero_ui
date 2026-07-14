import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hero_ui/hero_ui.dart';
import 'package:mix/mix.dart';
import 'package:mix_protocol/mix_protocol.dart';

import 'support/hero_button_component_artifact.dart';

void main() {
  group('Hero UI protocol producer', () {
    for (final brightness in Brightness.values) {
      testWidgets('${brightness.name} theme round-trips canonically', (
        tester,
      ) async {
        final tokens = await _captureHeroTokens(tester, brightness);
        final encoded = _expectSuccess(
          mixProtocol.encodeTheme(MixProtocolTheme(tokens: tokens)),
        );
        final decoded = _expectSuccess(mixProtocol.decodeTheme(encoded));
        final reencoded = _expectSuccess(mixProtocol.encodeTheme(decoded));

        expect(reencoded, encoded);
        expect(decoded.tokens, hasLength(tokens.length));
      });
    }

    testWidgets('canonical Atlas protocol artifacts match', (tester) async {
      if (autoUpdateGoldenFiles) _resetGeneratedButtonArtifacts();
      final themeCoverage = <Map<String, Object?>>[];

      for (final brightness in Brightness.values) {
        final tokens = await _captureHeroTokens(tester, brightness);
        final themeDocument = _expectSuccess(
          mixProtocol.encodeTheme(MixProtocolTheme(tokens: tokens)),
        );
        _expectJsonArtifact(
          'goldens/protocol/themes/${brightness.name}.mix.json',
          themeDocument,
        );
        themeCoverage.add({
          'id': brightness.name,
          'status': 'supported',
          'tokenCount': tokens.length,
          'rawDiagnostics': <Object?>[],
        });
      }

      final componentArtifacts = buildHeroButtonComponentArtifacts();
      _expectJsonArtifact(
        'goldens/components/button.component.json',
        componentArtifacts.document,
      );
      final styleEntries = componentArtifacts.styleDocuments.entries.toList()
        ..sort((left, right) => left.key.compareTo(right.key));
      for (final entry in styleEntries) {
        _expectJsonArtifact('goldens/${entry.key}', entry.value);
      }

      final directErrors = _expectFailure(
        mixProtocol.encodeStyle(heroButtonStyle()),
      );
      final projectionDiagnostics = [
        for (final diagnostic in componentArtifacts.projectionDiagnostics)
          diagnostic.toJson(),
        const {
          'code': 'unsupported_slot_primitive',
          'severity': 'error',
          'path': 'spinner',
          'message': 'RemixSpinner has no neutral Mix protocol primitive.',
        },
      ];
      final coverage = <String, Object?>{
        'schema': 'mix_atlas/protocol-coverage/v1',
        'mixProtocolVersion': mixProtocolVersion,
        'mixProtocolFormat': mixProtocolFormatVersion,
        'themes': themeCoverage,
        'styles': [
          {
            'id': 'hero-button-portable',
            'runtimeType': 'RemixButtonStyler projection',
            'status':
                componentArtifacts.supportedContainerRecipes ==
                        componentArtifacts.recipeCount &&
                    componentArtifacts.styleDocuments.length ==
                        componentArtifacts.recipeCount * 3
                ? 'partial'
                : 'unsupported',
            'recipeCount': componentArtifacts.recipeCount,
            'stateCount': componentArtifacts.stateCount,
            'themeCount': componentArtifacts.themeCount,
            'totalMatrixCells': componentArtifacts.totalMatrixCells,
            'nonLoadingCells': componentArtifacts.nonLoadingCells,
            'loadingUnsupportedCells':
                componentArtifacts.loadingUnsupportedCells,
            'supportedContainerRecipes':
                componentArtifacts.supportedContainerRecipes,
            'diagnostics': projectionDiagnostics,
          },
          {
            'id': 'hero-button-composite',
            'runtimeType': 'RemixButtonStyler',
            'status': 'unsupported',
            'diagnostics': [for (final error in directErrors) error.toJson()],
          },
        ],
      };
      _expectJsonArtifact('goldens/protocol/coverage.json', coverage);
    });
  });
}

void _resetGeneratedButtonArtifacts() {
  final comparator = goldenFileComparator;
  if (comparator is! LocalFileComparator) {
    fail('Protocol artifacts require Flutter LocalFileComparator.');
  }
  for (final path in ['goldens/components', 'goldens/styles']) {
    final directory = Directory.fromUri(comparator.basedir.resolve(path));
    if (directory.existsSync()) directory.deleteSync(recursive: true);
  }
}

Future<Map<MixToken, Object>> _captureHeroTokens(
  WidgetTester tester,
  Brightness brightness,
) async {
  Map<MixToken, Object>? captured;
  final data = brightness == Brightness.dark
      ? HeroThemeData.dark()
      : HeroThemeData.light();

  await tester.pumpWidget(
    MaterialApp(
      home: HeroTheme(
        data: data.copyWith(fontFamily: 'Roboto'),
        child: Builder(
          builder: (context) {
            captured = Map.unmodifiable(MixScope.of(context).tokens!);

            return const SizedBox.shrink();
          },
        ),
      ),
    ),
  );

  return captured!;
}

T _expectSuccess<T extends Object>(MixProtocolResult<T> result) {
  return switch (result) {
    MixProtocolSuccess<T>(:final value) => value,
    MixProtocolFailure<T>(:final errors) => fail('Expected success: $errors'),
  };
}

List<MixProtocolError> _expectFailure<T extends Object>(
  MixProtocolResult<T> result,
) {
  return switch (result) {
    MixProtocolFailure<T>(:final errors) => errors,
    MixProtocolSuccess<T>() => fail('Expected protocol failure.'),
  };
}

void _expectJsonArtifact(String path, Map<String, Object?> payload) {
  final canonical = '${const JsonEncoder.withIndent('  ').convert(payload)}\n';
  final comparator = goldenFileComparator;
  if (comparator is! LocalFileComparator) {
    fail('Protocol artifacts require Flutter LocalFileComparator.');
  }
  final file = File.fromUri(comparator.basedir.resolve(path));

  if (autoUpdateGoldenFiles) {
    file.parent.createSync(recursive: true);
    file.writeAsStringSync(canonical);

    return;
  }

  expect(file.existsSync(), isTrue, reason: 'Missing protocol artifact: $path');
  if (!file.existsSync()) return;
  expect(
    file.readAsStringSync(),
    canonical,
    reason: 'Stale protocol artifact: $path',
  );
}
