import 'package:flutter/material.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/anilist/view.dart';

class AnilistPageRoute extends RoutePage {
  @override
  bool matches(final RouteInfo route) => route.name == routeName;

  @override
  Widget build(final RouteInfo route) => const AnilistPage();

  static const String routeName = '/anilist';
}

extension AnilistPageRouteUtils on RoutePusher {
  Future<void> pushToAnilistPage() =>
      navigator.pushNamed(AnilistPageRoute.routeName);
}
