import 'package:kazahana/core/exports.dart';
import 'package:path/path.dart' as path;

abstract class TenkaManager {
  static late final Map<String, String> _moduleStoreMap;
  static late final Map<String, String> _storeModuleMap;

  static late final TenkaRepository repository;
  static late final Map<String, dynamic> extractors;

  static Future<void> initialize() async {
    await TenkaInternals.initialize(
      runtime: TenkaRuntimeOptions(
        http: TenkaRuntimeHttpClientOptions(
          ignoreSSLCertificate: SettingsDatabase.settings.ignoreSSLCertificate,
        ),
      ),
    );
    repository = TenkaRepository(
      baseDir: path.join(Paths.docsDir.path, 'tenka'),
    );
    await repository.initialize();
    extractors = <String, dynamic>{};
    _initializeCache();
  }

  static void _initializeCache() {
    _moduleStoreMap = <String, String>{};
    _storeModuleMap = <String, String>{};
    for (final MapEntry<String, TenkaStoreRepository> x
        in repository.installed.entries) {
      for (final TenkaMetadata y in x.value.installed.values) {
        _moduleStoreMap[y.id] = x.key;
        _storeModuleMap[x.key] = y.id;
      }
    }
  }

  static Future<void> installStore(final String storeUrl) =>
      repository.install(storeUrl);

  static Future<void> uninstallStore(final String storeUrl) =>
      repository.uninstall(storeUrl);

  static TenkaStoreRepository? findStoreFromMetadataId(
    final String metadataId,
  ) =>
      repository.installed[_moduleStoreMap[metadataId]];

  static bool isModuleInstalled(final TenkaMetadata metadata) {
    final TenkaStoreRepository? storeRepository =
        findStoreFromMetadataId(metadata.id);
    return storeRepository?.isInstalled(metadata) ?? false;
  }

  static Future<void> installModule(final TenkaMetadata metadata) async {
    final TenkaStoreRepository? storeRepository =
        findStoreFromMetadataId(metadata.id);
    if (storeRepository == null) return;
    await storeRepository.install(metadata);
  }

  static Future<void> uninstallModule(final TenkaMetadata metadata) async {
    final TenkaStoreRepository? storeRepository =
        findStoreFromMetadataId(metadata.id);
    if (storeRepository == null) return;
    await storeRepository.uninstall(metadata);
  }

  static Iterable<TenkaMetadata> allModulesIterable() sync* {
    for (final TenkaStoreRepository x in repository.installed.values) {
      yield* x.installed.values;
    }
  }

  static List<TenkaMetadata> allModules() => allModulesIterable().toList();

  static TenkaMetadata? findMetadata(final String metadataId) =>
      allModulesIterable()
          .firstWhereOrNull((final TenkaMetadata x) => x.id == metadataId);

  static Future<T> getExtractor<T>(final TenkaMetadata metadata) async {
    if (!extractors.containsKey(metadata.id)) {
      final BeizeProgramConstant program = BeizeProgramConstant.deserialize(
        (metadata.source as TenkaBase64DS).data,
      );
      final TenkaRuntimeInstance runtime =
          await TenkaRuntimeManager.create(program);
      final T extractor;
      if (T is AnimeExtractor) {
        extractor = await runtime.getAnimeExtractor() as T;
      } else if (T is MangaExtractor) {
        extractor = await runtime.getMangaExtractor() as T;
      } else {
        throw UnsupportedError('Invalid extractor type: $T');
      }
      extractors[metadata.id] = extractor;
    }
    return extractors[metadata.id] as T;
  }
}
