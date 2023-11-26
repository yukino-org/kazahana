import 'package:kazahana/core/anilist/exports.dart';
import 'package:kazahana/core/internals/router/route.dart';

class InternalAnilistAuthRoute extends InternalRoute {
  @override
  bool matches(final InternalRouteRequest req) => req.path == routeName;

  @override
  Future<void> handle(final InternalRouteRequest req) async {
    final AnilistToken token = AnilistToken.parseHash(req.hash);
    await AnilistAuth.authenticate(token);
  }

  static const String routeName = '/anilist/auth';
}
