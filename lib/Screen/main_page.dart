import 'package:flutter/material.dart';
import 'package:poorlex/Widget/MainPageWidget/bottom_bar.dart';
import 'package:poorlex/Widget/MainPageWidget/carousel_slider.dart';
import 'package:poorlex/Widget/MainPageWidget/main_bottom.dart';
// import 'package:poorlex/Widget/main_carousel.dart';
import 'package:poorlex/Widget/nav_bar.dart';

import '../Widget/MainPageWidget/show_modal.dart';

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
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Wrap(children: [
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 140,
                    height: 140,
                    child:
                        Image.asset('assets/main_page/icon_profile_remove.png'),
                  ),
                ],
              ),
              const ShowModal(),
            ],
          ),
        ]);
      },
    );
  }

  int modalValue = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NeoDunggeunmoPro-Regular'),
      home: Scaffold(
        appBar: const NavBar(),
        bottomNavigationBar: const BottomBar(
          nowPage: 0,
        ),
        body: Column(
          children: [
            if (modalValue == 0) ...[
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color(0xffE4D4BE),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  show(context);
                                },
                                icon: const Icon(Icons.abc)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: const Color(0xffB59767),
                  child: const Center(
                    // child: MainCarousel(),
                    child: MainCarouselSlider(),
                  ),
                ),
              ),
              const MainBottom()
            ]
          ],
        ),
      ),
    );
  }
}
