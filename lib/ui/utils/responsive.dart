import 'package:kazahana/core/exports.dart';

class Responsive extends InheritedWidget {
  const Responsive({
    required this.data,
    required super.child,
    super.key,
  });

  factory Responsive.of(final BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Responsive>()!;

  final ResponsiveData data;

  @override
  bool updateShouldNotify(final Responsive oldWidget) =>
      oldWidget.data != data && oldWidget.data != data;
}

class ResponsiveData {
  const ResponsiveData({
    required this.multiplier,
    required this.screen,
  });

  factory ResponsiveData.fromSettingsNoResponsive() =>
      ResponsiveData(multiplier: getScaleMultiplier(), screen: Size.zero);

  final double multiplier;
  final Size screen;

  double scale(
    final double any, {
    final double? sm,
    final double? md,
    final double? lg,
    final double? xl,
  }) =>
      scaleRatio * value(any, sm: sm, md: md, lg: lg, xl: xl);

  T value<T>(
    final T any, {
    final T? sm,
    final T? md,
    final T? lg,
    final T? xl,
  }) =>
      switch (screen.width) {
        > xlWidth when xl != null => xl,
        > lgWidth when lg != null => lg,
        > mdWidth when md != null => md,
        > smWidth when sm != null => sm,
        _ => any,
      };

  T builder<T>(
    final T Function() any, {
    final T Function()? sm,
    final T Function()? md,
    final T Function()? lg,
    final T Function()? xl,
  }) =>
      switch (screen.width) {
        > xlWidth when xl != null => xl(),
        > lgWidth when lg != null => lg(),
        > mdWidth when md != null => md(),
        > smWidth when sm != null => sm(),
        _ => any(),
      };

  ResponsiveData copyWith({
    final double? multiplier,
    final Size? screen,
  }) =>
      ResponsiveData(
        multiplier: multiplier ?? this.multiplier,
        screen: screen ?? this.screen,
      );

  static const double scaleRatio = 14;
  static const double defaultScaleMultiplier = 1;

  static const double smWidth = 640;
  static const double mdWidth = 768;
  static const double lgWidth = 1024;
  static const double xlWidth = 1280;

  static double getScaleMultiplier() => SettingsDatabase.ready
      ? SettingsDatabase.settings.scaleMultiplier
      : defaultScaleMultiplier;

  static Size getScreenSize(final BuildContext context) =>
      MediaQuery.of(context).size;
}

extension ResponsiveUtils on BuildContext {
  ResponsiveData get r => Responsive.of(this).data;
}
