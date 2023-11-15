import 'package:flutter/material.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/search/view.dart';

class SearchPageRoute extends RoutePage {
  @override
  bool matches(final RouteInfo route) => route.name == routeName;

  @override
  Widget build(final RouteInfo route) => const SearchPage();

  static const String routeName = '/search';
}

extension SearchPageRouteUtils on RoutePusher {
  Future<void> pushToSearchPage() =>
      navigator.pushNamed(SearchPageRoute.routeName);
}
