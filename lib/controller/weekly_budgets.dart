import 'package:get/get.dart';
import 'package:poorlex/provider/weekly_budgets_provider.dart';
import 'package:poorlex/schema/weekly_budget_left_response/weekly_budget_left_response.dart';
import 'package:poorlex/schema/weekly_budget_response/weekly_budget_response.dart';

class WeeklyBudgetsController extends GetxController {
  final WeeklyBudgetsProvider weeklyBudgetsProvider;

  WeeklyBudgetsController({
    required this.weeklyBudgetsProvider,
  });

  final Rx<WeeklyBudgetResponse> weeklyBudget = WeeklyBudgetResponse(
    exist: false,
    amount: 0,
    daysBeforeEnd: 0,
  ).obs;

  final Rx<WeeklyBudgetLeftResponse> weeklyBudgetLeft =
      WeeklyBudgetLeftResponse(
    exist: false,
    amount: 0,
  ).obs;

  /// 요청 날짜 포함 주간 예산 조회
  Future<void> getWeeklyBudgets() async {
    try {
      final response = await weeklyBudgetsProvider.getWeeklyBudgets();
      weeklyBudget(response);
    } catch (e) {
      print(e);
    }
  }

  /// 요청 날짜 포함 주간 예산 남은 금액 조회
  Future<void> getLeftWeeklyBudgets() async {
    try {
      final response = await weeklyBudgetsProvider.getLeftWeeklyBudgets();
      weeklyBudgetLeft(response);
    } catch (e) {
      print(e);
    }
  }

  /// 주간 예산 생성
  Future<void> postCreateWeeklyBudgets({
    required int budget,
  }) async {
    try {
      await weeklyBudgetsProvider.postCreateWeeklyBudgets(
        budget: budget,
      );
    } catch (e) {
      print(e);
    }
  }
}
