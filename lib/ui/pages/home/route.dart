import 'package:flutter/material.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/home/view.dart';

class HomePageRoute extends RoutePage {
  @override
  bool matches(final RouteInfo route) => route.name == routeName;

  @override
  Widget build(final RouteInfo route) => const HomePage();

  static const String routeName = '/';
}

extension HomePageRouteUtils on RoutePusher {
  Future<void> pushToViewPage() => navigator.pushNamed(HomePageRoute.routeName);
}
