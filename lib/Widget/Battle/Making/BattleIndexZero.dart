import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'BattleBudget.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/Battle.dart';

class BattleIndexZero extends GetView {
  const BattleIndexZero({super.key});

  @override
  Widget build(BuildContext context) {
    BattleController con = Get.put(BattleController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Container(width: 180, height: 80, child:
            Text('어떤 배틀방을 만들어 볼까요?', style: TextStyle(fontSize: 26, color: CustomColors.white)),
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Text('배틀방 난이도', style: TextStyle(fontSize: 14, color: CustomColors.gary40)),
            Icon(Icons.question_mark_rounded, color: CustomColors.gary40, size: 14)
          ],
        ),
        SizedBox(height: 20),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(side: BorderSide(color: con.EasyButtonColor.value)),
                onPressed: () {
                  con.changeBattleDifficulty('Easy');
                  con.changeButtonColor();
                  con.budgetListUpdate();
                },
                child: Row(children: [
                  Text('쉬워요', style: TextStyle(color: con.EasyButtonColor.value)),
                  Image.asset(width: 23, height: 16, 'assets/my_page/icon_cooper.png'),
                ]),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(side: BorderSide(color: con.MiddleButtonColor.value)),
                onPressed: () {
                  con.changeBattleDifficulty('Middle');
                  con.changeButtonColor();
                  con.budgetListUpdate();
                },
                child: Row(children: [
                  Text('보통이에요', style: TextStyle(color: con.MiddleButtonColor.value)),
                  Image.asset(width: 23, height: 16, 'assets/my_page/icon_silver.png'),
                ]),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(side: BorderSide(color: con.HardButtonColor.value)),
                onPressed: () {
                  con.changeBattleDifficulty('Hard');
                  con.changeButtonColor();
                  con.budgetListUpdate();
                },
                child: Row(children: [
                  Text('어려워요', style: TextStyle(color: con.HardButtonColor.value)),
                  Image.asset(width: 23, height: 16, 'assets/my_page/icon_gold.png'),
                ]),
              )
            ]
          );
        }),
        SizedBox(height: 50),
        Row(
          children: [
            Text('배틀방 예산', style: TextStyle(fontSize: 14, color: CustomColors.gary40))
          ],
        ),
        SizedBox(height: 20),
        BattleBudget()
      ],
    );
  }
}
