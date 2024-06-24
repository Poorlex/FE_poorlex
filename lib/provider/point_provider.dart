import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/schema/point_level_bar_response/point_level_bar_response.dart';
import 'package:poorlex/schema/point_response/point_response.dart';

class PointProvider extends GetConnect {
  @override
  void onInit() {
    // prefix "/point" 적용
    httpClient.baseUrl = "${dotenv.get('SERVER_URL')}/point";

    httpClient.addRequestModifier<Object?>((request) {
      final user = Get.find<UserController>();
      final token = user.userToken;
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      // bodyBytes가 Stream<List<int>> 타입이므로 이를 읽어와서 처리합니다.
      final bodyBytes = await request.bodyBytes.toList();
      if (bodyBytes.isNotEmpty) {
        final bodyString = utf8.decode(bodyBytes.expand((x) => x).toList());
        print('##### REQUEST BODY: $bodyString'); // 요청의 body를 로그로 출력
      }
      print(
        '### REQUEST [method: ${request.method}]'
        '\nURL: ${request.url}'
        '\n${"Header : ${request.headers}"}'
        '\n ### RESPONSE BODY: ${response.body}',
      );
      return response;
    });
  }

  // 회원 포인트, 레벨 조회
  Future<PointResponse?> getPoint() async {
    final response = await get(
      "",
      decoder: (data) => PointResponse.fromJson(data),
    );
    return response.body;
  }

  // 회원 레벨바 관련 포인트 조회
  Future<PointLevelBarResponse?> getPointLevelBar() async {
    final response = await get(
      "/level-bar",
      decoder: (data) => PointLevelBarResponse.fromJson(data),
    );
    return response.body;
  }
}
