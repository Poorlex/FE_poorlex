import 'package:flutter/material.dart';
import 'package:poorlex/Libs/Theme.dart';

import 'package:poorlex/Screen/Battle/Page.dart';
import 'package:poorlex/Screen/Goal/Page.dart';
import 'package:poorlex/Screen/Main/Page.dart';
import 'package:poorlex/Screen/My/Page.dart';
import 'package:poorlex/Screen/Calendar/Page.dart';

class BarItem {
  String key;
  String label;
  String onIcon;
  String offIcon;

  BarItem({
    required this.key,
    required this.label,
    required this.onIcon,
    required this.offIcon
  });
}

class BottomBar extends StatefulWidget {
  final int nowPage;

  BottomBar({
    super.key,
    required this.nowPage
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late int _selectedIndex = widget.nowPage;
  static final barItems = [
    BarItem(key: 'home', label: '홈', onIcon: 'assets/main_page/icon_home.png', offIcon: 'assets/main_page/icon_home_un.png'),
    BarItem(key: 'goal', label: '목표', onIcon: 'assets/main_page/icon_goal.png', offIcon: 'assets/main_page/icon_goal_un.png'),
    BarItem(key: 'battle', label: '배틀', onIcon: 'assets/main_page/icon_battle.png', offIcon: 'assets/main_page/icon_battle_un.png'),
    BarItem(key: 'my', label: 'my', onIcon: 'assets/main_page/icon_my.png', offIcon: 'assets/main_page/icon_my_un.png'),
  ];

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
      items: barItems.asMap().entries.map((item) {
        return BottomNavigationBarItem(
          label: item.value.label,
          icon: Padding(padding: EdgeInsets.all(6), child:
          Column(children: [
            if (_selectedIndex == item.key) ...[Image.asset(width: 22, height: 22, item.value.onIcon)]
            else ...[Image.asset(width: 22, height: 22, item.value.offIcon)]
          ]))
        );
      }).toList(),
      currentIndex: _selectedIndex,
      selectedItemColor: CustomColors.yellow,
      unselectedItemColor: CustomColors.gray30,
      onTap: _onItemTapped,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
    );
  }
}
