import 'package:kazahana/core/internals/router/route.dart';
import 'package:kazahana/core/internals/router/routes/exports.dart';
import 'package:kazahana/core/utils/exports.dart';

abstract class InternalRoutes {
  static AnilistAuthRoute anilistAuth = AnilistAuthRoute();

  static InternalRoute? findMatch(final String route) =>
      all.firstWhereOrNull((final InternalRoute x) => x.matches(route));

  static List<InternalRoute> get all => <InternalRoute>[anilistAuth];
}
