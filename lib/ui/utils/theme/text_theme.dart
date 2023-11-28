import 'package:kazahana/core/exports.dart';

class TextTheme {
  factory TextTheme({
    required final String fontFamily,
    required final double multiplier,
  }) =>
      TextTheme._(
        heading: TextStyle(
          fontSize: headingRatio * multiplier,
          fontFamily: fontFamily,
        ),
        subheading: TextStyle(
          fontSize: subheadingRatio * multiplier,
          fontFamily: fontFamily,
        ),
        body: TextStyle(
          fontSize: bodyRatio * multiplier,
          fontFamily: fontFamily,
        ),
        caption: TextStyle(
          fontSize: captionRatio * multiplier,
          fontFamily: fontFamily,
        ),
      );

  const TextTheme._({
    required this.heading,
    required this.subheading,
    required this.body,
    required this.caption,
  });

  final TextStyle heading;
  final TextStyle subheading;
  final TextStyle body;
  final TextStyle caption;

  static const double headingRatio = 1.4;
  static const double subheadingRatio = 1.2;
  static const double bodyRatio = 1;
  static const double captionRatio = 0.8;
}
