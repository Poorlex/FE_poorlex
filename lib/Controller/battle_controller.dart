import 'dart:ui';

import 'package:get/get.dart';

import '../Models/battle_model.dart';

class BattleController extends GetxController {
  final battleIndex = BattleModel().obs;
  final battleMakingIndex = BattleMakingModel().obs;
  Rx<Color> EasyButtonColor = Color(0xffffd700).obs;
  Rx<Color> MiddleButtonColor = Color(0xff999999).obs;
  Rx<Color> HardButtonColor = Color(0xff999999).obs;
  RxList<int> BudgetList = <int>[15, 16, 17, 18, 19, 20].obs;
  Rx<int> selectedBudget = 0.obs;
  Rx<Color> budgetColor = Color(0xff999999).obs;

  void changeBattleIndex(int number) {
    battleIndex.update(
      (val) => val?.PageNumber = number,
    );
  }

  void changeBattleMoneyIndex(int number) {
    battleIndex.update((val) => val?.MoneyIndex = number);
  }

  void changeBattleMakingIndex() {
    battleMakingIndex.update((val) {
      val?.BattleIndex += 1;
    });
  }

  void changeBattleDifficulty(String selected) {
    battleMakingIndex.update((val) {
      val?.BattleDifficulty = selected;
    });
  }

  void changeButtonColor() {
    if (battleMakingIndex().BattleDifficulty == 'Easy') {
      EasyButtonColor.value = Color(0xffffd600);
      MiddleButtonColor.value = Color(0xff999999);
      HardButtonColor.value = Color(0xff999999);
    } else if (battleMakingIndex().BattleDifficulty == 'Middle') {
      EasyButtonColor.value = Color(0xff999999);
      MiddleButtonColor.value = Color(0xffffd600);
      HardButtonColor.value = Color(0xff999999);
    } else if (battleMakingIndex().BattleDifficulty == 'Hard') {
      EasyButtonColor.value = Color(0xff999999);
      MiddleButtonColor.value = Color(0xff999999);
      HardButtonColor.value = Color(0xffffd600);
    }
  }

  void budgetListUpdate() {
    if (battleMakingIndex().BattleDifficulty == 'Easy') {
      BudgetList.assignAll([15, 16, 17, 18, 19, 20]);
    } else if (battleMakingIndex().BattleDifficulty == 'Middle') {
      BudgetList.assignAll([9, 10, 11, 12, 13, 14]);
    } else if (battleMakingIndex().BattleDifficulty == 'Hard') {
      BudgetList.assignAll([1, 2, 3, 4, 5, 6, 7, 8]);
    }
  }

  void budgetUpdate(int selected) {
    selectedBudget.value = selected;
  }

  void changeBudgetColor(Color itemColor) {
    budgetColor.value = itemColor;
  }
}
