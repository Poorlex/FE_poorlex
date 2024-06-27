import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/libs/number_format.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/battle/battle_completed_image.dart';
import 'package:poorlex/widget/battle/battle_empty.dart';
import 'package:poorlex/widget/battle/battle_money_bar.dart';

class BattleFinished extends GetView<BattleController> {
  const BattleFinished({super.key});

  String getPastDayToWeek(int pastDay) {
    return "${(-1 * pastDay ~/ 7) + 1}주전";
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final battleListInCompleted = controller.battleListInCompleted;
      if (battleListInCompleted.isEmpty) {
        return Column(
          children: [
            SizedBox(height: 144),
            BattleEmpty(text: "완료된 배틀이 없습니다."),
          ],
        );
      }
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, idx) {
          final battleInCompleted = battleListInCompleted[idx];
          final isFailure = battleInCompleted.budgetLeft < 0;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        BattleMoneyBar(budget: battleInCompleted.budget),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            color: CColors.gray20,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            getPastDayToWeek(battleInCompleted.pastDay),
                            style: CTextStyles.Caption2(
                              color: Color.fromRGBO(126, 126, 126, 1),
                              height: 16 / 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    '${battleInCompleted.name}',
                    style: CTextStyles.Body2(
                      height: 22 / 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '존버 금액 : ${formatCurrencyWithWon(battleInCompleted.budgetLeft)}',
                    style: CTextStyles.Body2(
                      color: CColors.gray50,
                      height: 22 / 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  if (!isFailure)
                    Row(
                      children: [
                        Text(
                          '${battleInCompleted.currentParticipantRank}위',
                          style: CTextStyles.Title1(
                            height: 32 / 22,
                          ),
                        ),
                        Text(
                          '/${battleInCompleted.battleParticipantCount}명',
                          style: CTextStyles.Title1(
                            height: 32 / 22,
                          ),
                        ),
                        if (battleInCompleted.currentParticipantRank == 1) ...[
                          SizedBox(width: 20),
                          Container(
                            height: 24,
                            decoration: BoxDecoration(
                              color: CColors.yellow,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                            ),
                            child: Text(
                              '+${battleInCompleted.earnedPoint}',
                              style: CTextStyles.Title1(
                                color: CColors.black,
                              ),
                            ),
                          )
                        ]
                      ],
                    )
                  else
                    Text(
                      "실패",
                      style: CTextStyles.Title1(),
                    )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 46, bottom: 14),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                ),
                child: BattleCompletedImage(
                  rank: battleInCompleted.currentParticipantRank,
                  isFailure: isFailure,
                ),
              ),
            ],
          );
        },
        itemCount: battleListInCompleted.length,
      );
    });
  }
}
