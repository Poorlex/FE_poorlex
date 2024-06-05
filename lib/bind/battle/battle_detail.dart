import 'package:get/get.dart';
import 'package:poorlex/controller/battle_detail.dart';

class BattleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      BattleDetailController(
        battlesProvider: Get.find(),
        layout: Get.find(),
      ),
    );
  }
}
