import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/battle_controller.dart';
import 'battle_finding.dart';
import 'battle_finished.dart';
import 'battle_participant.dart';

class BattleOption extends StatefulWidget {
  const BattleOption({super.key});

  @override
  State<BattleOption> createState() => _BattleOptionState();
}

class _BattleOptionState extends State<BattleOption> {
  final BattleController _battle = Get.put(BattleController());

  @override
  Widget build(BuildContext context) {
    print(_battle.battleIndex().PageNumber);
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                _battle.changeBattleIndex(0);
              },
              child: Column(
                children: [
                  Text('탐색',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 2,
                    width: 40,
                    decoration: const BoxDecoration(color: Colors.amber),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                _battle.changeBattleIndex(1);
              },
              child: Column(
                children: [
                  Text('참여중',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 2,
                    width: 60,
                    decoration: const BoxDecoration(color: Colors.amber),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                _battle.changeBattleIndex(2);
              },
              child: Column(
                children: [
                  Text('완료된',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 2,
                    width: 60,
                    decoration: const BoxDecoration(color: Colors.amber),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (_battle.battleIndex().PageNumber == 0) ...[
          BattleFinding(),
        ],
        if (_battle.battleIndex().PageNumber == 1) ...[
          BattleParticipant(),
        ],
        if (_battle.battleIndex().PageNumber == 2) ...[
          BattleFinished(),
        ],
      ],
    );
  }
}
