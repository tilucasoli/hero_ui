import 'dart:io';

Future<void> main(List<String> arguments) async {
  final unknown = arguments.where((argument) => argument != '--check').toList();
  if (unknown.isNotEmpty) {
    stderr.writeln('Unknown arguments: ${unknown.join(' ')}');
    exitCode = 64;

    return;
  }

  final checkOnly = arguments.contains('--check');
  final updateArgument = checkOnly ? <String>[] : ['--update-goldens'];
  final packageArgument = checkOnly ? ['--check'] : <String>[];
  final commands = <List<String>>[
    [
      'fvm',
      'flutter',
      'test',
      'test/atlas/hero_protocol_probe_test.dart',
      ...updateArgument,
    ],
    [
      'fvm',
      'flutter',
      'test',
      'test/atlas/hero_atlas_golden_test.dart',
      ...updateArgument,
    ],
    ['fvm', 'dart', 'run', 'tool/package_hero_atlas.dart', ...packageArgument],
    ['fvm', 'flutter', 'test', 'test/atlas/hero_capture_bundle_test.dart'],
  ];

  for (final command in commands) {
    stdout.writeln(_runningMessage(command));
    final process = await Process.start(
      command.first,
      command.skip(1).toList(),
      mode: ProcessStartMode.inheritStdio,
    );
    final result = await process.exitCode;
    if (result != 0) {
      exitCode = result;

      return;
    }
  }
}

String _runningMessage(List<String> command) => r'$ ' + command.join(' ');
