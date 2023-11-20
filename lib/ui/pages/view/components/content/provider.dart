import 'package:kazahana/core/exports.dart';

class ViewPageContentProvider extends StatedChangeNotifier {
  ViewPageContentProvider(this.media);

  final AnilistMedia media;

  TenkaMetadata? metadata;
  dynamic extractor;

  final StatedValue<TwinTuple<SearchInfo, AnimeInfo>?> computed =
      StatedValue<TwinTuple<SearchInfo, AnimeInfo>?>();
  final StatedValue<List<SearchInfo>> searches =
      StatedValue<List<SearchInfo>>();

  Future<void> initialize() async {
    final String? lastUsedMetadataId = await getLastUsedExtractor(type);
    if (lastUsedMetadataId == null) return;
    final TenkaMetadata? lastUsedModule =
        TenkaManager.findMetadata(lastUsedMetadataId);
    if (lastUsedModule == null) return;
    await change(lastUsedModule);
  }

  Future<void> change(final TenkaMetadata nMetadata) async {
    metadata = nMetadata;
    extractor = await TenkaManager.getExtractor(nMetadata);
    notifyListeners();
    await setLastUsedExtractor(type, nMetadata.id);
    await fetch();
  }

  Future<List<SearchInfo>> search(final String terms) async {
    switch (type) {
      case TenkaType.anime:
        final AnimeExtractor extractor = await getCastedExtractor();
        return extractor.search(terms, extractor.defaultLocale);

      case TenkaType.manga:
        final MangaExtractor extractor = await getCastedExtractor();
        return extractor.search(terms, extractor.defaultLocale);
    }
  }

  Future<void> fetch() async {
    //  switch (type) {
    //    case TenkaType.anime:
    //      fetchAnime();
    //      break;
    //    case TenkaType.manga:
    //      //fetchManga();
    //      break;
    //  }
  }

  Future<void> fetchAnime() async {
    searches.waiting();
    computed.waiting();
    notifyListeners();
    final AnimeExtractor extractor = await getCastedExtractor();
    try {
      searches.finish(
        await extractor.search(
          media.titleRomaji,
          extractor.defaultLocale,
        ),
      );
    } catch (error, stackTrace) {
      searches.fail(error, stackTrace);
      computed.fail('Failed to fetch search results');
    }
    notifyListeners();
    if (searches.hasFailed) return;
    final String? lastComputedUrl = await getLastComputed(
      type: type,
      metadataId: metadata!.id,
      mediaId: media.id,
    );
    final dynamic computedSearchInfo = (lastComputedUrl != null
            ? searches.value.firstWhereOrNull(
                (final SearchInfo x) => x.url == lastComputedUrl,
              )
            : null) ??
        searches.value.firstOrNull;
    if (computedSearchInfo == null) {
      computed.fail('Failed to find valid result');
    }

    try {
      searches.finish(
        await extractor.search(
          media.titleRomaji,
          extractor.defaultLocale,
        ),
      );
    } catch (error) {
      computed.fail('Failed to fetch search results');
    }
    notifyListeners();
  }

  T getCastedExtractor<T>() => extractor as T;

  TenkaType get type => media.type.asTenkaType;

  List<TenkaMetadata> get modules => TenkaManager.allModules();

  static String getLastUsedExtractorKey(final TenkaType type) =>
      'view_last_used_${type.name}_extractor';

  static Future<String?> getLastUsedExtractor(
    final TenkaType type,
  ) async {
    final String? value =
        await CacheDatabase.get<String?>(getLastUsedExtractorKey(type));
    return value;
  }

  static Future<void> setLastUsedExtractor(
    final TenkaType type,
    final String metadataId,
  ) async {
    await CacheDatabase.set(getLastUsedExtractorKey(type), metadataId);
  }

  static String getLastComputedKey({
    required final TenkaType type,
    required final String metadataId,
    required final int mediaId,
  }) =>
      'view_last_computed_${type.name}_${metadataId}_$mediaId';

  static Future<String?> getLastComputed({
    required final TenkaType type,
    required final String metadataId,
    required final int mediaId,
  }) async =>
      CacheDatabase.get<String?>(
        getLastComputedKey(
          type: type,
          metadataId: metadataId,
          mediaId: mediaId,
        ),
      );

  static Future<void> setLastComputed({
    required final TenkaType type,
    required final String metadataId,
    required final int mediaId,
    required final int url,
  }) async {
    await CacheDatabase.set(
      getLastComputedKey(
        type: type,
        metadataId: metadataId,
        mediaId: mediaId,
      ),
      url,
    );
  }
}
