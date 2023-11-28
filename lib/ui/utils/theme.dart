import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/utils/themes.dart';

class Theme {
  const Theme({
    required this.name,
    required this.light,
    required this.dark,
    required this.black,
  });

  final ThemeNames name;
  final ThemeColors light;
  final ThemeColors dark;
  final ThemeColors black;
}

class ThemeColors {
  const ThemeColors({
    required this.background,
    required this.onBackground,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.accent,
    required this.onAccent,
  });

  final Color background;
  final Color onBackground;
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color accent;
  final Color onAccent;
}
