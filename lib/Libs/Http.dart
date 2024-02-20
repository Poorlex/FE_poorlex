import 'dart:convert';
import "dart:io";

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HTTPModel {
  HTTPModel(Map<String, dynamic> json);
}

fromJson<T extends HTTPModel> (Map<String, dynamic> json) {
  return HTTPModel(json);
}

enum Methods { get, post, put, delete }
class HTTPResult<T> {
  late bool success;
  late T? body;
  late dynamic error;
  HTTPResult({
    required success,
    body, error
  });
}

class HTTP {
  late final Function setToast;
  HTTP (
  // {
    // required this.setToast
  // }
  );

  Future<HTTPResult<HTTPModel>> request<T> ({
    required Methods method,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    late final b;
    late final r;
    late final rsb;
    final Map<String, String> h = {
      'Content-Type': 'application/json; charset=UTF-8',
      ...(headers ?? {})
    };

    switch(method){
      case Methods.get: r = http.get;
      case Methods.post: r = http.post;
      case Methods.put: r = http.put;
      case Methods.delete: r = http.delete;
    }

    if (body != null) {
      if (h['Content-Type']!.contains('application/json')) b = jsonEncode(body);
      else b = body;
    }

    try {
      http.Response rs = await r(
          Uri.parse(url.contains('https://') ? url : '${dotenv.get('SERVER_URL')}${url}'),
          headers: h,
          body: b
      );

      if (rs.headers['Content-Type']!.contains('application/json')) {
        rsb = fromJson(jsonDecode(rs.body));
      } else rsb = rs.body;

      return HTTPResult(
        success: true,
        body: rsb
      );
    } catch (error) {
      // setToast();
      return HTTPResult(
        success: false,
        error: error
      );
    }
  }
}