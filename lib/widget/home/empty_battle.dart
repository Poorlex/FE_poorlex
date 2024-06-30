import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/weekly_budgets.dart';
import 'package:poorlex/libs/theme.dart';

import 'package:poorlex/screen/battle/battle_create.dart';
import 'package:poorlex/widget/bottom_sheet/bottom_sheet_with_beggar.dart';
import 'package:poorlex/widget/gnb_layout.dart';

class EmptyBattle extends StatelessWidget {
  const EmptyBattle({super.key});

  @override
  Widget build(BuildContext context) {
    final _weeklyBudgetsController = Get.find<WeeklyBudgetsController>();
    // 주간 예산 등록 여부
    final budgetExist = _weeklyBudgetsController.weeklyBudget.exist;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double secondContainerWidth = constraints.maxWidth - 6;

        return GestureDetector(
          onTap: () async {
            /// [TODO] 예산 미설정 시 예산 설정 페이지로 라우팅
            if (!budgetExist) {
              final result = await BottomSheetWithBeggar.show(
                context: context,
                beggarAction: BeggarAction.suggestionBudget,
              );

              if (result == false) {
                Get.toNamed('/budget', arguments: {'fromEmptyBattle': true});
              } else if (result == true) {
                print(result);
                Get.offAllNamed(
                  '/main',
                  id: GNBLayout.globalKey,
                  arguments: {
                    "gnb-index": 0,
                  },
                );
              }
            }

            // 배틀 페이지로 이동
            else {
              Get.to(() => BattleCreate());
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(color: CColors.blackOpa80),
                width: secondContainerWidth + 6,
                height: 144,
              ),
              Container(
                width: secondContainerWidth,
                height: 150,
                decoration: BoxDecoration(color: CColors.blackOpa80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 36),
                    SizedBox(
                      width: 34,
                      height: 34,
                      child: Image.asset('assets/main_page/empty_battle.png'),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '배틀 방 만들기',
                      style: CTextStyles.Title3(
                        color: CColors.gray70,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
