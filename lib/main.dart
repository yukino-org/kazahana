import 'package:flutter/widgets.dart';
import 'package:kazahana/core/exports.dart';
import 'package:kazahana/core/internals/exports.dart';
import 'package:kazahana/ui/exports.dart';

Future<void> main(final List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final String? initialLink = _initialLinkFromArgs(args);
  final bool isFirstInstance = await _ensureFirstInstance(
    initialLink: initialLink,
  );
  await AppLoader.initializeLevel0();
  runApp(isFirstInstance ? const BaseApp() : const DupedApp());
}

String? _initialLinkFromArgs(final List<String> args) =>
    args.firstOrNull?.startsWith(InternalDeeplink.fullScheme) ?? false
        ? args.firstOrNull!.substring(InternalDeeplink.fullScheme.length)
        : null;

Future<bool> _ensureFirstInstance({
  required final String? initialLink,
}) async {
  final bool success = await InternalReporter.report(
    InternalSecondInstanceRoute.constructRouteName(initialLink ?? ''),
  );
  return !success;
}
