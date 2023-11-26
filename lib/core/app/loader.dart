import 'package:kazahana/core/anilist/exports.dart';
import 'package:kazahana/core/app/events.dart';
import 'package:kazahana/core/database/exports.dart';
import 'package:kazahana/core/internals/exports.dart';
import 'package:kazahana/core/paths.dart';
import 'package:kazahana/core/tenka/exports.dart';
import 'package:kazahana/core/translator/exports.dart';
import 'package:media_kit/media_kit.dart';

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
    await InternalServer.initialize();
    MediaKit.ensureInitialized();
    ready = true;
    AppEvents.controller.add(AppEvent.initialized);
    await initializeAfterLoad();
  }

  static Future<void> initializeAfterLoad() async {
    await InternalDeeplink.initializeAfterLoad();
    AppEvents.controller.add(AppEvent.afterInitialized);
  }
}
