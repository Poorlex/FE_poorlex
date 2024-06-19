import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/screen/battle/battle_guide_dialog.dart';
import 'package:poorlex/widget/bottom_sheet/bottom_sheet_with_beggar.dart';
import 'package:poorlex/widget/common/tab.dart';
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

  void tab(int c) {
    setState(() {
      current = c;
    });
    switch (c) {
      case 0:
        battle.getBattle();
        break;
      case 1:
        battle.getBattleInProgress();
        break;
      case 2:
        battle.getBattleInComplete();
        break;
    }
  }

  void changeMoney(int m) {
    setState(() {
      moneyCurrent = m;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final result = await BottomSheetWithBeggar.show(
        context: context,
        beggarAction: BeggarAction.suggestionBudget,
      );

      if (result == true) {
        /// [TODO] 예산 설정하러 가기 라우팅
      }
    });

    battle.getBattle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 20,
            ),
            child: Row(
              children: [
                CTab(
                  selected: current,
                  list: [
                    CTabItem(label: '탐색', value: 0, onClick: (v) => tab(v)),
                    CTabItem(label: '참여중', value: 1, onClick: (v) => tab(v)),
                    CTabItem(label: '완료된', value: 2, onClick: (v) => tab(v)),
                  ],
                )
              ],
            ),
          ),
          if (current == 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BattleMoney(
                current: moneyCurrent,
                onChange: changeMoney,
              ),
            ),
          Expanded(
            child: (current == 0
                ? BattleFinding(smallerThan: moneyCurrent)
                : current == 1
                    ? BattleParticipant()
                    : current == 2
                        ? BattleFinished()
                        : SizedBox.shrink()),
          )
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Row(
        children: [
          Expanded(child: Text('배틀', style: CTextStyles.Title1())),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CButton(
                child: CIcon(icon: 'question-box', color: CColors.whiteStr),
                onPressed: () => BattleGuideDialog.show(context: context),
              ),
              SizedBox(width: 20),
              CButton(
                child: CIcon(icon: 'plus-small', color: CColors.whiteStr),
                onPressed: () => Get.toNamed('/battle/create'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
