import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:poorlex/Controller/Api.dart';
import 'package:poorlex/Controller/User.dart';
import 'package:poorlex/Models/Login.dart';

import 'package:poorlex/Screen/Login/Page.dart';
import 'package:poorlex/Screen/Login/LoginModal.dart';
import 'package:poorlex/Screen/My/Page.dart';

import 'Screen/Main/Page.dart';

class Bind extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiController>(ApiController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(GetMaterialApp(
    initialRoute: '/login',
    theme: ThemeData(fontFamily: 'NeoDunggeunmoPro-Regular'),
    getPages: [
      GetPage(name: '/main', page: () => Main(), binding: Bind()),
      GetPage(name: '/login', page: () => Login(), binding: Bind()),
      GetPage(
          name: '/login/apple',
          page: () => LoginModal(loginType: LoginTypes.apple),
          binding: Bind()),
      GetPage(
          name: '/login/kakao',
          page: () => LoginModal(loginType: LoginTypes.kakao),
          binding: Bind()),
      GetPage(name: '/my', page: () => MyPage(), binding: Bind())
    ]
  ));
}
