import 'package:flutter/material.dart';
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
          return GestureDetector(
              onTap: () {
                Get.toNamed('/battle/ranking');
              },
              child: Container(
                  padding: EdgeInsets.only(
                    top: 11,
                    bottom: 14,
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          BattleMoneyBar(
                            budget: battleListInProgress[idx].budgetLeft,
                          ),
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1),
                                color: CColors.gray40),
                            padding: EdgeInsets.symmetric(horizontal: 6),

                            /// [TODO] dday정보 필요
                            child: Text('D-7', style: CTextStyles.Body3()),
                          )
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${battleListInProgress[idx].name}',
                                style: CTextStyles.Body2(),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    "존버 금액:${formatCurrencyWithWon(battleListInProgress[idx].budgetLeft)}",
                                    style: CTextStyles.Body2(
                                      color: CColors.gray50,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          CImageNetwork(
                            width: 90,
                            height: 90,
                            src: battleListInProgress[idx].imageUrl,
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
