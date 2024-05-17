import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';

import 'package:poorlex/controller/api.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/controller/layout.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/models/login.dart';
import 'package:poorlex/screen/my/my_notification.dart';
import 'package:poorlex/screen/my/my_page.dart';
import 'package:poorlex/widget/common/webview.dart';

import 'package:poorlex/screen/init.dart';
import 'package:poorlex/screen/login/login.dart';
import 'package:poorlex/screen/login/login_modal.dart';
import 'package:poorlex/screen/my/my_expense.dart';
import 'package:poorlex/screen/my/my_expense_input.dart';
import 'package:poorlex/screen/my/my_expense_detail.dart';
import 'package:poorlex/screen/my/my_option.dart';
import 'package:poorlex/screen/my/my_profile.dart';

import 'package:poorlex/screen/battle/battle.dart';
import 'package:poorlex/screen/battle/battle_create.dart';
import 'package:poorlex/screen/battle/battle_ranking.dart';

import 'package:poorlex/screen/main/main.dart';

class Bind extends Bindings {
  @override
  void dependencies() {
    Get.put(LayoutController(), permanent: true);
    Get.put(ApiController(), permanent: true);
    Get.put(UserController(), permanent: true);
  }
}

class BattleBind extends Bindings {
  @override
  void dependencies() {
    Get.put(LayoutController(), permanent: true);
    Get.put(ApiController(), permanent: true);
    Get.put(UserController(), permanent: true);
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

  runApp(
    GetMaterialApp(
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
          binding: Bind(),
        ),
        GetPage(
          name: '/login/kakao',
          page: () => LoginModal(loginType: LoginTypes.kakao),
          binding: Bind(),
        ),
        GetPage(name: '/my', page: () => MyPage(), binding: Bind()),
        GetPage(
          name: '/my/notice',
          page: () => CustomWebview(
            title: '공지사항',
            url:
                'https://horse-whitefish-a82.notion.site/cfce62743ec94c7398cf4f06758e373c?pvs=4',
          ),
        ),
        GetPage(
          name: '/my/privacy',
          page: () => CustomWebview(
            title: '개인정보 처리방침',
            url:
                'https://horse-whitefish-a82.notion.site/c24f0bb85c544e259c4caea802a2b93f?pvs=4',
          ),
        ),
        GetPage(
          name: '/my/terms',
          page: () => CustomWebview(
            title: '이용약관',
            url:
                'https://horse-whitefish-a82.notion.site/3623856463694fd2b9f38806b8cf507e?pvs=4',
          ),
        ),
        GetPage(
          name: '/my/expenditure',
          page: () => MyExpensePage(),
          binding: Bind(),
        ),
        GetPage(name: '/my/profile', page: () => MyProfile(), binding: Bind()),
        GetPage(
          name: '/my/expense-input',
          page: () => MyExpenseInputPage(),
          binding: Bind(),
        ),
        GetPage(
          name: '/my/expense-detail',
          page: () => MyExpenseDetailPage(),
          binding: Bind(),
        ),
        GetPage(name: '/my/option', page: () => MyOption(), binding: Bind()),
        GetPage(
          name: '/my/notification',
          page: () => MyNotification(),
          binding: Bind(),
        ),
        GetPage(name: '/battle', page: () => Battle(), binding: BattleBind()),
        GetPage(
          name: '/battle/create',
          page: () => BattleCreate(),
          binding: BattleBind(),
        ),
        GetPage(
          name: '/battle/ranking',
          page: () => BattleRanking(),
          binding: BattleBind(),
        )
      ],
    ),
  );
}
