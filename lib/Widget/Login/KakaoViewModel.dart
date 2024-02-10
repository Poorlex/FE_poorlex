import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:poorlex/Controller/User.dart';
import 'package:poorlex/Widget/Login/Kakao.dart';

class KakaoViewModel {
  final KakaoLogin _kakaoLogin;
  static bool isLogined = false;

  User? user;

  KakaoViewModel(this._kakaoLogin);

  Future kakaoLogin() async {
    isLogined = await _kakaoLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
      Get.find<UserController>().userUpdate(user);
      // Get.to(() => const MainPage());
    }
  }

  Future kakaoLogout() async {
    await _kakaoLogin.logout();
    isLogined = false;
    user = null;
  }
}
