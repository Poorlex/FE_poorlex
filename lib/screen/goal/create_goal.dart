import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/Controller/Goal.dart';
import 'package:poorlex/widget/battle/making/battle_making_finished.dart';
import 'package:poorlex/widget/battle/making/battle_index_one.dart';
import 'package:poorlex/widget/battle/making/battle_index_three.dart';
import 'package:poorlex/widget/battle/making/battle_index_two.dart';
import 'package:poorlex/widget/battle/making/battle_process.dart';
import 'package:poorlex/widget/goal/create_goal.dart';

class CreateGoalPage extends StatefulWidget {
  const CreateGoalPage({super.key});

  @override
  State<CreateGoalPage> createState() => _CreateGoalPage();
}

class _CreateGoalPage extends State<CreateGoalPage> {
  @override
  Widget build(BuildContext context) {
    return Expanding();
  }
}

class Expanding extends StatefulWidget {
  @override
  _MyExpandingState createState() => _MyExpandingState();
}

class _MyExpandingState extends State<Expanding> {
  GoalController con = Get.put(GoalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.black,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('배틀방 만들기', style: CTextStyles.Body1())],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
            onPressed: () {
              con.addBattleMakingIndex();
            },
            child: Obx(() => Text(
                con.goalIndexModel.value.goalIndex == 4 ? '시작' : '다음',
                style: CTextStyles.Body3(color: CColors.black))),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(CColors.yellow),
            )),
      ),
      backgroundColor: CColors.black,
      body: Column(
        children: [
          SizedBox(
            height: 26,
          ),
          BattleProcess(),
          Obx(() {
            if (con.goalIndexModel.value.goalIndex == 0) {
              return CreateGoalFirst();
            } else if (con.goalIndexModel.value.goalIndex == 1) {
              return BattleIndexOne();
            } else if (con.goalIndexModel.value.goalIndex == 2) {
              return BattleIndexTwo();
            } else if (con.goalIndexModel.value.goalIndex == 3) {
              return BattleIndexThree();
            } else if (con.goalIndexModel.value.goalIndex == 4) {
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
