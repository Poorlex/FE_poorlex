import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/audio_controller.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/controller/point.dart';
import 'package:poorlex/controller/weekly_budgets.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/schema/member_progress_battle_response/member_progress_battle_response.dart';
import 'package:poorlex/schema/point_level_bar_response/point_level_bar_response.dart';

import 'package:poorlex/widget/home/home_nav_bar.dart';
import 'package:poorlex/widget/home/carousel_slider.dart';
import 'package:poorlex/widget/home/home_bottom_button.dart';
import 'package:poorlex/widget/loading_screen.dart';

class MainController extends GetxController {
  RxBool showSuccessImage = false.obs;
  RxDouble opacity = 1.0.obs;

  void displaySuccessImage() {
    showSuccessImage.value = true;
    opacity.value = 1.0;

    Future.delayed(Duration(seconds: 2), () {
      opacity.value = 0.0;
      Future.delayed(Duration(milliseconds: 500), () {
        showSuccessImage.value = false;
      });
    });
  }
}

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
  late final _mainController = Get.find<MainController>();
  late final _budget = Get.find<WeeklyBudgetsController>();
  late final _point = Get.find<PointController>();
  late final _battle = Get.find<BattleController>();

  // 예산 설정 안내 문구 상태 변수
  bool _showBudgetHint = true;

  @override
  void initState() {
    super.initState();

    /// 추후에 푸시알림 테스트 할때 사용
    // FirebaseController().showFcmToken(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _budget.getWeeklyBudgets();
      _budget.getLeftWeeklyBudgets();
      _point.getPoint();
      _point.getPointLevelBar();
      _battle.getBattleInProgress();
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
        final List<MemberProgressBattleResponse> battleListInProgress =
            _battle.battleListInProgress;
        final budget = _budget.weeklyBudget;
        final budgetLeft = _budget.weeklyBudgetLeft;
        final point = _point.point.value;
        final PointLevelBarResponse pointLevelBar = _point.pointLevelBar.value;

        print('#Home# budget: ${budget}');
        print('#Home# point: ${point}');
        print('#Home# pointLevelBar: ${pointLevelBar}');
        print('#Home# battleListInProgress: ${battleListInProgress}');

        /// [MEMO] levelRange == 0일경우 NavBar의 레벨 게이지바에서 에러나옴.
        /// 임시로 처리하였습니다.
        if (pointLevelBar.levelRange == 0) {
          return LoadingScreen();
        }
        return Scaffold(
          // 네비게이션 바
          appBar: NavBar(
            budget: budget,
            budgetLeft: budgetLeft,
            point: point,
            pointLevelBar: pointLevelBar,
          ),
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
                        fit: BoxFit.contain,
                        repeat: ImageRepeat.repeatX,
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

                // 예산 설정 완료 시 Ready 이미지 출력
                Obx(() {
                  if (_mainController.showSuccessImage.value) {
                    return Positioned(
                      top: 44,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: AnimatedOpacity(
                          opacity: _mainController.opacity.value,
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            width: 180,
                            height: 44,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/main_page/ready.png'), // 성공 이미지 경로
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),

                // 중간 배경 이미지
                Positioned(
                  top: 182,
                  width: deviceWidth,
                  height: 75,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/main_page/background_2.png'),
                        fit: BoxFit.contain,
                        repeat: ImageRepeat.repeatX,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),

                // 예산 설정 안내 문구
                if (budget.exist == false && _showBudgetHint)
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            alignment: Alignment.center,
                            // width: 242,
                            height: 30,
                            child: Row(
                              children: [
                                Text(
                                  "예산을 설정해야 배틀이 가능해요!",
                                  style: CTextStyles.Body3(),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: IconButton(
                                    padding: EdgeInsets.only(left: 10),
                                    constraints: BoxConstraints(),
                                    onPressed: () {
                                      // 예산 설정 알림 상태 업데이트
                                      setState(() {
                                        _showBudgetHint = false;
                                      });

                                      AudioController().play(
                                        audioType: AudioType.complete,
                                      );
                                    },
                                    icon: Icon(Icons.close),
                                    iconSize: 20,
                                    color: CColors.white,
                                  ),
                                ),
                              ],
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
                                    MainCarouselSlider(
                                        battleListInProgress:
                                            _battle.battleListInProgress),
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  MainCarouselSlider(
                                      battleListInProgress:
                                          _battle.battleListInProgress),
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

// 예산 설정 안내 문구 말풍선 삼각형
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
