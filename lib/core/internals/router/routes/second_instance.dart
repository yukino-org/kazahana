import 'package:kazahana/core/internals/deeplink.dart';
import 'package:kazahana/core/internals/router/route.dart';

class InternalSecondInstanceRoute extends InternalRoute {
  @override
  bool matches(final InternalRouteRequest req) => req.path == routeName;

  @override
  Future<void> handle(final InternalRouteRequest req) async {
    final String? deeplink = req.queries['deeplink'];
    if (deeplink != null) {
      InternalDeeplink.handle(deeplink);
    }
  }

  static const String routeName = '/second-instance';

  static String constructRouteName(final String deeplink) =>
      '$routeName${Uri.encodeQueryComponent(deeplink)}';
}
