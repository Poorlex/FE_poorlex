import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/battle_controller.dart';
import 'battle_finding.dart';
import 'battle_finished.dart';
import 'battle_money.dart';
import 'battle_participant.dart';

class BattleOption extends GetView {
  final int PageIndex;
  const BattleOption({super.key, required this.PageIndex});

  @override
  Widget build(BuildContext context) {
    final BattleController _battle = Get.put(BattleController());

    print(_battle.battleIndex().PageNumber);

    return Column(
      children: [
        Obx(
          () => Column(
            children: [
              Row(
                children: [
                  if (_battle.battleIndex().PageNumber == 0) ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        _battle.changeBattleIndex(0);
                      },
                      child: Column(
                        children: [
                          Text('탐색',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 2,
                            width: 40,
                            decoration:
                                const BoxDecoration(color: Color(0xffffd600)),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        _battle.changeBattleIndex(0);
                      },
                      child: Column(
                        children: [
                          Text('탐색',
                              style: TextStyle(
                                  color: Color(0xff999999), fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 2,
                            width: 40,
                            decoration:
                                const BoxDecoration(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (_battle.battleIndex().PageNumber == 1) ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        _battle.changeBattleIndex(1);
                      },
                      child: Column(
                        children: [
                          Text('참여중',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 2,
                            width: 60,
                            decoration:
                                const BoxDecoration(color: Color(0xffffd600)),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        _battle.changeBattleIndex(1);
                      },
                      child: Column(
                        children: [
                          Text('참여중',
                              style: TextStyle(
                                  color: Color(0xff999999), fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 2,
                            width: 60,
                            decoration:
                                const BoxDecoration(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (_battle.battleIndex().PageNumber == 2) ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        _battle.changeBattleIndex(2);
                      },
                      child: Column(
                        children: [
                          Text('완료된',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 2,
                            width: 60,
                            decoration:
                                const BoxDecoration(color: Color(0xffffe600)),
                          ),
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
                          Text('완료된',
                              style: TextStyle(
                                  color: Color(0xff999999), fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 2,
                            width: 60,
                            decoration:
                                const BoxDecoration(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
              BattleMoney(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  if (_battle.battleIndex().PageNumber == 0) ...[
                    Obx(() => BattleFinding(
                        PageIndex: _battle.battleIndex().PageNumber))
                  ] else if (_battle.battleIndex().PageNumber == 1) ...[
                    Obx(() => BattleParticipant(
                        PageIndex: _battle.battleIndex().PageNumber))
                  ] else if (_battle.battleIndex().PageNumber == 2) ...[
                    Obx(() => BattleFinished(
                        PageIndex: _battle.battleIndex().PageNumber))
                  ]
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
