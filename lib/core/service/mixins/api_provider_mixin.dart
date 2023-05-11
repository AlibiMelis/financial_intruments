import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

mixin ApiProviderMixin {
  Future<dynamic> provideData({required String endPoint, Map<String, dynamic>? param, dynamic body, bool patch = false}) async {
    final headers = {
      'Accept': 'application/json',
      if (body is String || body == null) 'Content-Type': 'application/json',
    };
    final httpClient = http.Client();
    final urlBuffer = StringBuffer(endPoint);

    try {
      http.Response response;
      if (body == null) {
        if (param != null) {
          for (final e in param.entries) {
            urlBuffer.write(param.entries.first.key == e.key ? '?' : '&');
            if (e.value is List) {
              urlBuffer.write((e.value as List).map((x) => '${e.key}=$x').toList().join('&'));
            } else {
              urlBuffer.write('${e.key}=${e.value}');
            }
          }
        }
        final url = urlBuffer.toString();
        response = await httpClient.get(Uri.parse(url), headers: headers).timeout(const Duration(seconds: 12));
      } else {
        if (patch) {
          response = await httpClient.patch(Uri.parse(endPoint), headers: headers, body: body).timeout(const Duration(seconds: 30));
        } else if (body is File) {
          final request = http.MultipartRequest("POST", Uri.parse(endPoint))..files.add(await http.MultipartFile.fromPath('file', body.path));
          response = await http.Response.fromStream(await request.send());
        } else {
          response = await httpClient
              .post(
                Uri.parse(endPoint),
                headers: headers,
                body: body,
              )
              .timeout(const Duration(seconds: 12));
        }
      }
      final responseBody = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 || response.statusCode == 201) {
        return responseBody;
      }
      throw Exception(responseBody['message'] ?? 'Unknown Error');
    } on TimeoutException catch (_) {
      throw Exception('Connection timed out. Try again');
    } on SocketException catch (_) {
      throw Exception('Check network connection');
    } on Exception {
      rethrow;
    } finally {
      httpClient.close();
    }
  }
}
