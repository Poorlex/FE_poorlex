import 'package:get/get.dart';
import 'package:poorlex/controller/battle.dart';

class BattleBind extends Bindings {
  @override
  void dependencies() {
    Get.put(
      BattleController(
        battlesProvider: Get.find(),
        layout: Get.find(),
        imagePickerController: Get.find(),
      ),
      permanent: true,
    );
  }
}
