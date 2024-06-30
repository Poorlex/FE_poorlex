import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/schema/point_level_bar_response/point_level_bar_response.dart';
import 'package:poorlex/schema/point_response/point_response.dart';
import 'package:poorlex/schema/weekly_budget_left_response/weekly_budget_left_response.dart';
import 'package:poorlex/schema/weekly_budget_response/weekly_budget_response.dart';

import 'package:poorlex/widget/common/buttons.dart';

/// [TODO] 레벨, 프로그레스바, 포인트, 지출, 남은 날짜
/// 유저 정보 반영하기
class NavBar extends StatefulWidget implements PreferredSizeWidget {
  final WeeklyBudgetResponse budget;
  final PointResponse point;
  final PointLevelBarResponse pointLevelBar;
  final WeeklyBudgetLeftResponse budgetLeft;
  const NavBar({
    super.key,
    required this.budget,
    required this.budgetLeft,
    required this.point,
    required this.pointLevelBar,
  });

  @override
  State<NavBar> createState() => _NavBarState();

  @override
  Size get preferredSize => const Size.fromHeight(90);
}

class _NavBarState extends State<NavBar> {
  // 현재 요일 계산
  int weekday = DateTime.now().weekday;

  // 예산 별 디데이 텍스트 계산
  String getRemainingDaysText() {
    switch (weekday) {
      case 1:
        return 'D-6'; // 월요일
      case 2:
        return 'D-5'; // 화요일
      case 3:
        return 'D-4'; // 수요일
      case 4:
        return 'D-3'; // 목요일
      case 5:
        return 'D-2'; // 금요일
      case 6:
        return 'D-1'; // 토요일
      case 7:
        return 'D-day'; // 일요일
      default:
        return 'D-?';
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');
    final budget = formatter.format(widget.budget.amount);
    final budgetLeft = formatter.format(widget.budgetLeft.left);

    /// 남은 예산 - 예산으로 사용한 금액 표현
    final usedBudgetMoney =
        formatter.format(widget.budgetLeft.left - widget.budget.amount);
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: CColors.black,
      title: Column(
        children: [
          // 예산, 남은 날짜
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Wrap(
                    spacing: 16,
                    children: [
                      Wrap(
                        spacing: 5,
                        children: [
                          // 깃발 아이콘
                          Icon(Icons.flag, size: 16),

                          Wrap(
                            spacing: 2,
                            children: [
                              // 예산 금액
                              Text(
                                widget.budget.exist == true
                                    ? '$budget 원'
                                    : '?원',
                                style: CTextStyles.Body2(),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // 남은 날짜
                      Container(
                        alignment: Alignment.center,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color:
                              weekday < 5 ? CColors.gray40 : Color(0xFFE33741),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                          ),
                          child: Text(
                            getRemainingDaysText(),
                            style: CTextStyles.Body3(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 9),

          // 레벨, 프로그레스바, 포인트
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LV.${widget.point.level}',
                style: CTextStyles.Body2(color: CColors.yellow),
              ),
              Container(
                width: 240,
                height: 8,
                child: Row(
                  children: [
                    Container(
                      width: 240 *
                          widget.pointLevelBar.currentPoint /
                          widget.pointLevelBar.levelRange,
                      child: Container(
                        color: CColors.yellow,
                      ),
                    ),
                    Container(
                      width: 240 *
                          (widget.pointLevelBar.levelRange -
                              widget.pointLevelBar.currentPoint) /
                          widget.pointLevelBar.levelRange,
                      child: Container(
                        color: CColors.gray20,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '+${widget.pointLevelBar.currentPoint} P',
                style: CTextStyles.Body2(color: CColors.yellow),
              ),
            ],
          ),

          SizedBox(height: 6),

          // 예산, 지출
          Container(
            height: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.budget.exist == true) ...[
                  Wrap(
                    spacing: 12,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      // 코인 이미지
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset('assets/coin.png'),
                      ),

                      // 예산 설정 금액
                      CButton(
                        onPressed: () => Get.toNamed('/budget'),
                        child: Text(
                          budgetLeft,
                          style: CTextStyles.Title3(),
                        ),
                      )
                    ],
                  ),

                  // 지출 금액
                  Text(
                    '${usedBudgetMoney} 원',
                    style: CTextStyles.Body2(
                      color: CColors.purpleLight,
                    ),
                  ),
                ] else ...[
                  CButton(
                    onPressed: () => Get.toNamed('/budget'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '예산 설정하기',
                          style: CTextStyles.Body2(color: CColors.white),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: CColors.gray41,
                        ),
                      ],
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
