import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/Goal.dart';

import 'package:poorlex/Widget/Battle/Making/BattleProcess.dart';
import 'package:poorlex/Widget/Battle/Making/BattleIndexOne.dart';
import 'package:poorlex/Widget/Battle/Making/BattleIndexThree.dart';
import 'package:poorlex/Widget/Battle/Making/BattleIndexTwo.dart';
import 'package:poorlex/Widget/Battle/Making/BattleMakingFinished.dart';
import 'package:poorlex/Widget/Goal/CreateGoal.dart';

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
        backgroundColor: CustomColors.black,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('배틀방 만들기', style: CustomTextStyles.Body1())
          ],
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
                style: CustomTextStyles.Body3(color: CustomColors.black))),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(CustomColors.yellow),
            )),
      ),
      backgroundColor: CustomColors.black,
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
