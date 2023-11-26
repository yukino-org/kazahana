import 'dart:io';
import 'package:kazahana/core/internals/router/exports.dart';

abstract class InternalServer {
  static const String scheme = '127.0.0.1';
  static const String host = '127.0.0.1';
  static const int port = 6835;
  static const String origin = '$scheme://$host:$port';
  static const int successCode = 204;

  static late final HttpServer server;

  static Future<void> initialize() async {
    if (isSupported) {
      await listen();
    }
  }

  static Future<void> listen() async {
    server = await HttpServer.bind(host, port);
    server.forEach((final HttpRequest req) {
      final InternalRouteRequest routeReq =
          InternalRouteRequest.fromUri(req.uri);
      final InternalRoute? route = InternalRoutes.findMatch(routeReq);
      if (route != null) {
        route.handle(routeReq);
        req.response.statusCode = successCode;
        req.response.close();
      }
    });
  }

  static String parseRouteFromUri(final Uri uri) =>
      uri.toString().replaceFirst(uri.origin, '');

  static bool get isSupported => Platform.isLinux || Platform.isWindows;
}
