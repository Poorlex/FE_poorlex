import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Controller/battle_controller.dart';

class BattleFinished extends StatefulWidget {
  const BattleFinished({super.key});

  @override
  State<BattleFinished> createState() => _BattleFinishedState();
}

class _BattleFinishedState extends State<BattleFinished> {
  @override
  Widget build(BuildContext context) {
    return GetX<BattleController>(
        init: BattleController(),
        builder: (_con) => Text('${_con.battleIndex().PageNumber}',
            style: TextStyle(color: Colors.white)));
  }
}
