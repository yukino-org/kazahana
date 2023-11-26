import 'package:kazahana/core/exports.dart';

class DupedApp extends StatefulWidget {
  const DupedApp({
    super.key,
  });

  @override
  State<DupedApp> createState() => _DupedAppState();
}

class _DupedAppState extends State<DupedApp> {
  final Color backgroundColor = const Color(0xff151514);
  final Color contentColor = const Color(0xffb6b4af);
  final Color contentColorDark = const Color(0xff77766e);

  String message = '...';

  @override
  void initState() {
    super.initState();
    AppEvents.stream.listen((final AppEvent event) {
      if (event == AppEvent.translationsChange) {
        setState(() {
          message = Translator.currentTranslation.youCanCloseThisWindow;
        });
      }
    });
    initializeRequired();
  }

  Future<void> initializeRequired() async {
    await Paths.initialize();
    await SettingsDatabase.initialize();
    await Translator.initialize();
  }

  @override
  Widget build(final BuildContext context) => WidgetsApp(
        color: backgroundColor,
        builder: (final BuildContext context, final _) => Container(
          color: backgroundColor,
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppMeta.name,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: contentColor,
                        fontFamily: Fonts.greatVibes,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: contentColorDark,
                        fontFamily: Fonts.inter,
                      ),
                ),
              ],
            ),
          ),
        ),
      );
}
