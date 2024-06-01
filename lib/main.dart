import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:poorlex/bind/friends.dart';
import 'package:poorlex/bind/modify_battle.dart';
import 'package:poorlex/controller/api.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/controller/hive_box.dart';
import 'package:poorlex/controller/image_picker.dart';
import 'package:poorlex/controller/layout.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/middleware/auth_middleware.dart';
import 'package:poorlex/provider/battles_provider.dart';
import 'package:poorlex/provider/expenditures_povider.dart';
import 'package:poorlex/provider/member_provider.dart';
import 'package:poorlex/screen/battle/modify_battle_detail.dart';
import 'package:poorlex/screen/friends/friends.dart';
import 'package:poorlex/screen/my/my_notification.dart';
import 'package:poorlex/widget/common/webview.dart';
import 'package:poorlex/widget/gnb_layout.dart';
import 'package:poorlex/screen/login/login.dart';
import 'package:poorlex/screen/my/my_expense_input.dart';
import 'package:poorlex/screen/my/my_option.dart';
import 'package:poorlex/screen/my/my_profile.dart';
import 'package:poorlex/screen/battle/battle_create.dart';

class Bind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberProvider());
    Get.lazyPut(() => ExpendituresProvider());

    Get.put(LayoutController(), permanent: true);
    Get.put(ApiController(), permanent: true);
    Get.put(
      UserController(
        memberProvider: Get.find(),
        expendituresProvider: Get.find(),
      ),
      permanent: true,
    );
    Get.put(ImagePickerController(), permanent: true);
  }
}

class BattleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BattlesProvider(
        user: Get.find(),
      ),
    );
    Get.put(
      BattleController(
        battlesProvider: Get.find(),
        layout: Get.find(),
        imagePickerController: Get.find(),
      ),
      permanent: true,
    );
  }
}

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
      initialBinding: Bind(),
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
        GetPage(name: '/my/profile', page: () => MyProfile(), binding: Bind()),
        GetPage(
          name: '/my/expense-input',
          page: () => MyExpenseInputPage(),
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
      ],
    ),
  );
}
