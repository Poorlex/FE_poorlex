import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/Battle.dart';

import 'package:poorlex/Widget/Battle/BattleMaking.dart';
import 'package:poorlex/Widget/Battle/BattleOption.dart';
import 'package:poorlex/Widget/Main/BottomBar.dart';

class BattlePage extends GetView {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    BattleController _battle = Get.put(BattleController());
    return Scaffold(
      bottomNavigationBar: BottomBar(nowPage: 2),
      backgroundColor: CustomColors.black,
      appBar: AppBar(
          backgroundColor: CustomColors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('배틀', style: TextStyle(color: CustomColors.white, fontSize: 26)),
              Container(
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.question_mark),
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
          )
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: BattleOption(PageIndex: _battle.battleIndex().PageNumber),
            )
          ],
        ),
      )
    );
  }
}
