import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/pages/anilist/route.dart';
import 'package:kazahana/ui/pages/home/route.dart';
import 'package:kazahana/ui/pages/modules/route.dart';
import 'package:kazahana/ui/pages/search/route.dart';
import 'package:kazahana/ui/pages/settings/route.dart';
import 'package:kazahana/ui/pages/view/route.dart';
import 'package:kazahana/ui/router/route/info.dart';
import 'package:kazahana/ui/router/route/page.dart';

abstract class RoutePages {
  static final HomePageRoute home = HomePageRoute();
  static final SearchPageRoute search = SearchPageRoute();
  static final ViewPageRoute view = ViewPageRoute();
  static final SettingsPageRoute settings = SettingsPageRoute();
  static final ModulesPageRoute modules = ModulesPageRoute();
  static final AnilistPageRoute anilist = AnilistPageRoute();

  static RoutePage? findMatch(final RouteInfo route) =>
      all.firstWhereOrNull((final RoutePage x) => x.matches(route));

  static List<RoutePage> get all => <RoutePage>[
        home,
        search,
        view,
        settings,
        modules,
        anilist,
      ];
}
