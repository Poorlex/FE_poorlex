import 'package:get/get.dart';
import 'package:poorlex/controller/modify_battle.dart';

class ModifyBattleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ModifyBattleController(
        battlesProvider: Get.find(),
        layout: Get.find(),
        imagePickerController: Get.find(),
      ),
    );
  }
}
