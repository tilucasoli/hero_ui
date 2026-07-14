import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mix_atlas_capture/mix_atlas_capture.dart';

void main() {
  test('loads the complete generated Hero UI capture', () async {
    final directory = Directory('atlas/hero_ui');
    final capture =
        await AtlasCaptureReader(
          source: AtlasDirectorySource(directory.absolute),
        ).load(
          AtlasRepositoryRequest(
            repository: directory.path,
            ref: 'local',
            manifestPath: 'capture.json',
          ),
        );
    final component = capture.componentDocuments.single;

    expect(capture.manifest.id, 'hero-ui');
    expect(capture.files, hasLength(72));
    expect(capture.protocolThemes, hasLength(2));
    expect(component.id, 'button');
    expect(component.recipes, hasLength(21));
    expect(component.states, hasLength(6));
    expect(component.oracles, hasLength(2));
    expect(capture.validatedStyleDocumentCount, 63);
  });
}
