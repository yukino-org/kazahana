import 'package:kazahana/core/internals/router/route.dart';
import 'package:kazahana/core/internals/router/routes/exports.dart';
import 'package:kazahana/core/utils/exports.dart';

abstract class InternalRoutes {
  static InternalSecondInstanceRoute ping = InternalSecondInstanceRoute();
  static InternalAnilistAuthRoute anilistAuth = InternalAnilistAuthRoute();

  static InternalRoute? findMatch(final InternalRouteUri uri) =>
      all.firstWhereOrNull((final InternalRoute x) => x.matches(uri));

  static List<InternalRoute> get all => <InternalRoute>[ping, anilistAuth];
}
