import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';

// TODO: tidy
class Composer extends StatefulWidget {
  const Composer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<Composer> createState() => _ComposerState();
}

class _ComposerState extends State<Composer> {
  late int stateId;
  late ThemeModes themeMode;
  late ColorTheme colorTheme;
  late ColorScheme colorScheme;
  late TextTheme textTheme;
  late Translation translation;
  late double scaleMultiplier;

  @override
  void initState() {
    super.initState();
    stateId = DateTime.now().millisecondsSinceEpoch;
    translation = Translator.currentTranslation;
    scaleMultiplier = SettingsDatabase.settings.scaleMultiplier;
    textTheme = TextTheme(fontFamily: Fonts.inter, multiplier: scaleMultiplier);
    updateTheme();
    AppEvents.stream.listen((final AppEvent event) {
      if (event == AppEvent.settingsChange) {
        stateId = DateTime.now().millisecondsSinceEpoch;
        scaleMultiplier = SettingsDatabase.settings.scaleMultiplier;
        textTheme =
            TextTheme(fontFamily: Fonts.inter, multiplier: scaleMultiplier);
        updateTheme();
        setState(() {});
      }
      if (event == AppEvent.translationsChange) {
        stateId = DateTime.now().millisecondsSinceEpoch;
        translation = Translator.currentTranslation;
        setState(() {});
      }
    });
  }

  void updateTheme() {
    themeMode = EnumUtils.findOrNull(
          ThemeModes.values,
          SettingsDatabase.settings.themeMode,
        ) ??
        ThemeModes.light;
    colorTheme = ColorThemes.resolveTheme(SettingsDatabase.settings.theme);
    colorScheme = colorTheme.matchMode(themeMode);
  }

  @override
  Widget build(final BuildContext context) {
    Widget child = widget.child;
    child = Composed(
      stateId: stateId,
      themeMode: themeMode,
      colorTheme: colorTheme,
      colorScheme: colorScheme,
      textTheme: textTheme,
      translation: translation,
      scaleMultiplier: scaleMultiplier,
      child: child,
    );
    child = Responsive(
      data: ResponsiveData(
        multiplier: scaleMultiplier,
        screen: ResponsiveData.getScreenSize(context),
      ),
      child: child,
    );
    child = DefaultTextStyle(
      style: textTheme.body,
      child: child,
    );
    return child;
  }
}

class Composed extends InheritedWidget {
  const Composed({
    required this.stateId,
    required this.themeMode,
    required this.colorTheme,
    required this.colorScheme,
    required this.textTheme,
    required this.translation,
    required this.scaleMultiplier,
    required super.child,
    super.key,
  });

  final int stateId;
  final ThemeModes themeMode;
  final ColorTheme colorTheme;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final Translation translation;
  final double scaleMultiplier;

  @override
  bool updateShouldNotify(final Composed oldWidget) =>
      oldWidget.stateId != stateId;

  static Composed of(final BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Composed>()!;
}

extension ComposedUtils on BuildContext {
  Composed get composed => Composed.of(this);
  ColorScheme get colorScheme => composed.colorScheme;
  TextTheme get textTheme => composed.textTheme;
  Translation get t => composed.translation;
}
