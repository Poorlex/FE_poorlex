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

import 'package:poorlex/Widget/Common/Buttons.dart';
import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Layout.dart';

class BattleCreate extends StatefulWidget {
  const BattleCreate({super.key});

  @override
  State<BattleCreate> createState() => _BattleCreateState();
}

class _BattleCreateState extends State<BattleCreate> {
  BattleController battle = Get.find<BattleController>();

  @override
  void initState() {
    super.initState();
    battle.changeCurrent(0);
  }

  void changePage () async {
    print(battle.battleCreate.value.current);
    if (battle.battleCreate.value.current == 2) {
      if (await battle.saveBattle()) {
        battle.changeCurrent(
            battle.battleCreate.value.current + 1);
      }
    } else {
      battle.changeCurrent(
          battle.battleCreate.value.current + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CColors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CButton(
                child: CIcon(
                    icon: 'arrow-left',
                    width: 26,
                    height: 26,
                    color: CColors.whiteStr),
                onPressed: () => Get.back(),
              ),
              Text('배틀방 만들기', style: CTextStyles.Headline()),
              SizedBox(width: 26)
            ],
          ),
        ),
        backgroundColor: CColors.black,
        body: Layout(
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Column(
                          children: [
                            SizedBox(height: 26),
                            BattleProcess(),
                            SizedBox(height: 18),
                            Obx(() {
                              return Container(
                                  child:
                                  battle.battleCreate.value.current == 0
                                      ? BattleIndexZero()
                                      : battle.battleCreate.value.current ==
                                      1
                                      ? BattleIndexOne()
                                      : battle.battleCreate.value.current ==
                                      2
                                      ? BattleIndexTwo()
                                      : BattleMakingFinished()
                              );
                            })
                          ],
                        ),
                      ),
                    )),
                Row(
                  children: [
                    Expanded(
                        child: Obx(() {
                          if (battle.battleCreate.value.current == 3) {
                            return CButton(
                                padding: EdgeInsets.symmetric(vertical: 14),
                                color: CColors.yellow,
                                type: ButtonTypes.elevated,
                                onPressed: () => Get.offAndToNamed('/battle'),
                                child: Text(
                                  '시작!',
                                  style: CTextStyles.Title3(color: CColors.black),
                                )
                            );
                          } else {
                            return CButton(
                                padding: EdgeInsets.symmetric(vertical: 14),
                                color: CColors.yellow,
                                type: ButtonTypes.elevated,
                                onPressed: () => changePage(),
                                child: Text(
                                  '다음',
                                  style: CTextStyles.Title3(color: CColors.black),
                                )
                            );
                          }
                        })
                    )
                  ]
                )
              ],
            )));
  }
}
