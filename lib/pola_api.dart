import 'dart:convert';
import 'package:http/http.dart' as http;

class PolaApi {
  static const _base = 'https://www.pola-app.pl/a/v4/get_by_code';
  static const _deviceId = 'pola_barcodes';

  final http.Client _client;

  PolaApi({http.Client? client}) : _client = client ?? http.Client();

  Future<dynamic> getByCode(String code) async {
    final uri = Uri.parse(_base).replace(queryParameters: {
      'code': code,
      'device_id': _deviceId,
    });
    final response = await _client.get(uri);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException(
        'HTTP ${response.statusCode}',
        response.body,
      );
    }
    return jsonDecode(utf8.decode(response.bodyBytes));
  }
}

class HttpException implements Exception {
  final String message;
  final String body;
  HttpException(this.message, this.body);

  @override
  String toString() => message;
}
