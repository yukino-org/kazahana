import 'package:kazahana/core/exports.dart';

enum ThemeModes {
  light,
  dark,
  black,
}

extension ThemeModesUtils on ThemeModes {
  String getTitleCase(final Translation translation) => switch (this) {
        ThemeModes.light => translation.light,
        ThemeModes.dark => translation.dark,
        ThemeModes.black => translation.black,
      };
}
