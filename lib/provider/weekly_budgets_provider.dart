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
  Future<void> postCreateWeeklyBudgets({
    required int budget,
  }) async {
    final response = await post("", {'budget': budget});
    print("주간 예산 생성 > $response");
  }
}
