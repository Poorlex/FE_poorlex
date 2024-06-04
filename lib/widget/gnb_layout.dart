import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/bind/battle_detail.dart';
import 'package:poorlex/main.dart';
import 'package:poorlex/screen/Init.dart';
import 'package:poorlex/screen/battle/battle.dart';
import 'package:poorlex/screen/battle/battle_detail.dart';
import 'package:poorlex/screen/battle/battle_ranking.dart';
import 'package:poorlex/screen/calendar/calendar_page.dart';
import 'package:poorlex/screen/goal/goal_page.dart';
import 'package:poorlex/screen/home/home.dart';
import 'package:poorlex/screen/my/my_expense.dart';
import 'package:poorlex/screen/my/my_expense_detail.dart';
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
  int _pageIndex = 0;

  void _changePageIndex(int index) {
    _pageIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    /// [MEMO] nested bottom navigation bar에서 android 뒤로가기는 아래처럼 제어합니다.
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        final navigatorState = Get.nestedKey(GNBLayout.globalKey)?.currentState;
        if (navigatorState != null && navigatorState.canPop()) {
          navigatorState.pop();
        }
      },
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
                );
              case '/goal':
                return GetPageRoute(
                  page: () => GoalPage(),
                );
              case '/battle':
                return GetPageRoute(
                  page: () => Battle(),
                  binding: BattleBind(),
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
                );
              case '/my':
                return GetPageRoute(
                  page: () => MyPage(),
                );
              case '/my/expenditure':
                return GetPageRoute(
                  page: () => MyExpensePage(),
                );
              case '/my/expense-detail':
                return GetPageRoute(
                  page: () => MyExpenseDetailPage(
                    id: arguments?['id'],
                  ),
                );
              default:
                return GetPageRoute(
                  page: () => Init(),
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
