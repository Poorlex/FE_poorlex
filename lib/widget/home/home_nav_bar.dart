import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poorlex/libs/number_format.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/schema/weekly_budget_response/weekly_budget_response.dart';

import 'package:poorlex/screen/budget/budget_page.dart';

// TODO: budgetMoney 상태변경을 위해 StatelessWidget 위젯을 StatefulWidget 위젯으로 변경
class NavBar extends StatefulWidget implements PreferredSizeWidget {
  final WeeklyBudgetResponse budget;

  const NavBar({
    super.key,
    required this.budget,
  });

  @override
  State<NavBar> createState() => _NavBarState();

  @override
  Size get preferredSize => const Size.fromHeight(90);
}

class _NavBarState extends State<NavBar> {
  // 천 단위마다 콤마 표기
  // intl 패키지 사용
  late String budgetWithWon;
  late String budgetMoney;

  String level = '4';

  @override
  void initState() {
    super.initState();
    // 천 단위마다 콤마 표기
    final formatter = NumberFormat('#,###');
    budgetMoney = formatter.format(widget.budget.amount);
    budgetWithWon = formatCurrencyWithWon(widget.budget.amount);

    print("###@ $budgetMoney");
    print("###@ $budgetWithWon");
  }

  @override
  Widget build(BuildContext context) {
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
                                '$budgetMoney',
                                style: CTextStyles.Body2(),
                              ),

                              // 원
                              Text(
                                '원',
                                style: CTextStyles.Body2(),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // 남은 날짜
                      Container(
                        alignment: Alignment.center,
                        width: 34,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: CColors.gray40,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                          ),
                          child: Text(
                            'D-7',
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
                'LV.$level',
                style: CTextStyles.Body2(color: CColors.yellow),
              ),
              // Text('Progress Bar'),
              Container(
                width: 240,
                height: 8,
                child: Row(
                  children: [
                    Container(
                      width: 240 * 0.04,
                      child: Container(
                        color: CColors.yellow,
                      ),
                    ),
                    Container(
                      width: 240 * 0.96,
                      child: Container(
                        color: CColors.gray20,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '+256 P',
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BudgetPage(),
                          ),
                        );
                      },
                      child: Text(
                        budgetMoney,
                        style: CTextStyles.Title3(),
                      ),
                    )
                  ],
                ),

                // 지출 금액
                Text(
                  '-32,000원',
                  style: CTextStyles.Body2(
                    color: CColors.purpleLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
