import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/libs/number_format.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/battle/battle_money_bar.dart';
import 'package:poorlex/widget/common/image/image_network.dart';

class BattleParticipant extends GetView<BattleController> {
  BattleParticipant({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final battleListInProgress = controller.battleListInProgress;
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        itemBuilder: (context, idx) {
          final progressBattle = battleListInProgress[idx];
          return GestureDetector(
              onTap: () {
                Get.toNamed('/battle/ranking');
              },
              child: Container(
                  padding: EdgeInsets.only(
                    top: 11,
                    bottom: 9,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          BattleMoneyBar(
                            budget: progressBattle.budgetLeft,
                          ),
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1),
                              color: CColors.gray40,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 6),

                            /// [TODO] dday정보 필요
                            child: Text(
                              'D-${progressBattle.dday}',
                              style: CTextStyles.Body3(height: 16 / 14),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${progressBattle.name}',
                                style: CTextStyles.Body2(),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    "존버 금액:${formatCurrencyWithWon(progressBattle.budgetLeft)}",
                                    style: CTextStyles.Body2(
                                      color: CColors.gray50,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 19),
                              RichText(
                                text: TextSpan(
                                  style: CTextStyles.Title2(
                                    color: CColors.purpleLight,
                                    height: 34 / 22,
                                    fontFamily: 'NeoDunggeunmoPro-Regular',
                                  ),
                                  text:
                                      "${progressBattle.currentParticipantRank}위",
                                  children: [
                                    TextSpan(
                                      style:
                                          CTextStyles.Title2(height: 34 / 22),
                                      text:
                                          "/${progressBattle.battleParticipantCount}명",
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          CImageNetwork(
                            width: 90,
                            height: 90,
                            src: progressBattle.imageUrl,
                          ),
                        ],
                      )
                    ],
                  )));
        },
        itemCount: battleListInProgress.length,
      );
    });
  }
}
