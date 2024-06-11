import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/weekly_budgets.dart';

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

    // 디바이스 높이에 따라 top, bottom 값을 설정합니다.
    double topPosition;
    double bottomPosition;

    if (deviceHeight > 800) {
      topPosition = 160.0;
      bottomPosition = 100.0;
    } else if (deviceHeight > 700) {
      topPosition = 130.0;
      bottomPosition = 75.0;
    } else {
      topPosition = 80.0;
      bottomPosition = 50.0;
    }

    return Obx(
      () {
        final budget = _budget.weeklyBudget.value;

        return Scaffold(
          // 네비게이션 바
          appBar: NavBar(budget: budget),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

            // 전체 배경
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/main_page/background_image.png'),
                fit: BoxFit.fitWidth,
              ),
            ),

            // 캐릭터 이미지, 배틀 리스트, 지출 추가하기 버튼
            child: Stack(
              children: [
                // 캐릭터 이미지
                Positioned(
                  top: topPosition,
                  width: deviceWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 94,
                        child: Image.asset('assets/main_page/avatar_1.png'),
                      ),
                    ],
                  ),
                ),

                // 참여 중인 배틀 캐러셀
                Positioned(
                  bottom: bottomPosition,
                  width: deviceWidth,
                  child: MainCarouselSlider(),
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
