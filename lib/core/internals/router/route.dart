class InternalRouteUri {
  const InternalRouteUri({
    required this.path,
    required this.queries,
    required this.hash,
  });

  factory InternalRouteUri.fromUri(final Uri uri) => InternalRouteUri(
        path: uri.path,
        queries: uri.queryParameters,
        hash: uri.fragment,
      );

  factory InternalRouteUri.fromRawPath(final String path) =>
      InternalRouteUri.fromUri(Uri.parse('http://localhost$path'));

  final String path;
  final Map<String, String> queries;
  final String hash;

  @override
  String toString() {
    final StringBuffer output = StringBuffer(path);
    if (queries.isNotEmpty) {
      output.write('?');
      queries.forEach((final String k, final String v) {
        output.write('$k=${Uri.encodeQueryComponent(v)}');
      });
    }
    if (hash.isNotEmpty) {
      output.write('#${Uri.encodeQueryComponent(hash)}');
    }
    return output.toString();
  }
}

abstract class InternalRoute {
  bool matches(final InternalRouteUri uri);
  Future<void> handle(final InternalRouteUri uri);
}
