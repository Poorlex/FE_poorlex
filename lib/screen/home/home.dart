import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/weekly_budgets.dart';
import 'package:poorlex/libs/theme.dart';

import 'package:poorlex/widget/home/home_nav_bar.dart';
import 'package:poorlex/widget/home/carousel_slider.dart';
import 'package:poorlex/widget/home/home_bottom_button.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  // final ModalController _modal = Get.put(ModalController());

  // void show(BuildContext context) {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     useRootNavigator: true,
  //     context: context,
  //     builder: (context) {
  //       return Wrap(
  //         runAlignment: WrapAlignment.start,
  //         children: [
  //           const ShowModal(),
  //         ],
  //       );
  //     },
  //   );
  // }

  late final _budget = Get.find<WeeklyBudgetsController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _budget.getWeeklyBudgets();
    });

    /// [MEMO] 1차 배포에 포함안하기 때문에 주석처리
    /// 해당 부분 modal 새로 구현해야합니다.
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (_modal.modalCount().modalCount == 0) {
    //     show(context);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Obx(
      () {
        final budget = _budget.weeklyBudget.value;

        return Scaffold(
          // 네비게이션 바
          appBar: NavBar(budget: budget),
          body: Container(
            width: deviceWidth,
            height: deviceHeight,

            // 전체 배경
            decoration: BoxDecoration(
              color: Color(0xffe8dac6),
            ),

            // 캐릭터 이미지, 배틀 리스트, 지출 추가하기 버튼
            child: Stack(
              children: [
                // 상단 배경 이미지, 캐릭터 이미지
                Positioned(
                  top: 22,
                  child: Container(
                    width: deviceWidth,
                    height: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/main_page/background_1.png'),
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 80,
                              height: 94,
                              child: Image.asset(
                                'assets/main_page/character_lv1.gif',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 중간 배경 이미지
                Positioned(
                  top: 182,
                  width: deviceWidth,
                  height: 75,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/main_page/background_2.png'),
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),

                // 예산 설정 안내 문구
                if (budget.amount == 0)
                  Positioned(
                    top: 4,
                    left: 15,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 삼각형
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 60,
                            ),
                            child: ClipPath(
                              clipper: TriangleClipper(),
                              child: Container(
                                width: 10,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: CColors.purple,
                                ),
                              ),
                            ),
                          ),

                          // 예산 설정 안내 문구 박스
                          Container(
                            alignment: Alignment.center,
                            width: 242,
                            height: 30,
                            child: Text(
                              "예산을 설정해야 배틀이 가능해요!",
                              style: CTextStyles.Body3(),
                            ),
                            decoration: BoxDecoration(
                              color: CColors.purple,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                // 참여 중인 배틀 캐러셀
                Positioned.fill(
                  top: 240,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double containerHeight = constraints.maxHeight;

                      return Container(
                        width: deviceWidth,
                        color: Color(0xFFB59767),
                        child: containerHeight > 254
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 72),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    MainCarouselSlider(),
                                  ],
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MainCarouselSlider(),
                                ],
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // 지출 추가 버튼
          bottomNavigationBar: const MainBottom(),
        );
      },
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0); // 꼭짓점이 위쪽 중간에 위치
    path.lineTo(size.width, size.height); // 오른쪽 아래 모서리
    path.lineTo(0.0, size.height); // 왼쪽 아래 모서리
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
