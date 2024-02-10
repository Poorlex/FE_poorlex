import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Widget/Common/tab.dart';
import 'package:poorlex/Widget/Battle/BattleFinding.dart';

import 'package:poorlex/Widget/Battle/BattleFinished.dart';
import 'package:poorlex/Widget/Battle/BattleParticipant.dart';

import 'package:poorlex/Controller/Battle.dart';

class BattleOption extends GetView {
  final int PageIndex;
  const BattleOption({super.key, required this.PageIndex});

  @override
  Widget build(BuildContext context) {
    final BattleController _battle = Get.put(BattleController());

    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child:
        Column(
          children: [
            Row(children: [
              Expanded(child:
              Obx(() => CustomTab(
                  selected: _battle.battleIndex().PageNumber,
                  list: [
                    CustomTabItem(label: '탐색', value: 0, onClick: (v) => _battle.changeBattleIndex(v)),
                    CustomTabItem(label: '참여중', value: 1, onClick: (v) => _battle.changeBattleIndex(v)),
                    CustomTabItem(label: '완료된', value: 2, onClick: (v) => _battle.changeBattleIndex(v)),
                  ]
              ))
              )
            ]),
            SizedBox(height: 8),
            Expanded(
              child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  if (_battle.battleIndex().PageNumber == 0) Expanded(child: BattleFinding())
                  else if (_battle.battleIndex().PageNumber == 1) Expanded(child: BattleParticipant())
                  else if (_battle.battleIndex().PageNumber == 2) Expanded(child: BattleFinished())
                ],
              ))
            )
          ]
        )
    );
  }
}
