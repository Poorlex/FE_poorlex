import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:poorlex/bind/battle/battle.dart';
import 'package:poorlex/bind/battle/battle_detail.dart';
import 'package:poorlex/controller/%08toast_controller.dart';
import 'package:poorlex/screen/battle/battle.dart';
import 'package:poorlex/screen/battle/battle_detail.dart';
import 'package:poorlex/screen/battle/battle_ranking.dart';
import 'package:poorlex/screen/calendar/calendar_page.dart';
import 'package:poorlex/screen/goal/goal_page.dart';
import 'package:poorlex/screen/home/home.dart';
import 'package:poorlex/screen/my/my_page.dart';
import 'package:poorlex/widget/common/bottom_bar.dart';

class GNBLayout extends StatefulWidget {
  /// [MEMO] 유니크한 key를 설정하고 id는 1입니다.
  static int globalKey = 1;
  const GNBLayout({Key? key}) : super(key: key);

  @override
  State<GNBLayout> createState() => _GNBLayoutState();
}

class _GNBLayoutState extends State<GNBLayout> {
  Timer? _lastBackPressed;
  int _pageIndex = 0;

  void _changePageIndex(int index) {
    _pageIndex = index;
    setState(() {});
  }

  void _onPopInvoked(bool disPop) {
    final navigatorState = Get.nestedKey(GNBLayout.globalKey)?.currentState;
    if (navigatorState != null && navigatorState.canPop()) {
      navigatorState.pop();
      return;
    }
    if (_lastBackPressed != null && _lastBackPressed!.isActive) {
      _lastBackPressed!.cancel();
      SystemNavigator.pop();
    } else {
      _lastBackPressed = Timer(Duration(seconds: 1), () {});
      ToastController.showToast(
        msg: "한번 더 누를시 앱이 종료됩니다.",
      );
    }
  }

  @override
  void initState() {
    ToastController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// [MEMO] nested bottom navigation bar에서 android 뒤로가기는 아래처럼 제어합니다.
    return PopScope(
      canPop: false,
      onPopInvoked: _onPopInvoked,
      child: Scaffold(
        body: Navigator(
          key: Get.nestedKey(GNBLayout.globalKey),
          initialRoute: '/',
          onGenerateRoute: (settings) {
            final arguments = settings.arguments as Map<String, dynamic>?;
            switch (settings.name) {
              case '/main':
                return GetPageRoute(
                  page: () => Main(),
                  transition: Transition.noTransition,
                  bindings: [
                    BattleBind(),
                  ],
                );
              case '/goal':
                return GetPageRoute(
                  page: () => GoalPage(),
                  transition: Transition.noTransition,
                );
              case '/battle':
                return GetPageRoute(
                  page: () => Battle(),
                  binding: BattleBind(),
                  transition: Transition.noTransition,
                );
              case '/battle/detail':
                return GetPageRoute(
                  page: () => BattleDetail(
                    battleId: arguments?['battleId'] ?? 0,
                  ),
                  binding: BattleDetailBinding(),
                );
              case '/battle/ranking':
                return GetPageRoute(page: () => BattleRanking());
              case '/calendar':
                return GetPageRoute(
                  page: () => CalendarPage(),
                  transition: Transition.noTransition,
                );
              case '/my':
                return GetPageRoute(
                  page: () => MyPage(),
                  transition: Transition.noTransition,
                );
              default:

                /// [MEMO] 초기 라우팅 '/'에 대한 처리를 고민할 필요가있음.
                return GetPageRoute(
                  page: () => Main(),
                );
            }
          },
        ),
        bottomNavigationBar: BottomBar(
          nowPage: _pageIndex,
          changePageIndex: _changePageIndex,
        ),
      ),
    );
  }
}
