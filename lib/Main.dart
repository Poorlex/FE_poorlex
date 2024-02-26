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
import 'package:poorlex/Screen/My/MyExpense.dart';
import 'package:poorlex/Screen/My/Page.dart';
import 'package:poorlex/Widget/Common/Webview.dart';

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
      theme: ThemeData(
          fontFamily: 'NeoDunggeunmoPro-Regular',
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          shadowColor: Colors.transparent,
      ),
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
        GetPage(name: '/my', page: () => MyPage(), binding: Bind()),
        GetPage(
            name: '/my/notice',
            page: () => CustomWebview(
                title: '공지사항',
                url:
                    'https://horse-whitefish-a82.notion.site/cfce62743ec94c7398cf4f06758e373c?pvs=4')),
        GetPage(
            name: '/my/privacy',
            page: () => CustomWebview(
                title: '개인정보 처리방침',
                url:
                    'https://horse-whitefish-a82.notion.site/c24f0bb85c544e259c4caea802a2b93f?pvs=4')),
        GetPage(
            name: '/my/terms',
            page: () => CustomWebview(
                title: '이용약관',
                url:
                    'https://horse-whitefish-a82.notion.site/3623856463694fd2b9f38806b8cf507e?pvs=4')),
        GetPage(name: '/my/expenditure', page: () => MyExpensePage())
      ]));
}
