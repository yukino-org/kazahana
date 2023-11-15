import 'package:kazahana/core/anilist/exports.dart';
import 'package:kazahana/core/app/events.dart';
import 'package:kazahana/core/database/exports.dart';
import 'package:kazahana/core/internals/exports.dart';
import 'package:kazahana/core/paths.dart';
import 'package:kazahana/core/tenka/exports.dart';
import 'package:kazahana/core/translator/exports.dart';

abstract class AppLoader {
  static bool ready = false;

  static Future<void> initialize() async {
    await Paths.initialize();
    await SettingsDatabase.initialize();
    await SecureDatabase.initialize();
    await CacheDatabase.initialize();
    await TenkaManager.initialize();
    await Translator.initialize();
    await AnilistAuth.initialize();
    ready = true;
    AppEvents.controller.add(AppEvent.initialized);
    initializeAfterLoad();
  }

  static Future<void> initializeAfterLoad() async {
    await Deeplink.initializeAfterLoad();
    AppEvents.controller.add(AppEvent.afterAnitialized);
  }
}
