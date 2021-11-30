import 'package:http/http.dart' as http;

class RemoteRepository {
  Future<http.Response> postApi(
    String url,
    String body,
  ) async {
    final response = await http.post(Uri.parse(url), body: body);

    return response;
  }

  Future<http.Response> apiWithHeader(
    String url,
    String? body,
    Map<String, String> header,
  ) async {
    final response = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );

    return response;
  }

  Future<http.Response> getApi(
    String url,
    Map<String, String> header,
  ) async {
    final response = await http.get(
      Uri.parse(url),
      headers: header,
    );

    return response;
  }
}
