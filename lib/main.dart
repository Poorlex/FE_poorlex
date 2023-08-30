import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'Screen/battle_page.dart';
import 'landingpage.dart';
// import 'package:poorlex/Screen/my_page.dart';
// import 'package:poorlex/Screen/main_page.dart';

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
        // home: const MainPage());
        // home: const MyPage());
        // home: const LoginKakao());
        // home: const LandingPage());
        // home: const AppleLogin());
        home: BattlePage());
  }
}
