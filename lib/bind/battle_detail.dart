import 'package:get/get.dart';
import 'package:poorlex/controller/battle_detail.dart';
import 'package:poorlex/provider/battles_provider.dart';

class BattleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BattlesProvider(
        user: Get.find(),
      ),
    );
    Get.put(
      BattleDetailController(
        battlesProvider: Get.find(),
        layout: Get.find(),
      ),
    );
  }
}
