import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/libs/theme.dart';

class BarItem {
  String key;
  String label;
  String onIcon;
  String offIcon;
  String route;

  BarItem({
    required this.key,
    required this.label,
    required this.onIcon,
    required this.offIcon,
    required this.route,
  });
}

class BottomBar extends StatefulWidget {
  final int nowPage;

  BottomBar({super.key, required this.nowPage});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late int _selectedIndex = widget.nowPage;
  static final barItems = [
    BarItem(
      key: 'home',
      label: '홈',
      onIcon: 'assets/main_page/icon_home.png',
      offIcon: 'assets/main_page/icon_home_un.png',
      route: '/main',
    ),
    BarItem(
      key: 'goal',
      label: '목표',
      onIcon: 'assets/main_page/icon_goal.png',
      offIcon: 'assets/main_page/icon_goal_un.png',
      route: '/goal',
    ),
    BarItem(
      key: 'battle',
      label: '배틀',
      onIcon: 'assets/main_page/icon_battle.png',
      offIcon: 'assets/main_page/icon_battle_un.png',
      route: '/battle',
    ),
    BarItem(
      key: 'calendar',
      label: '요약',
      onIcon: 'assets/main_page/icon_calendar.png',
      offIcon: 'assets/main_page/icon_calendar_un.png',
      route: '/calendar',
    ),
    BarItem(
      key: 'my',
      label: 'my',
      onIcon: 'assets/main_page/icon_my.png',
      offIcon: 'assets/main_page/icon_my_un.png',
      route: '/my',
    ),
  ];

  Route _createRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Get.offAllNamed(barItems[index].route);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: barItems.asMap().entries.map((item) {
        return BottomNavigationBarItem(
            label: item.value.label,
            icon: Padding(
                padding: EdgeInsets.all(6),
                child: Column(children: [
                  if (_selectedIndex == item.key) ...[
                    Image.asset(width: 22, height: 22, item.value.onIcon)
                  ] else ...[
                    Image.asset(width: 22, height: 22, item.value.offIcon)
                  ]
                ])));
      }).toList(),
      currentIndex: _selectedIndex,
      selectedItemColor: CColors.yellow,
      unselectedItemColor: CColors.gray30,
      onTap: _onItemTapped,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
    );
  }
}
