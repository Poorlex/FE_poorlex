import 'package:get/get.dart';
import 'package:poorlex/controller/api.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/controller/image_picker.dart';
import 'package:poorlex/controller/layout.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/provider/battles_provider.dart';
import 'package:poorlex/provider/expenditures_provider.dart';
import 'package:poorlex/provider/login_provider.dart';
import 'package:poorlex/provider/member_provider.dart';

class RootBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginProvider());
    Get.lazyPut(() => MemberProvider());
    Get.lazyPut(() => ExpendituresProvider());
    Get.lazyPut(() => BattlesProvider());

    Get.put(ImagePickerController(), permanent: true);
    Get.put(LayoutController(), permanent: true);
    Get.put(ApiController(), permanent: true);
    Get.put(
      UserController(
        memberProvider: Get.find(),
        expendituresProvider: Get.find(),
        loginProvider: Get.find(),
      ),
      permanent: true,
    );
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
