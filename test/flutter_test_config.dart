import 'dart:async';

import 'package:mix_atlas/golden.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  AtlasGoldens.precisionTolerance = 0.0001;
  configureAtlasGoldenComparator();
  await loadAtlasFonts();
  await testMain();
}
