import 'package:flutter/material.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/modules/view.dart';

class ModulesPageRoute extends RoutePage {
  @override
  bool matches(final RouteInfo route) => route.name == routeName;

  @override
  Widget build(final RouteInfo route) => const ModulesPage();

  static const String routeName = '/modules';
}

extension ModulesPageRouteUtils on RoutePusher {
  Future<void> pushToModulesPage() => navigator.pushNamed(ModulesPageRoute.routeName);
}
