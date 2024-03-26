import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/Controller/Layout.dart';
import 'package:poorlex/Models/Common.dart';

import 'package:poorlex/Libs/Theme.dart';

enum Methods { get, post, put, delete, patch }

class HTTPResult<T> {
  late bool success;
  late T? body;
  late dynamic error;

  HTTPResult({required this.success, body, error}) {
    this.body = body;
    this.error = error;
  }
}

class ApiController extends GetxController {
  final layout = Get.find<LayoutController>();
  final token = ''.obs;

  void updateToken(String token) {
    this.token.value = token;
    update();
  }

  Future<HTTPResult<dynamic>> requestMultipart({
    required Methods method,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, List<XFile>>? files,
  }) async {
    late final rsb;
    late http.StreamedResponse rs;

    final Map<String, String> h = headers ?? {};
    print(token.value);
    if (token.value != '') {
      h['Authorization'] = 'Bearer ${token.value}';
    }
    try {
      var request = new http.MultipartRequest(
          method == Methods.post
              ? 'POST'
              : method == Methods.put
                  ? 'PUT'
                  : 'PATCH',
          Uri.parse(url.contains('https://')
              ? url
              : '${dotenv.get('SERVER_URL')}${url}'));
      h.forEach((key, value) {
        request.headers[key] = value;
      });
      body?.forEach((key, value) {
        request.fields[key] = value;
      });
      print(request.fields);
      files?.forEach((key, file) async {
        file.forEach((f) async {
          request.files.add(await http.MultipartFile.fromPath(key, f.path));
        });
      });
      rs = await request.send();

      /*
      if (rs.headers['content-type'] != null) {
        if (rs.headers['content-type']!.contains('application/json')) {
          rsb = jsonDecode(String.fromCharCodes(await rs.stream.toBytes()));
        } else
          // rsb = utf8.decode(rs.bodyBytes);
      } else
        // rsb = utf8.decode(rs.bodyBytes);
       */

      // print(rs.headers);
      // print(rs.headers['content-type']);
      print(rs);
      rsb = await rs.stream.bytesToString();
      print(url);
      print(rsb);

      return HTTPResult(success: true, body: rsb);
    } catch (error) {
      // setToast();
      print('error start');
      print(error);
      print('error end');
      return HTTPResult(success: false, error: error);
    }
  }

  Future<HTTPResult<dynamic>> request({
    required Methods method,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, http.MultipartFile>? files,
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
        if (h['Content-Type']!.contains('application/json'))
          b = jsonEncode(body);
        else
          b = body;
      }
      switch (method) {
        case Methods.get:
          rs = await http.get(
            Uri.parse(url.contains('https://')
                ? url
                : '${dotenv.get('SERVER_URL')}${url}'),
            headers: h,
          );
        case Methods.post:
          rs = await http.post(
              Uri.parse(url.contains('https://')
                  ? url
                  : '${dotenv.get('SERVER_URL')}${url}'),
              headers: h,
              body: b);
        case Methods.put:
          rs = await http.put(
              Uri.parse(url.contains('https://')
                  ? url
                  : '${dotenv.get('SERVER_URL')}${url}'),
              headers: h,
              body: b);
        case Methods.patch:
          rs = await http.patch(
              Uri.parse(url.contains('https://')
                  ? url
                  : '${dotenv.get('SERVER_URL')}${url}'),
              headers: h,
              body: b);
        case Methods.delete:
          rs = await http.delete(
              Uri.parse(url.contains('https://')
                  ? url
                  : '${dotenv.get('SERVER_URL')}${url}'),
              headers: h);
      }

      if (rs.headers['content-type'] != null) {
        if (rs.headers['content-type']!.contains('application/json'))
          rsb = jsonDecode(utf8.decode(rs.bodyBytes));
        else
          rsb = utf8.decode(rs.bodyBytes);
      } else
        rsb = utf8.decode(rs.bodyBytes);

      print(url);
      print(rs.statusCode);

      if (rs.statusCode < 300) {
        print(rs.body);
        return HTTPResult(success: true, body: rsb);
      } else {
        layout.setAlert(Alert(
            isOpen: true,
            body: Text(rsb['message'], style: CTextStyles.Title3())));
        return HTTPResult(success: false, error: rsb);
      }
    } catch (error) {
      // setToast();
      print('error start');
      print(error);
      print('error end');
      return HTTPResult(success: false, error: error);
    }
  }
}
