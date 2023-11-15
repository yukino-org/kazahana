import 'package:flutter/material.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/settings/view.dart';

class SettingsPageRoute extends RoutePage {
  @override
  bool matches(final RouteInfo route) => route.name == routeName;

  @override
  Widget build(final RouteInfo route) => const SettingsPage();

  static const String routeName = '/settings';
}

extension SettingsPageRouteUtils on RoutePusher {
  Future<void> pushToSettingsPage() =>
      navigator.pushNamed(SettingsPageRoute.routeName);
}
