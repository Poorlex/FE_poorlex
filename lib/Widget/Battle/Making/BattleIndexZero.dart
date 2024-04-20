import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:poorlex/Widget/Common/Buttons.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/Battle.dart';

import 'package:poorlex/Models/Battle.dart';

class BattleIndexZero extends StatelessWidget {
  BattleController battle = Get.find<BattleController>();

  BattleIndexZero({super.key});

  @override
  Widget build(BuildContext context) {
    var difficulty = battle.battleCreate.value.difficulty;
    var budget = battle.battleCreate.value.budget;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 180,
          height: 80,
          child:
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
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          CButton(
            type: ButtonTypes.outlined,
            color: EBattleDifficulty.easy == difficulty
                ? CColors.yellow
                : CColors.gray41,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
            child: Row(children: [
              Text('쉬워요',
                  style: CTextStyles.Body3(
                      color: EBattleDifficulty.easy == difficulty
                          ? CColors.yellow
                          : CColors.gray41)),
              Image.asset(
                  width: 30, height: 22, 'assets/my_page/icon_cooper.png'),
            ]),
            onPressed: () => battle.changeDifficulty(EBattleDifficulty.easy),
          ),
          SizedBox(width: 14),
          CButton(
            type: ButtonTypes.outlined,
            color: EBattleDifficulty.normal == difficulty
                ? CColors.yellow
                : CColors.gray41,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
            child: Row(children: [
              Text('보통이에요',
                  style: CTextStyles.Body3(
                      color: EBattleDifficulty.normal == difficulty
                          ? CColors.yellow
                          : CColors.gray41)),
              Image.asset(
                  width: 30, height: 22, 'assets/my_page/icon_silver.png'),
            ]),
            onPressed: () => battle.changeDifficulty(EBattleDifficulty.normal),
          ),
          SizedBox(width: 14),
          CButton(
            type: ButtonTypes.outlined,
            color: EBattleDifficulty.hard == difficulty
                ? CColors.yellow
                : CColors.gray41,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
            child: Row(children: [
              Text('어려워요',
                  style: CTextStyles.Body3(
                      color: EBattleDifficulty.hard == difficulty
                          ? CColors.yellow
                          : CColors.gray41)),
              Image.asset(
                  width: 30, height: 22, 'assets/my_page/icon_gold.png'),
            ]),
            onPressed: () => battle.changeDifficulty(EBattleDifficulty.hard),
          ),
        ]),
        SizedBox(height: 50),
        Row(
          children: [
            Text('배틀방 예산', style: CTextStyles.Body3(color: CColors.gray40))
          ],
        ),
        SizedBox(height: 20),
        Wrap(
            spacing: 16,
            runSpacing: 12,
            children: battle.BudgetList.map((item) {
              return CButton(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                type: ButtonTypes.outlined,
                child: Text('${item}만원',
                    style: CTextStyles.Body3(
                        color:
                            budget == item ? CColors.yellow : CColors.gray40)),
                color: budget == item ? CColors.yellow : CColors.gray40,
                onPressed: () => battle.changeBudget(item),
              );
            }).toList())
      ],
    );
  }
}
