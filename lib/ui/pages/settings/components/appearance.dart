import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/settings/components/tiles/exports.dart';

class ApperanceSettings extends StatefulWidget {
  const ApperanceSettings({
    super.key,
  });

  @override
  State<ApperanceSettings> createState() => _ApperanceSettingsState();
}

class _ApperanceSettingsState extends State<ApperanceSettings> {
  Future<void> saveSettings() async {
    await SettingsDatabase.save();
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(final BuildContext context) => SettingsBodyWrapper(
        child: Column(
          children: <Widget>[
            MultiChoiceListTile<String>(
              title: Text(context.t.accentColor),
              secondary: const Icon(Icons.format_color_fill_rounded),
              value: SettingsDatabase.settings.primaryColor ??
                  ThemerThemeData.defaultForegroundName,
              items: ForegroundColors.names().asMap().map(
                    (final _, final String name) => MapEntry<String, Widget>(
                      name,
                      Text(ForegroundColors.getTitleCase(context.t, name)),
                    ),
                  ),
              onChanged: (final String value) {
                SettingsDatabase.settings.primaryColor = value;
                saveSettings();
              },
            ),
            SwitchListTile(
              title: Text(context.t.useSystemTheme),
              secondary: const Icon(Icons.highlight_rounded),
              value: SettingsDatabase.settings.useSystemTheme,
              onChanged: (final bool value) {
                SettingsDatabase.settings.useSystemTheme = value;
                saveSettings();
              },
            ),
            SwitchListTile(
              title: Text(context.t.darkMode),
              secondary: AnimatedSwitcher(
                duration: AnimationDurations.defaultNormalAnimation,
                child: Icon(
                  SettingsDatabase.settings.darkMode
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                  key: UniqueKey(),
                ),
              ),
              value: SettingsDatabase.settings.darkMode,
              onChanged: SettingsDatabase.settings.useSystemTheme
                  ? null
                  : (final bool value) {
                      SettingsDatabase.settings.darkMode = value;
                      saveSettings();
                    },
            ),
            CheckboxListTile(
              title: Text(context.t.disableAnimations),
              secondary: const Icon(Icons.animation_rounded),
              value: SettingsDatabase.settings.disableAnimations,
              onChanged: (final bool? value) {
                if (value == null) return;
                SettingsDatabase.settings.disableAnimations = value;
                saveSettings();
              },
            ),
          ],
        ),
      );
}
