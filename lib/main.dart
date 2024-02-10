import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:poorlex/Screen/battle_page/detail/ranking/ranking.dart';
import 'package:poorlex/Screen/main_page.dart';
import 'package:poorlex/Screen/budget_page.dart';
import 'package:poorlex/Screen/my_page/my_page.dart';
import 'package:poorlex/Screen/my_page/my_expense_page.dart';
import 'package:poorlex/Screen/my_page/my_expense_detail_page.dart';
import 'package:poorlex/Screen/my_page/my_expense_input_page.dart';
import 'Screen/calendar_page.dart';
import 'Screen/goal_page.dart';
import 'landingpage.dart';

// import 'package:poorlex/Screen/my_page.dart';
// import 'package:poorlex/Screen/main_page.dart';

import 'Screen/battle_page/battle_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  String Key = 'e820bf9c54d06756d8e929f542dbd2e7';

  KakaoSdk.init(nativeAppKey: Key);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(fontFamily: 'NeoDunggeunmoPro-Regular'),
        // home: LandingPage(),
        // home: BudgetPage());
        // home: const MainPage());
        // home: const MyPage());
        // home: MyExpenseInputPage());
        // home: const LoginKakao());
        // home: const LandingPage());
        // home: const AppleLogin());
        // home: BattlePage());
        // home: CaledarPage());
        // home: GoalPage());
        home: Ranking());
  }
}
