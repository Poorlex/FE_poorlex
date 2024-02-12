import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Widget/NavBar.dart';
import 'package:poorlex/Widget/Main/BottomBar.dart';
import 'package:poorlex/Widget/Main/CarouselSlider.dart';
import 'package:poorlex/Widget/Main/MainBottom.dart';
import 'package:poorlex/Widget/Main/ShowModal.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/Modal.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ModalController _modal = Get.put(ModalController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_modal.modalCount().modalCount == 0) {
        show(context);
      }
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
        appBar: NavBar(),
        bottomNavigationBar: BottomBar(nowPage: 0),
        body: Column(
          children: [
            // Transform.translate(offset: Offset(2, 2), child: BudgetTooltip()),
            if (modalValue == 0) ...[
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: CColors.brownLight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  show(context);
                                },
                                icon: Icon(Icons.abc)),
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
                  color: CColors.brown,
                  child: Center(
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
