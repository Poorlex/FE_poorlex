import 'package:get/get.dart';
import '../Models/login_model.dart';

class UserController extends GetxController {
  final userInfo = UserInfo().obs;

  void userUpdate(dynamic user) {
    userInfo.update((val) {
      val?.userId = user?.id;
      val?.userName = user?.properties['nickname'];
    });
  }
}
