import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Widget/BattlePage/battle_finding.dart';
import 'package:poorlex/Widget/BattlePage/battle_making.dart';

import 'package:poorlex/Controller/battle_controller.dart';
import 'package:poorlex/Controller/battle_controller.dart';
import 'package:poorlex/Widget/BattlePage/battle_finished.dart';
import 'package:poorlex/Widget/BattlePage/battle_option.dart';
import 'package:poorlex/Widget/BattlePage/battle_participant.dart';
import 'package:poorlex/Widget/MainPageWidget/bottom_bar.dart';

class BattlePage extends GetView {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    BattleController _battle = Get.put(BattleController());
    return Scaffold(
      bottomNavigationBar: BottomBar(nowPage: 2),
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '배틀',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.question_mark,
                      ),
                      iconSize: 26,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(BattleMaking());
                      },
                      icon: Icon(Icons.add),
                      iconSize: 26,
                    ),
                  ],
                ),
              ),
            ],
          )),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Obx(() => BattleOption(PageIndex: _battle.battleIndex().PageNumber)),
        ],
      ),
    );
  }
}
