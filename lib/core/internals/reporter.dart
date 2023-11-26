import 'package:kazahana/core/internals/server.dart';
import 'package:shared/http.dart' as http;

abstract class InternalReporter {
  static Future<bool> report(final String route) async {
    try {
      final Uri uri = Uri.parse('${InternalServer.origin}$route');
      final http.Response resp = await http.client.get(uri);
      return resp.statusCode == InternalServer.successCode;
    } catch (_) {
      return false;
    }
  }
}
