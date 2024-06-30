import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/schema/weekly_budget_left_response/weekly_budget_left_response.dart';
import 'package:poorlex/schema/weekly_budget_response/weekly_budget_response.dart';

class WeeklyBudgetsProvider extends GetConnect {
  @override
  void onInit() {
    // prefix "/weekly-budgets" 적용
    httpClient.baseUrl = "${dotenv.get('SERVER_URL')}/weekly-budgets";

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
        '\n### URL: ${request.url}'
        '\n### Header : ${request.headers}'
        '\n### RESPONSE BODY: ${response.body}',
      );
      return response;
    });
  }

  /// 요청 날짜 포함 주간 예산 조회
  Future<WeeklyBudgetResponse?> getWeeklyBudgets() async {
    final response = await get(
      "",
      decoder: (data) => WeeklyBudgetResponse.fromJson(data),
    );
    return response.body;
  }

  /// 요청 날짜 포함 주간 예산 남은 금액 조회
  Future<WeeklyBudgetLeftResponse?> getLeftWeeklyBudgets() async {
    final response = await get(
      "/left",
      decoder: (data) => WeeklyBudgetLeftResponse.fromJson(data),
    );
    return response.body;
  }

  /// 주간 예산 생성
  Future<bool> postCreateWeeklyBudgets({
    required int budget,
  }) async {
    try {
      final response = await post("", {'budget': budget});
      print("주간 예산 생성 > ${response.statusCode}");
      return response.statusCode == 201;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// 주간 예산 수정
  Future<bool> putCreateWeeklyBudgets({
    required int budget,
  }) async {
    try {
      final response = await put("", {'budget': budget});
      print("주간 예산 수정 > ${response.statusCode}");
      return response.statusCode == 204;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
