import 'package:kazahana/core/internals/deeplink.dart';
import 'package:kazahana/core/internals/router/route.dart';

class InternalSecondInstanceRoute extends InternalRoute {
  @override
  bool matches(final InternalRouteUri uri) => uri.path == routeName;

  @override
  Future<void> handle(final InternalRouteUri uri) async {
    final String? deeplink = uri.queries['deeplink'];
    if (deeplink != null) {
      InternalDeeplink.handle(deeplink);
    }
  }

  static const String routeName = '/second-instance';

  static String constructRouteName(final String deeplink) {
    final InternalRouteUri uri = InternalRouteUri(
      path: routeName,
      queries: <String, String>{
        'deeplink': deeplink,
      },
      hash: '',
    );
    return uri.toString();
  }
}
