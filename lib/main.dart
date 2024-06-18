import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:poorlex/bind/friends.dart';
import 'package:poorlex/bind/battle/modify_battle.dart';
import 'package:poorlex/bind/root_bind.dart';
import 'package:poorlex/controller/hive_box.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/middleware/auth_middleware.dart';
import 'package:poorlex/screen/battle/modify_battle_detail.dart';
import 'package:poorlex/screen/budget/budget_page.dart';
import 'package:poorlex/screen/friends/friends.dart';
import 'package:poorlex/screen/my/edit_my_expense.dart';
import 'package:poorlex/screen/my/my_expense.dart';
import 'package:poorlex/screen/my/my_expense_detail.dart';
import 'package:poorlex/screen/my/my_notification.dart';
import 'package:poorlex/widget/common/webview.dart';
import 'package:poorlex/widget/gnb_layout.dart';
import 'package:poorlex/screen/login/login.dart';
import 'package:poorlex/screen/my/create_my_expense.dart';
import 'package:poorlex/screen/my/my_option.dart';
import 'package:poorlex/screen/my/my_profile.dart';
import 'package:poorlex/screen/battle/battle_create.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp() 호출 전 Flutter SDK 초기화
  await HiveBox.initHive();
  initializeDateFormatting('ko');
  await dotenv.load(fileName: ".env");

  KakaoSdk.init(
    nativeAppKey: dotenv.get('YOUR_NATIVE_APP_KEY'),
    javaScriptAppKey: dotenv.get('YOUR_JAVASCRIPT_APP_KEY'),
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    GetMaterialApp(
      initialBinding: RootBind(),
      initialRoute: '/',
      theme: ThemeData(
        fontFamily: 'NeoDunggeunmoPro-Regular',
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        shadowColor: Colors.transparent,
        scaffoldBackgroundColor: CColors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: CColors.black,
          iconTheme: IconThemeData(color: CColors.white),
        ),
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => GNBLayout(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(name: '/login', page: () => Login()),
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
        GetPage(name: '/my/profile', page: () => MyProfile()),
        GetPage(
          name: '/my/expenditure',
          page: () => MyExpensePage(),
        ),
        GetPage(
          name: '/my/expense-detail/:expenseId',
          page: () => MyExpenseDetailPage(),
        ),
        GetPage(
          name: '/my/expense/create',
          page: () => CreateMyExpensePage(),
        ),
        GetPage(
          name: '/my/expense/edit/:expenseId',
          page: () => EditMyExpensePage(),
        ),
        GetPage(name: '/my/option', page: () => MyOption()),
        GetPage(
          name: '/my/notification',
          page: () => MyNotification(),
        ),
        GetPage(
          name: '/battle/create',
          page: () => BattleCreate(),
        ),
        GetPage(
          name: '/battle/modify/:battleId',
          page: () => ModifyBattleDetail(),
          binding: ModifyBattleBinding(),
        ),
        GetPage(
          name: '/friends',
          page: () => FriendsScreen(),
          binding: FriendsBinding(),
        ),
        GetPage(
          name: '/budget',
          page: () => BudgetPage(),
        )
      ],
    ),
  );
}
