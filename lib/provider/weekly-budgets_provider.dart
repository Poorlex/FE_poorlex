import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/schema/weekly_budget_left_response/weekly_budget_left_response.dart';
import 'package:poorlex/schema/weekly_budget_response/weekly_budget_response.dart';

class WeeklyBudgetsProvider extends GetConnect {
  final user = Get.find<UserController>();
  @override
  void onInit() {
    // prefix "/weekly-budgets" 적용
    httpClient.baseUrl = "${dotenv.get('SERVER_URL')}/weekly-budgets";

    /// [TODO] header에 token 잘 들어가는지 확인 필요
    httpClient.addRequestModifier<Object?>((request) {
      final token = user.userToken().token;
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

  /// 주간 예산 생성
  Future<void> postCreateWeeklyBudgets({
    required int budget,
  }) async {
    final response = await post("", {'budget': budget});
    print("주간 예산 생성 > $response");
  }

  /// 요청 날짜 포함 주간 예산 남은 금액 조회
  Future<WeeklyBudgetLeftResponse?> getLeftWeeklyBudgets() async {
    final response = await get(
      "/left",
      decoder: (data) => WeeklyBudgetLeftResponse.fromJson(data),
    );
    return response.body;
  }
}
