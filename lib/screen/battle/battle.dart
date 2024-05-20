import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Widget/Common/Tab.dart';
import 'package:poorlex/Widget/Layout.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/battle/battle_finding.dart';
import 'package:poorlex/widget/battle/battle_finished.dart';
import 'package:poorlex/widget/battle/battle_money.dart';
import 'package:poorlex/widget/battle/battle_participant.dart';
import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/widget/common/icon.dart';

class Battle extends StatefulWidget {
  Battle({super.key});

  @override
  State<Battle> createState() => _BattleState();
}

class _BattleState extends State<Battle> {
  int current = 0;
  int moneyCurrent = 1000000000000000;
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
  void initState() {
    super.initState();
    battle.getBattle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CColors.black,
        appBar: AppBar(
            automaticallyImplyLeading: false,
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
          padding: EdgeInsets.fromLTRB(16, 2, 16, 0),
          child: Column(children: [
            Row(children: [
              Expanded(
                  child: CTab(selected: current, list: [
                CTabItem(label: '탐색', value: 0, onClick: (v) => tab(v)),
                CTabItem(label: '참여중', value: 1, onClick: (v) => tab(v)),
                CTabItem(label: '완료된', value: 2, onClick: (v) => tab(v)),
              ]))
            ]),
            SizedBox(height: 10),
            Row(children: [
              (current == 0
                  ? Expanded(
                      child: BattleMoney(
                          current: moneyCurrent, onChange: changeMoney))
                  : SizedBox.shrink())
            ]),
            SizedBox(height: 20),
            Expanded(
                child: (current == 0
                    ? BattleFinding(smallerThan: moneyCurrent)
                    : current == 1
                        ? BattleParticipant()
                        : current == 2
                            ? BattleFinished()
                            : SizedBox.shrink()))
            /*
              (current == 0
                  ? Flexible(flex: 1, child: BattleFinding())
                  : current == 1
                      ? Expanded(child: BattleParticipant())
                      : current == 2
                          ? Expanded(child: BattleFinished())
                          : SizedBox.shrink())
               */
          ]),
        )));
  }
}
