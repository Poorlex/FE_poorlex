import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:poorlex/Widget/Common/Buttons.dart';

import 'BattleBudget.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/Battle.dart';

class BattleIndexZero extends StatelessWidget {
  BattleController battle = Get.find<BattleController>();

  BattleIndexZero({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 180, height: 80, child:
          Text('어떤 배틀방을 만들어 볼까요?', style: CTextStyles.Title1(height: 1.4)),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Text('배틀방 난이도', style: CTextStyles.Body3(color: CColors.gray40)),
            Icon(Icons.question_mark_rounded, color: CColors.gray40, size: 14)
          ],
        ),
        SizedBox(height: 20),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CButton(
                onPressed: () {
                },
                child: Row(children: [
                  Text('쉬워요', style: CTextStyles.Body3(color: battle.EasyButtonColor.value)),
                  Image.asset(width: 23, height: 16, 'assets/my_page/icon_cooper.png'),
                ]),
              )
              /*OutlinedButton(
                style: OutlinedButton.styleFrom(side: BorderSide(color: battle.EasyButtonColor.value)),
                onPressed: () {
                  battle.changeBattleDifficulty('Easy');
                  battle.changeButtonColor();
                  battle.budgetListUpdate();
                },
                child: Row(children: [
                  Text('쉬워요', style: CTextStyles.Body3(color: battle.EasyButtonColor.value)),
                  Image.asset(width: 23, height: 16, 'assets/my_page/icon_cooper.png'),
                ]),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(side: BorderSide(color: battle.MiddleButtonColor.value)),
                onPressed: () {
                  battle.changeBattleDifficulty('Middle');
                  battle.changeButtonColor();
                  battle.budgetListUpdate();
                },
                child: Row(children: [
                  Text('보통이에요', style: CTextStyles.Body3(color: battle.MiddleButtonColor.value)),
                  Image.asset(width: 23, height: 16, 'assets/my_page/icon_silver.png'),
                ]),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(side: BorderSide(color: battle.HardButtonColor.value)),
                onPressed: () {
                  battle.changeBattleDifficulty('Hard');
                  battle.changeButtonColor();
                  battle.budgetListUpdate();
                },
                child: Row(children: [
                  Text('어려워요', style: CTextStyles.Body3(color: battle.HardButtonColor.value)),
                  Image.asset(width: 23, height: 16, 'assets/my_page/icon_gold.png'),
                ]),
              )*/
            ]
          );
        }),
        SizedBox(height: 50),
        Row(
          children: [
            Text('배틀방 예산', style: CTextStyles.Body3(color: CColors.gray40))
          ],
        ),
        SizedBox(height: 20),
        BattleBudget()
      ],
    );
  }
}
