import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/libs/number_format.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/battle/battle_empty.dart';
import 'package:poorlex/widget/battle/battle_money_bar.dart';
import 'package:poorlex/widget/common/image/image_network.dart';
import 'package:poorlex/widget/gnb_layout.dart';

class BattleParticipant extends GetView<BattleController> {
  BattleParticipant({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final battleListInProgress = controller.battleListInProgress;
      if (battleListInProgress.isEmpty) {
        return Column(
          children: [
            SizedBox(height: 144),
            BattleEmpty(
              text: "참여중인 배틀이 없습니다.",
            ),
          ],
        );
      }
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        itemBuilder: (context, idx) {
          final progressBattle = battleListInProgress[idx];

          return GestureDetector(
            onTap: progressBattle.dday > 6
                ? () async {
                    await Get.toNamed(
                      '/battle/detail',
                      arguments: {
                        'battleId': progressBattle.battleId,
                      },
                      id: GNBLayout.globalKey,
                    );
                  }
                : () {
                    Get.toNamed(
                      '/battle/ranking',
                      arguments: {
                        'battleId': progressBattle.battleId,
                      },
                      id: GNBLayout.globalKey,
                    );
                  },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        BattleMoneyBar(
                          budget: progressBattle.budgetLeft,
                        ),
                        SizedBox(width: 10, height: 22),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            color: CColors.gray30,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            progressBattle.dday > 6
                                ? "예정"
                                : 'D-${progressBattle.dday}',
                            style: CTextStyles.Body3(height: 16 / 14),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${progressBattle.name}',
                          style: CTextStyles.Body2(
                            height: 22 / 16,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              "남은 예산:${formatCurrencyWithWon(progressBattle.budgetLeft)}",
                              style: CTextStyles.Body2(
                                color: CColors.gray40,
                                height: 22 / 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 19),
                        RichText(
                          text: TextSpan(
                            style: CTextStyles.Title2(
                              color: progressBattle.currentParticipantRank <= 3
                                  ? CColors.purpleLight
                                  : null,
                              height: 34 / 22,
                              fontFamily: 'NeoDunggeunmoPro-Regular',
                            ),
                            text: "${progressBattle.currentParticipantRank}위",
                            children: [
                              TextSpan(
                                style: CTextStyles.Title2(height: 34 / 22),
                                text:
                                    "/${progressBattle.battleParticipantCount}명",
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 46, bottom: 14),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: CImageNetwork(
                    width: 90,
                    height: 90,
                    src: progressBattle.imageUrl,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: battleListInProgress.length,
      );
    });
  }
}
