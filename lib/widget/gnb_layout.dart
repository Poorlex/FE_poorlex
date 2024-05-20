import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/main.dart';
import 'package:poorlex/screen/Init.dart';
import 'package:poorlex/screen/battle/battle.dart';
import 'package:poorlex/screen/battle/battle_ranking.dart';
import 'package:poorlex/screen/calendar/calendar_page.dart';
import 'package:poorlex/screen/goal/goal_page.dart';
import 'package:poorlex/screen/main/main.dart';
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
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(GNBLayout.globalKey),
        initialRoute: '/',
        onGenerateRoute: (settings) {
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
                page: () => MyExpenseDetailPage(),
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
    );
  }
}
