import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/user.dart';

/// Middleware는 initialBinding되기 전에 실행됩니다.
/// 그래서 Get.find를 redirect가 호출될 때 가져옵니다.
class AuthMiddleware extends GetMiddleware {
  // 여기에 인증 상태를 확인하는 로직을 추가합니다.
  @override
  RouteSettings? redirect(String? route) {
    final UserController userController = Get.find<UserController>();
    // 인증되지 않은 경우 로그인 페이지로 리다이렉트
    bool isAuthenticated = userController.isAuthenticated();
    if (!isAuthenticated && route != '/login') {
      return RouteSettings(name: '/login');
    }

    return null; // 인증된 경우 리다이렉트하지 않음
  }
}
