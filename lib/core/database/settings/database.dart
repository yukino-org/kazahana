import 'dart:async';
import 'dart:convert';
import 'package:kazahana/core/app/events.dart';
import 'package:kazahana/core/database/settings/schema.dart';
import 'package:kazahana/core/paths.dart';
import 'package:kazahana/core/utils/exports.dart';
import 'package:path/path.dart' as path;
import 'package:perks/perks.dart';

abstract class SettingsDatabase {
  static final PerksFileAdapter adapter =
      PerksFileAdapter(path.join(Paths.dataDir.path, 'settings.db'));

  static bool ready = false;
  static late SettingsSchema settings;

  static Future<void> initialize() async {
    final String content = await adapter.read();
    settings = content.isNotEmpty
        ? SettingsSchema.fromJson(json.decode(content) as JsonMap)
        : SettingsSchema();
    ready = true;
    AppEvents.controller.add(AppEvent.settingsChange);
  }

  static Future<void> save() async {
    await adapter.write(json.encode(settings.toJson()));
    AppEvents.controller.add(AppEvent.settingsChange);
  }
}
