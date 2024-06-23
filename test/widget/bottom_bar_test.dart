import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poorlex/widget/common/bottom_bar.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  group("bottomBar 테스트", () {
    testWidgets('bottomBar 이미지 변경을 확인합니다. \n bottomBar는 stateFullWidget이 아닙니다.',
        (tester) async {
      // Create the widget by telling the tester to build it.
      int _nowPage = 0;
      void _changePageIndex(int index) {
        _nowPage = index;
      }

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomBar(
            nowPage: _nowPage,
            changePageIndex: _changePageIndex,
          ),
        ),
      )); // Create the Finders.
      final titleFinder = find.text('홈');
      final homeOnIcon =
          find.image(AssetImage('assets/main_page/icon_home.png'));

      expect(titleFinder, findsOneWidget);
      expect(homeOnIcon, findsWidgets);

      /// 1번 인덱스를 클릭합니다.
      _changePageIndex(1);
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomBar(
            nowPage: _nowPage,
            changePageIndex: _changePageIndex,
          ),
        ),
      )); // Create the Finders.
      final homeOffIcon =
          find.image(AssetImage('assets/main_page/icon_home_un.png'));
      final battleOnIcon =
          find.image(AssetImage("assets/main_page/icon_battle.png"));
      expect(homeOffIcon, findsWidgets);
      expect(battleOnIcon, findsWidgets);
    });
  });
}
