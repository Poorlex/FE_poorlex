import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:poorlex/Widget/Battle/Making/BattleIndexZero.dart';
import 'package:poorlex/Widget/Battle/Making/BattleIndexThree.dart';

import 'package:poorlex/Widget/Battle/Making/BattleProcess.dart';
import 'package:poorlex/Widget/Battle/Making/BattleIndexOne.dart';
import 'package:poorlex/Widget/Battle/Making/BattleIndexTwo.dart';
import 'package:poorlex/Widget/Battle/Making/BattleMakingFinished.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/Battle.dart';

class BattleCreating extends GetView {
  BattleCreating({super.key});

  @override
  Widget build(BuildContext context) {
    BattleController battle = Get.find<BattleController>();
    battle.battleMakingIndex().BattleIndex = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.black,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('배틀방 만들기', style: CTextStyles.Body1())
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          child: Obx(() => Text(battle.battleMakingIndex().BattleIndex == 4 ? '시작' : '다음', style: CTextStyles.Body3(color: CColors.black))),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(CColors.yellow)),
          onPressed: () {
            battle.changeBattleMakingIndex();
          },
        ),
      ),
      backgroundColor: CColors.black,
      body: Column(
        children: [
          SizedBox(
            height: 26,
          ),
          BattleProcess(),
          Obx(() {
            if (battle.battleMakingIndex().BattleIndex == 0) {
              return BattleIndexZero();
            } else if (battle.battleMakingIndex().BattleIndex == 1) {
              return BattleIndexOne();
            } else if (battle.battleMakingIndex().BattleIndex == 2) {
              return BattleIndexTwo();
            } else if (battle.battleMakingIndex().BattleIndex == 3) {
              return BattleIndexThree();
            } else if (battle.battleMakingIndex().BattleIndex == 4) {
              return BattleMakingFinished();
            } else {
              return BattleMakingFinished();
            }
          }),
        ],
      ),
    );
  }
}
