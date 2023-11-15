import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';

class BaseApp extends StatefulWidget {
  const BaseApp({
    super.key,
  });

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  late ThemerThemeData theme;
  late double scaleMultiplier;
  late String translationId;

  @override
  void initState() {
    super.initState();
    theme = Themer.defaultTheme();
    scaleMultiplier = RelativeScaleData.defaultScaleMultiplier;
    translationId = '';
    AppEvents.stream.listen((final AppEvent event) {
      if (event == AppEvent.settingsChange) {
        final ThemerThemeData nTheme = Themer.getCurrentTheme();
        if (theme != nTheme) {
          setState(() {
            theme = nTheme;
          });
        }
        final double nScaleMultiplier = RelativeScaleData.getScaleMultiplier();
        if (scaleMultiplier != nScaleMultiplier) {
          setState(() {
            scaleMultiplier = nScaleMultiplier;
          });
        }
      }
      if (event == AppEvent.translationsChange) {
        final String nTranslationId = Translator.identifier;
        if (translationId != nTranslationId) {
          setState(() {
            translationId = nTranslationId;
          });
        }
      }
    });
  }

  @override
  Widget build(final BuildContext context) => MaterialApp(
        title: AppMeta.name,
        navigatorKey: gNavigatorKey,
        debugShowCheckedModeBanner: false,
        builder: (
          final BuildContext context,
          final Widget? child,
        ) =>
            RelativeScaler(
          data: RelativeScaleData(
            multiplier: scaleMultiplier,
            screen: RelativeScaleData.getScreenSize(context),
          ),
          child: TranslationWrapper(
            id: translationId,
            child: Builder(
              builder: (final BuildContext context) => Theme(
                data: theme.getThemeData(context),
                child: Builder(
                  builder: (final BuildContext context) =>
                      ClassicWrapper(child: child!),
                ),
              ),
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

class ClassicWrapper extends StatelessWidget {
  const ClassicWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(final BuildContext context) =>
      Stack(children: <Widget>[child, const SuperImposer()]);
}
