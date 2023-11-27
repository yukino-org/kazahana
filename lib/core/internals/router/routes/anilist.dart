import 'package:kazahana/core/anilist/exports.dart';
import 'package:kazahana/core/internals/router/route.dart';

class InternalAnilistAuthRoute extends InternalRoute {
  @override
  bool matches(final InternalRouteUri uri) => uri.path == routeName;

  @override
  Future<void> handle(final InternalRouteUri uri) async {
    final AnilistToken token = AnilistToken.parseHash(uri.hash);
    await AnilistAuth.authenticate(token);
  }

  static const String routeName = '/anilist/auth';
}
