import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Controller/battle_controller.dart';

class BattleFinding extends StatefulWidget {
  const BattleFinding({super.key});

  @override
  State<BattleFinding> createState() => _BattleFindingState();
}

class _BattleFindingState extends State<BattleFinding> {
  @override
  Widget build(BuildContext context) {
    return GetX<BattleController>(
      init: BattleController(),
      builder: (_con) => Text('${_con.battleIndex().PageNumber}',
          style: TextStyle(color: Colors.white)),
    );
  }
}
