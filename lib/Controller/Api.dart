import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Methods { get, post, put, delete }
class HTTPResult<T> {
  late bool success;
  late T? body;
  late dynamic error;

  HTTPResult({
    required this.success,
    body, error
  }) {
    this.body = body;
    this.error = error;
  }
}

class ApiController extends GetxController {
  final token = ''.obs;

  void updateToken(String token) {
    this.token.value = token;
    update();
  }

  Future<HTTPResult<dynamic>> request ({
    required Methods method,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    var b = null;
    late final rsb;
    late http.Response rs;

    final Map<String, String> h = {
      'Content-Type': 'application/json; charset=UTF-8',
      ...(headers ?? {})
    };

    print(token.value);
    if (token.value != '') {
      h['Authorization'] = 'Bearer ${token.value}';
    }

    try {
      if (body != null) {
        if (h['Content-Type']!.contains('application/json')) b = jsonEncode(body);
        else b = body;
      }
      switch(method){
        case Methods.get:
          rs = await http.get(
            Uri.parse(url.contains('https://') ? url : '${dotenv.get('SERVER_URL')}${url}'),
            headers: h,
          );
        case Methods.post:
          rs = await http.post(
            Uri.parse(url.contains('https://') ? url : '${dotenv.get('SERVER_URL')}${url}'),
            headers: h,
            body: b
          );
        case Methods.put:
          rs = await http.put(
            Uri.parse(url.contains('https://') ? url : '${dotenv.get('SERVER_URL')}${url}'),
            headers: h,
            body: b
          );
        case Methods.delete: rs = await http.delete(
            Uri.parse(url.contains('https://') ? url : '${dotenv.get('SERVER_URL')}${url}'),
            headers: h
        );
      }

      if (rs.headers['content-type']!.contains('application/json')) rsb = jsonDecode(utf8.decode(rs.bodyBytes));
      else rsb = utf8.decode(rs.bodyBytes);

      print(url);
      print(rs.body);

      return HTTPResult(
          success: true,
          body: rsb
      );
    } catch (error) {
      // setToast();
      print('error start');
      print(error);
      print('error end');
      return HTTPResult(
          success: false,
          error: error
      );
    }
  }
}