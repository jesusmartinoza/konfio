import 'dart:convert';
import 'package:http/http.dart' as http;

class APIClient {
  static const String host = 'jsonblob.com';

  Future<dynamic> request(String endpoint,
      {String method = 'GET',
      Map<String, String>? headers,
      Map<String, String>? queryParameters,
      Map<String, String>? body}) async {
    final uri = Uri.https(host, endpoint, queryParameters);
    var request = http.Request(method, uri);

    if (headers != null) {
      request.headers.addAll(headers);
    }

    if (body != null) {
      request.body = jsonEncode(body);
    }

    final response = await http.Response.fromStream(await request.send());

    return await json.decode(utf8.decode(response.bodyBytes));
  }
}
