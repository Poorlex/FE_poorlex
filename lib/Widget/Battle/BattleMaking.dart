import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:poorlex/Widget/Battle/Making/BattleIndexZero.dart';
import 'package:poorlex/Widget/Battle/Making/BattleIndexThree.dart';

import 'package:poorlex/Widget/Battle/Making/BattleProcess.dart';
import 'package:poorlex/Widget/Battle/Making/BattleIndexOne.dart';
import 'package:poorlex/Widget/Battle/Making/BattleIndexTwo.dart';
import 'package:poorlex/Widget/Battle/Making/BattleMakingFinished.dart';

import 'package:poorlex/Controller/Battle.dart';

class BattleMaking extends GetView {
  const BattleMaking({super.key});

  @override
  Widget build(BuildContext context) {
    BattleController con = Get.put(BattleController());
    con.battleMakingIndex().BattleIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('배틀방 만들기', style: TextStyle(color: Colors.white, fontSize: 17))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
            onPressed: () {
              con.changeBattleMakingIndex();
            },
            child: Obx(() => Text(
                con.battleMakingIndex().BattleIndex == 4 ? '시작' : '다음',
                style: TextStyle(color: Colors.black))),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xffffd600)),
            )),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 26,
          ),
          BattleProcess(),
          Obx(() {
            if (con.battleMakingIndex().BattleIndex == 0) {
              return BattleIndexZero();
            } else if (con.battleMakingIndex().BattleIndex == 1) {
              return BattleIndexOne();
            } else if (con.battleMakingIndex().BattleIndex == 2) {
              return BattleIndexTwo();
            } else if (con.battleMakingIndex().BattleIndex == 3) {
              return BattleIndexThree();
            } else if (con.battleMakingIndex().BattleIndex == 4) {
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
