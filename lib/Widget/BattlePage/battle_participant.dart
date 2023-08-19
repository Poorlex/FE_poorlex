import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Controller/battle_controller.dart';

class BattleParticipant extends StatefulWidget {
  const BattleParticipant({super.key});

  @override
  State<BattleParticipant> createState() => _BattleParticipantState();
}

class _BattleParticipantState extends State<BattleParticipant> {
  @override
  Widget build(BuildContext context) {
    return GetX<BattleController>(
        init: BattleController(),
        builder: (_con) => Text('${_con.battleIndex().PageNumber}',
            style: TextStyle(color: Colors.white)));
  }
}
