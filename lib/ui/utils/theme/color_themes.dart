import 'dart:core';
import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/utils/theme/color/names.dart';
import 'package:kazahana/ui/utils/theme/color/theme.dart';

abstract class ColorThemes {
  static const Map<ColorNames, ColorTheme> all = <ColorNames, ColorTheme>{
    ColorNames.red: red,
    ColorNames.orange: orange,
    ColorNames.amber: amber,
    ColorNames.yellow: yellow,
    ColorNames.lime: lime,
    ColorNames.green: green,
    ColorNames.emerald: emerald,
    ColorNames.teal: teal,
    ColorNames.cyan: cyan,
    ColorNames.sky: sky,
    ColorNames.blue: blue,
    ColorNames.indigo: indigo,
    ColorNames.violet: violet,
    ColorNames.purple: purple,
    ColorNames.fuchsia: fuchsia,
    ColorNames.pink: pink,
    ColorNames.rose: rose,
  };

  static ColorTheme resolveTheme(final String? text) =>
      all[EnumUtils.findOrNull(ColorNames.values, text)] ?? ColorThemes.indigo;

  static const ColorTheme red = ColorTheme(
    name: ColorNames.red,
    light: ColorScheme(
      primary: Color(0xffef4444),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xfff87171),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xffef4444),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffdc2626),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xffef4444),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffdc2626),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme orange = ColorTheme(
    name: ColorNames.orange,
    light: ColorScheme(
      primary: Color(0xfff97316),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xfffb923c),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xfff97316),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffea580c),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xfff97316),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffea580c),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme amber = ColorTheme(
    name: ColorNames.amber,
    light: ColorScheme(
      primary: Color(0xfff59e0b),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xfffbbf24),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xfff59e0b),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffd97706),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xfff59e0b),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffd97706),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme yellow = ColorTheme(
    name: ColorNames.yellow,
    light: ColorScheme(
      primary: Color(0xffeab308),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xfffacc15),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xffeab308),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffca8a04),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xffeab308),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffca8a04),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme lime = ColorTheme(
    name: ColorNames.lime,
    light: ColorScheme(
      primary: Color(0xff84cc16),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffa3e635),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xff84cc16),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff65a30d),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xff84cc16),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff65a30d),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme green = ColorTheme(
    name: ColorNames.green,
    light: ColorScheme(
      primary: Color(0xff22c55e),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff4ade80),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xff22c55e),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff16a34a),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xff22c55e),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff16a34a),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme emerald = ColorTheme(
    name: ColorNames.emerald,
    light: ColorScheme(
      primary: Color(0xff10b981),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff34d399),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xff10b981),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff059669),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xff10b981),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff059669),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme teal = ColorTheme(
    name: ColorNames.teal,
    light: ColorScheme(
      primary: Color(0xff14b8a6),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff2dd4bf),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xff14b8a6),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff0d9488),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xff14b8a6),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff0d9488),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme cyan = ColorTheme(
    name: ColorNames.cyan,
    light: ColorScheme(
      primary: Color(0xff06b6d4),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff22d3ee),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xff06b6d4),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff0891b2),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xff06b6d4),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff0891b2),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme sky = ColorTheme(
    name: ColorNames.sky,
    light: ColorScheme(
      primary: Color(0xff0ea5e9),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff38bdf8),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xff0ea5e9),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff0284c7),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xff0ea5e9),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff0284c7),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme blue = ColorTheme(
    name: ColorNames.blue,
    light: ColorScheme(
      primary: Color(0xff3b82f6),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff60a5fa),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xff3b82f6),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff2563eb),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xff3b82f6),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff2563eb),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme indigo = ColorTheme(
    name: ColorNames.indigo,
    light: ColorScheme(
      primary: Color(0xff6366f1),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff818cf8),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xff6366f1),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff4f46e5),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xff6366f1),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff4f46e5),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme violet = ColorTheme(
    name: ColorNames.violet,
    light: ColorScheme(
      primary: Color(0xff8b5cf6),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffa78bfa),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xff8b5cf6),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff7c3aed),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xff8b5cf6),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff7c3aed),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme purple = ColorTheme(
    name: ColorNames.purple,
    light: ColorScheme(
      primary: Color(0xffa855f7),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffc084fc),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xffa855f7),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff9333ea),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xffa855f7),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xff9333ea),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme fuchsia = ColorTheme(
    name: ColorNames.fuchsia,
    light: ColorScheme(
      primary: Color(0xffd946ef),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffe879f9),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xffd946ef),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffc026d3),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xffd946ef),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffc026d3),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme pink = ColorTheme(
    name: ColorNames.pink,
    light: ColorScheme(
      primary: Color(0xffec4899),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xfff472b6),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xffec4899),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffdb2777),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xffec4899),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffdb2777),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );

  static const ColorTheme rose = ColorTheme(
    name: ColorNames.rose,
    light: ColorScheme(
      primary: Color(0xfff43f5e),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xfffb7185),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xff0a0a0a),
      surface: Color(0xffd4d4d4),
      onSurface: Color(0xff0a0a0a),
    ),
    dark: ColorScheme(
      primary: Color(0xfff43f5e),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffe11d48),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff171717),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff262626),
      onSurface: Color(0xfff5f5f5),
    ),
    black: ColorScheme(
      primary: Color(0xfff43f5e),
      onPrimary: Color(0xfff5f5f5),
      secondary: Color(0xffe11d48),
      onSecondary: Color(0xfff5f5f5),
      background: Color(0xff0a0a0a),
      onBackground: Color(0xfff5f5f5),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff5f5f5),
    ),
  );
}
