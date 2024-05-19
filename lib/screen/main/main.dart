import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/widget/nav_bar.dart';
import 'package:poorlex/widget/main/carousel_slider.dart';
import 'package:poorlex/widget/main/main_bottom.dart';
import 'package:poorlex/widget/main/show_modal.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/controller/modal.dart';

class Main extends StatefulWidget {
  const Main({
    super.key,
  });

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
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
      useRootNavigator: true,
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
    return Scaffold(
      appBar: NavBar(),
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
    );
  }
}
