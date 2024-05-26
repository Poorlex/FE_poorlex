import 'package:get/get.dart';
import 'package:poorlex/controller/modify_battle.dart';
import 'package:poorlex/provider/battles_provider.dart';

class ModifyBattleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BattlesProvider(
        user: Get.find(),
      ),
    );
    Get.put(
      ModifyBattleController(
        battlesProvider: Get.find(),
        layout: Get.find(),
        imagePickerController: Get.find(),
      ),
    );
  }
}
