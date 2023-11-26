import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;

abstract class Paths {
  static late final Directory dataDir;

  static Future<void> initialize() async {
    dataDir = await path_provider.getApplicationSupportDirectory();
  }
}

abstract class AssetPaths {
  static const String anilistLogo = 'assets/images/anilist_logo.png';
}
