import 'package:get/get.dart';

import '../Models/battle_model.dart';

class BattleController extends GetxController {
  final battleIndex = BattleModel().obs;

  void changeBattleIndex(int number) {
    battleIndex.update(
      (val) => val?.PageNumber = number,
    );
  }

  void changeBattleMoneyIndex(int number) {
    battleIndex.update((val) => val?.MoneyIndex = number);
  }
}
