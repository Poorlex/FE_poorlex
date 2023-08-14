import 'package:get/get.dart';
import '../Models/login_model.dart';
import '../Screen/main_page.dart';

class UserController extends GetxController {
  final userInfo = UserInfo().obs;

  void userUpdate(dynamic user) {
    userInfo.update((val) {
      val?.userId = user?.id as String;
      val?.userName = user?.properties['nickname'];
    });
  }

  void userUpdateApple(dynamic family, dynamic name, dynamic token) {
    print(family);
    print(name);
    userInfo.update((val) {
      val?.userId = token;
      val?.userName = '${family + name}';
    });
    Get.to(() => const MainPage());
  }
}
