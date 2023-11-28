import 'package:kazahana/ui/utils/theme/color_names.dart';
import 'package:kazahana/ui/utils/theme/color_scheme.dart';
import 'package:kazahana/ui/utils/theme/modes.dart';

class ColorTheme {
  const ColorTheme({
    required this.name,
    required this.light,
    required this.dark,
    required this.black,
  });

  final ColorNames name;
  final ColorScheme light;
  final ColorScheme dark;
  final ColorScheme black;

  ColorScheme matchMode(final ThemeModes mode) => switch (mode) {
        ThemeModes.light => light,
        ThemeModes.dark => dark,
        ThemeModes.black => black,
      };
}
