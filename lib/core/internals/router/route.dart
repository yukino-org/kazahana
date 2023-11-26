class InternalRouteRequest {
  const InternalRouteRequest({
    required this.path,
    required this.queries,
    required this.hash,
  });

  factory InternalRouteRequest.fromUri(final Uri uri) => InternalRouteRequest(
        path: uri.path,
        queries: uri.queryParameters,
        hash: uri.fragment,
      );

  factory InternalRouteRequest.fromRawPath(final String path) =>
      InternalRouteRequest.fromUri(Uri.parse('http://localhost$path'));

  final String path;
  final Map<String, String> queries;
  final String hash;
}

abstract class InternalRoute {
  bool matches(final InternalRouteRequest req);
  Future<void> handle(final InternalRouteRequest req);
}
