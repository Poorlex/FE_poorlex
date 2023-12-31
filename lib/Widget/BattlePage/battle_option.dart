import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Controller/battle_controller.dart';
import 'package:poorlex/Widget/Common/tab.dart';
import 'battle_finding.dart';
import 'battle_finished.dart';
import 'battle_participant.dart';

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
            SizedBox(height: 8,),
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

    return Column(
      children: [
        Obx(() => Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  if (_battle.battleIndex().PageNumber == 0) ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: () {
                        _battle.changeBattleIndex(0);
                      },
                      child: Column(
                        children: [
                          Text('탐색', style: TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(height: 10),
                          Container(height: 2, width: 40, decoration: BoxDecoration(color: Color(0xffffd600))),
                        ],
                      ),
                    ),
                  ] else ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: () {
                        _battle.changeBattleIndex(0);
                      },
                      child: Column(
                        children: [
                          Text('탐색', style: TextStyle(color: Color(0xff999999), fontSize: 20)),
                          SizedBox(height: 10),
                          Container(height: 2, width: 40, decoration: const BoxDecoration(color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                  if (_battle.battleIndex().PageNumber == 1) ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: () {
                        _battle.changeBattleIndex(1);
                      },
                      child: Column(
                        children: [
                          Text('참여중', style: TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(height: 10),
                          Container(height: 2, width: 60, decoration: BoxDecoration(color: Color(0xffffd600))),
                        ],
                      ),
                    ),
                  ] else ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: () {
                        _battle.changeBattleIndex(1);
                      },
                      child: Column(
                        children: [
                          Text('참여중', style: TextStyle(color: Color(0xff999999), fontSize: 20)),
                          SizedBox(height: 10),
                          Container(height: 2, width: 60, decoration: BoxDecoration(color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                  if (_battle.battleIndex().PageNumber == 2) ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: () {
                        _battle.changeBattleIndex(2);
                      },
                      child: Column(
                        children: [
                          Text('완료된', style: TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(height: 10,),
                          Container(height: 2, width: 60, decoration: BoxDecoration(color: Color(0xffffe600))),
                        ],
                      ),
                    ),
                  ] else ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        _battle.changeBattleIndex(2);
                      },
                      child: Column(
                        children: [
                          Text('완료된', style: TextStyle(color: Color(0xff999999), fontSize: 20)),
                          SizedBox(height: 10),
                          Container(height: 2, width: 60, decoration: BoxDecoration(color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 8,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    if (_battle.battleIndex().PageNumber == 0) Expanded(child: BattleFinding())
                    else if (_battle.battleIndex().PageNumber == 1) Expanded(child: BattleParticipant())
                    else if (_battle.battleIndex().PageNumber == 2) Expanded(child: BattleFinished())
                  ],
                ),
              )
            ]
          )
        ))
      ],
    );
  }
}
