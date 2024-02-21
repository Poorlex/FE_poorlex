import 'package:get/get.dart';

import 'package:poorlex/Models/User.dart';

class UserController extends GetxController {
  final userInfo = UserInfo().obs;
  final userToken = UserToken().obs;

  void updateUser(UserInfo user) {
    userInfo.update((val) {
      val?.userId = user.userId;
      val?.userName = user.userName;
    });
  }

  void updateToken(UserToken token) {
    userToken.update((val) {
      val?.token = token.token;
      val?.refreshToken = token.refreshToken;
    });
  }
}
