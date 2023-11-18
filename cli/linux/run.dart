import 'dart:io';
import '../prerequisites.dart' as prerequisites;
import '../utils/exports.dart';

const Logger _logger = Logger('run');

Future<void> main(final List<String> args) async {
  if (!args.contains('--skip-build-runner')) {
    await prerequisites.main(args);
  }
  _logger.info('Starting...');

  final Process process = await Process.start(
    'flutter',
    <String>['run', '--verbose', '-d', 'linux'],
    mode: ProcessStartMode.inheritStdio,
  );

  final int exitCode = await process.exitCode;
  if (exitCode != 0) {
    throw Exception('Debug run failed with error code $exitCode');
  }
}
