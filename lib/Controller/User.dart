import 'package:get/get.dart';

import 'package:poorlex/Models/Login.dart';
import 'package:poorlex/Screen/Main/page.dart';

class UserController extends GetxController {
  final userInfo = UserInfo().obs;

  void userUpdate(dynamic user) {
    userInfo.update((val) {
      final userId = user?.id.toString();
      val?.userId = userId.toString();
      val?.userName = user?.properties['nickname'];
    });
  }

  void userUpdateApple(dynamic family, dynamic name, dynamic token) {
    print(token);
    userInfo.update((val) {
      val?.userId = token;
      val?.userName = '${family + name}';
    });
    Get.to(() => const MainPage());
  }
}
