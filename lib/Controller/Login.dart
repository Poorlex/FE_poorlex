import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:poorlex/Models/Login.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:poorlex/Controller/User.dart';

class KakaoLogin {
  static bool isLogined = false;

  Future login() async {
    if (await isKakaoTalkInstalled()) {
      await UserApi.instance.loginWithKakaoTalk();
    } else {
      await UserApi.instance.loginWithKakaoAccount();
    }
  }

  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<UserInfo> getUserInfo() async {
    User me = await UserApi.instance.me();
    return UserInfo(
      userId: me.id.toString(),
      userName: me.properties?['nickname'] ?? '사용자'
    );
  }
}

class AppleLogin {
  static bool isLogined = false;

  Future<bool> checkApple() async {
    return await SignInWithApple.isAvailable();
  }

  Future<UserInfo> login() async {
    final me = await SignInWithApple.getAppleIDCredential(
      scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
    );
    if (me.familyName == null) {
      return UserInfo(
          userId: me.identityToken!,
          userName: '사용자'
      );
    } else {
      return UserInfo(
          userId: me.identityToken!,
          userName: '${me.familyName} ${(me.givenName ?? '')}'
      );
    }
  }
}

class LoginContoller {
  KakaoLogin kakao = KakaoLogin();
  AppleLogin apple = AppleLogin();
  User? user;

  Future<void> kakaoLogin () async {
    try {
      if (await kakao.login()) {
        Get.find<UserController>().updateUser(
            await kakao.getUserInfo()
        );
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> kakaoLogout () async {
    try {
      kakao.logout();
    } catch (error) {
      print(error);
    }
  }

  Future<void> appleLogin () async {
    try {
      if (await apple.checkApple()) {
        apple.login();
      }
    } catch (error) {
      print(error);
    }
  }
}
