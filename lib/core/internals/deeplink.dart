import 'dart:io';
import 'package:kazahana/core/app/exports.dart';
import 'package:kazahana/core/internals/router/exports.dart';
import 'package:kazahana/core/packages.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:uni_links/uni_links.dart' as uni_links;

abstract class InternalDeeplink {
  static String? initialLink;

  static Future<void> initializeAfterLoad() async {
    if (Platform.isAndroid) {
      final String? path = await uni_links.getInitialLink();
      if (path != null) handle(path);
      uni_links.linkStream.listen((final String? path) {
        if (path == null) return;
        handle(path);
      });
    }
    if (initialLink != null) handle(initialLink!);
  }

  static void handle(final String path) {
    String resolvedPath = path;
    if (resolvedPath.startsWith(fullScheme)) {
      resolvedPath = resolvedPath.replaceFirst(fullScheme, '');
    }
    debugPrint('Incoming deeplink: $resolvedPath');
    final InternalRouteRequest routeReq =
        InternalRouteRequest.fromRawPath(path);
    final InternalRoute? internalRoute = InternalRoutes.findMatch(routeReq);
    if (internalRoute != null) {
      internalRoute.handle(routeReq);
      return;
    }
    gNavigatorKey.currentState!.pushNamed(resolvedPath);
  }

  static const String fullScheme = '${AppMeta.scheme}://';
}
