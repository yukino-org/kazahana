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

  static Future<void> initializeLevel0() async {
    await Paths.initialize();
    await SettingsDatabase.initialize();
    await Translator.initialize();
  }

  static Future<void> initializeLevel1() async {
    await SecureDatabase.initialize();
    await CacheDatabase.initialize();
    await TenkaManager.initialize();
    await AnilistAuth.initialize();
    await InternalServer.initialize();
    MediaKit.ensureInitialized();
    ready = true;
    AppEvents.controller.add(AppEvent.initializedL1);
    await initializeLevel2();
  }

  static Future<void> initializeLevel2() async {
    await InternalDeeplink.initialize();
    AppEvents.controller.add(AppEvent.initializedL2);
  }
}
