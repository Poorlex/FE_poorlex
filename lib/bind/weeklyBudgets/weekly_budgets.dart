import 'package:get/get.dart';
import 'package:poorlex/controller/weekly_budgets.dart';

class WeeklyBudgetsBind extends Bindings {
  @override
  void dependencies() {
    Get.put(
      WeeklyBudgetsController(
        weeklyBudgetsProvider: Get.find(),
      ),
      permanent: true,
    );
  }
}
