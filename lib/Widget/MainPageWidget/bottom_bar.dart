import 'package:flutter/material.dart';
import 'package:poorlex/Screen/battle_page/battle_page.dart';
import 'package:poorlex/Screen/goal_page.dart';
import 'package:poorlex/Screen/main_page.dart';
import 'package:poorlex/Screen/my_page/my_page.dart';
import 'package:poorlex/Screen/calendar_page.dart';

class BottomBar extends StatefulWidget {
  final int nowPage;

  const BottomBar({super.key, required this.nowPage});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late int _selectedIndex = widget.nowPage;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Route route = MaterialPageRoute(builder: (context) => _pages[index]);

    Navigator.pushReplacement(context, route);
  }

  static const List<Widget> _pages = <Widget>[
    MainPage(),
    GoalPage(),
    BattlePage(),
    CaledarPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  if (_selectedIndex == 0) ...[
                    Image.asset(
                        width: 22,
                        height: 22,
                        'assets/main_page/icon_home.png'),
                  ] else ...[
                    Image.asset(
                        width: 22,
                        height: 22,
                        'assets/main_page/icon_home_un.png'),
                  ]
                ],
              )),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  if (_selectedIndex == 1) ...[
                    Image.asset(
                        width: 22,
                        height: 22,
                        'assets/main_page/icon_goal.png'),
                  ] else ...[
                    Image.asset(
                        width: 22,
                        height: 22,
                        'assets/main_page/icon_goal_un.png'),
                  ]
                ],
              )),
          label: '목표',
        ),
        BottomNavigationBarItem(
          icon: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  if (_selectedIndex == 2) ...[
                    Image.asset(
                        width: 22,
                        height: 22,
                        'assets/main_page/icon_battle.png'),
                  ] else ...[
                    Image.asset(
                        width: 22,
                        height: 22,
                        'assets/main_page/icon_battle_un.png'),
                  ]
                ],
              )),
          label: '배틀',
        ),
        BottomNavigationBarItem(
          icon: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  if (_selectedIndex == 3) ...[
                    Image.asset(
                        width: 22, height: 22, 'assets/main_page/icon_my.png'),
                  ] else ...[
                    Image.asset(
                        width: 22,
                        height: 22,
                        'assets/main_page/icon_calendar_un.png'),
                  ]
                ],
              )),
          label: '요약',
        ),
        BottomNavigationBarItem(
          icon: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  if (_selectedIndex == 4) ...[
                    Image.asset(
                        width: 22, height: 22, 'assets/main_page/icon_my.png'),
                  ] else ...[
                    Image.asset(
                        width: 22,
                        height: 22,
                        'assets/main_page/icon_my_un.png'),
                  ]
                ],
              )),
          label: 'my',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xffFFD600),
      unselectedItemColor: const Color(0xff666666),
      onTap: _onItemTapped,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
    );
  }
}
