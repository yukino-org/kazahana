import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => WidgetsApp(
        title: AppMeta.name,
        navigatorKey: gNavigatorKey,
        debugShowCheckedModeBanner: false,
        color: Colors.transparent,
        builder: (
          final BuildContext context,
          final Widget? child,
        ) =>
            Composer(
          child: Builder(
            builder: (final BuildContext context) => Stack(
              children: <Widget>[
                child!,
                const SuperImposer(),
              ],
            ),
          ),
        ),
        onGenerateRoute: (final RouteSettings settings) {
          final RouteInfo route = RouteInfo(settings);
          final RoutePage? page = RoutePages.findMatch(route);
          if (page == null) return null;
          return page.buildRoutePage(route);
        },
      );
}
