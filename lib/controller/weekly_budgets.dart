import 'package:get/get.dart';
import 'package:poorlex/models/weeklyBudget.dart';
import 'package:poorlex/provider/weekly_budgets_provider.dart';
import 'package:poorlex/schema/weekly_budget_left_response/weekly_budget_left_response.dart';
import 'package:poorlex/schema/weekly_budget_response/weekly_budget_response.dart';

class WeeklyBudgetsController extends GetxController {
  final WeeklyBudgetsProvider weeklyBudgetsProvider;

  WeeklyBudgetsController({
    required this.weeklyBudgetsProvider,
  });

  final _createWeeklyBudgets = WeeklyBudgetCreateModel().obs;
  WeeklyBudgetCreateModel get createWeeklyBudget => _createWeeklyBudgets.value;

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

  void initCreateWeeklyBudget() {
    _createWeeklyBudgets(WeeklyBudgetCreateModel());
  }

  void changeBudget(int budget) {
    _createWeeklyBudgets.update((val) {
      val?.budget = budget;
    });
  }

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
  Future<bool> postCreateWeeklyBudgets({
    required int budget,
  }) async {
    try {
      final result = await weeklyBudgetsProvider.postCreateWeeklyBudgets(
        budget: budget,
      );
      return result;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
