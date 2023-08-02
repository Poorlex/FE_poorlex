import 'package:flutter/material.dart';
import 'package:poorlex/Widget/MainPageWidget/carousel_slider.dart';
import 'package:poorlex/Widget/MainPageWidget/main_bottom.dart';
import 'package:poorlex/Widget/MainPageWidget/show_modal.dart';
// import 'package:poorlex/Widget/main_carousel.dart';
import 'package:poorlex/Widget/nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      show(context);
    });
  }

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ShowModal();
      },
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _selectedIndex = index;
    });
  }

  int modalValue = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NeoDunggeunmoPro-Regular'),
      home: Scaffold(
        appBar: const NavBar(),
        bottomNavigationBar: BottomNavigationBar(
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
                            width: 22,
                            height: 22,
                            'assets/main_page/icon_calendar.png'),
                      ] else ...[
                        Image.asset(
                            width: 22,
                            height: 22,
                            'assets/main_page/icon_calendar_un.png'),
                      ]
                    ],
                  )),
              label: '달력',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      if (_selectedIndex == 4) ...[
                        Image.asset(
                            width: 22,
                            height: 22,
                            'assets/main_page/icon_my.png'),
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
        ),
        body: Column(
          children: [
            if (modalValue == 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        show(context);
                      },
                      icon: const Icon(Icons.abc)),
                ],
              ),
            Flexible(
              flex: 3,
              child: Row(
                children: [
                  Container(color: Colors.blue),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                color: const Color(0xffB59767),
                child: const Center(
                  // child: MainCarousel(),
                  child: MainCarouselSlider(),
                ),
              ),
            ),
            const MainBottom()
          ],
        ),
      ),
    );
  }
}
