import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/widget/nav_bar.dart';
import 'package:poorlex/widget/main/carousel_slider.dart';
import 'package:poorlex/widget/main/main_bottom.dart';
import 'package:poorlex/widget/main/show_modal.dart';

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
  // 모달 페이지 변수
  int modalValue = 0;

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
        return Wrap(
          runAlignment: WrapAlignment.start,
          children: [
            const ShowModal(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 네비게이션 바
      appBar: NavBar(),
      body: Container(
        // 전체 배경
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/main_page/background_image.png'),
            fit: BoxFit.fitWidth,
          ),
        ),

        // 캐릭터 이미지, 배틀 리스트, 지출 추가하기 버튼
        child: Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: 94,
                        child: Image.asset('assets/main_page/avatar_1.png'),
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                  // 참여 중인 배틀
                  Container(
                    child: MainCarouselSlider(),
                  ),
                ],
              ),
              // 지출 추가하기 버튼
              const MainBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
