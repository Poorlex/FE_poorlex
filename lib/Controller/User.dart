import 'package:get/get.dart';

import 'package:poorlex/Models/Login.dart';

class UserController extends GetxController {
  final userInfo = UserInfo().obs;

  void updateUser(UserInfo user) {
    userInfo.update((val) {
      val = user;
    });
  }
}
