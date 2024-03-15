import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';

import 'package:poorlex/Controller/Api.dart';
import 'package:poorlex/Controller/Battle.dart';
import 'package:poorlex/Controller/Layout.dart';
import 'package:poorlex/Controller/User.dart';
import 'package:poorlex/Models/Login.dart';
import 'package:poorlex/Widget/Common/Webview.dart';

import 'package:poorlex/Screen/Init.dart';
import 'package:poorlex/Screen/Login/Main.dart';
import 'package:poorlex/Screen/Login/LoginModal.dart';

import 'package:poorlex/Screen/My/MyExpense.dart';
import 'package:poorlex/Screen/My/MyExpenseInput.dart';
import 'package:poorlex/Screen/My/MyExpenseDetail.dart';
import 'package:poorlex/Screen/My/MyOption.dart';
import 'package:poorlex/Screen/My/Main.dart';
import 'package:poorlex/Screen/My/MyProfile.dart';

import 'package:poorlex/Screen/Battle/Main.dart';
import 'package:poorlex/Screen/Battle/BattleCreate.dart';

import 'package:poorlex/Screen/Main/Main.dart';

class Bind extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiController(), permanent: true);
    Get.put(UserController(), permanent: true);
    Get.put(LayoutController(), permanent: true);
  }
}

class BattleBind extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiController(), permanent: true);
    Get.put(UserController(), permanent: true);
    Get.put(LayoutController(), permanent: true);
    Get.put(BattleController(), permanent: true);
  }
}

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('ko');
  await dotenv.load(fileName: ".env");
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(GetMaterialApp(
      initialRoute: '/',
      theme: ThemeData(
          fontFamily: 'NeoDunggeunmoPro-Regular',
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          shadowColor: Colors.transparent,
      ),
      getPages: [
        GetPage(name: '/', page: () => Init(), binding: Bind()),
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
        GetPage(name: '/my/expenditure', page: () => MyExpensePage(), binding: Bind()),
        GetPage(name: '/my/profile', page: () => MyProfile(), binding: Bind()),
        GetPage(name: '/my/expense-input', page: () => MyExpenseInputPage(), binding: Bind()),
        GetPage(name: '/my/expense-detail', page: () => MyExpenseDetailPage(), binding: Bind()),
        GetPage(name: '/my/option', page: () => MyOption(), binding: Bind()),
        GetPage(name: '/battle', page: () => Battle(), binding: BattleBind()),
        GetPage(name: '/battle/create', page: () => BattleCreate(), binding: BattleBind())
      ]));
}
