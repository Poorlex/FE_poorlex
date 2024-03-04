import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/Battle.dart';

import 'package:poorlex/Widget/Common/Tab.dart';
import 'package:poorlex/Widget/Common/BottomBar.dart';
import 'package:poorlex/Widget/Common/Buttons.dart';
import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Layout.dart';

import 'package:poorlex/Widget/Battle/BattleFinding.dart';
import 'package:poorlex/Widget/Battle/BattleFinished.dart';
import 'package:poorlex/Widget/Battle/BattleParticipant.dart';

import '../../Widget/Battle/BattleMoney.dart';

class Battle extends StatefulWidget {
  Battle({super.key});

  @override
  State<Battle> createState() => _BattleState();
}

class _BattleState extends State<Battle> {
  int current = 0;
  int moneyCurrent = 0;
  BattleController battle = Get.find<BattleController>();

  void tab(c) {
    setState(() {
      current = c;
    });
  }

  void changeMoney(int m) {
    setState(() {
      moneyCurrent = m;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(nowPage: 2),
        backgroundColor: CColors.black,
        appBar: AppBar(
            backgroundColor: CColors.black,
            title: Row(children: [
              Expanded(child: Text('배틀', style: CTextStyles.Title1())),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CButton(
                    child: CIcon(icon: 'question-box', color: CColors.whiteStr),
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  CButton(
                      child: CIcon(icon: 'plus-small', color: CColors.whiteStr),
                      onPressed: () => Get.toNamed('/battle/create')),
                ],
              )
            ])),
        body: Layout(
            child: Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(children: [
            Row(children: [
              Expanded(
                  child: CTab(selected: current, list: [
                CTabItem(label: '탐색', value: 0, onClick: (v) => tab(v)),
                CTabItem(label: '참여중', value: 1, onClick: (v) => tab(v)),
                CTabItem(label: '완료된', value: 2, onClick: (v) => tab(v)),
              ]))
            ]),
            SizedBox(height: 8),
            Row(children: [
              Expanded(
                  child: BattleMoney(current: moneyCurrent, onChange: changeMoney))
            ]),
            SizedBox(height: 20),
            (current == 0
                ? Expanded(child: BattleFinding())
                : current == 1
                    ? Expanded(child: BattleParticipant())
                    : current == 2
                        ? Expanded(child: BattleFinished())
                        : SizedBox.shrink())
          ]),
        )));
  }
}
