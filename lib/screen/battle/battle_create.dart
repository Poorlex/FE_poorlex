import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/widget/battle/making/battle_making_finished.dart';

import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/widget/common/icon.dart';
import 'package:poorlex/widget/layout.dart';
import 'package:poorlex/widget/battle/making/battle_index_one.dart';
import 'package:poorlex/widget/battle/making/battle_index_two.dart';
import 'package:poorlex/widget/battle/making/battle_index_zero.dart';
import 'package:poorlex/widget/battle/making/battle_process.dart';

class BattleCreate extends StatefulWidget {
  const BattleCreate({super.key});

  @override
  State<BattleCreate> createState() => _BattleCreateState();
}

class _BattleCreateState extends State<BattleCreate> {
  BattleController battle = Get.find<BattleController>();

  @override
  void initState() {
    super.initState();
    battle.initBattleCreate();
  }

  void changePage({required bool isNext}) async {
    final currentPage = battle.battleCreate.value.current;

    if (isNext) {
      if (currentPage == 2) {
        final isSuccess = await battle.saveBattle();
        if (!isSuccess) {
          await battle.getBattle();
          Get.back();
          return;
        }
      }
      battle.changeCurrent(currentPage + 1);
    } else {
      if (currentPage > 0) {
        battle.changeCurrent(currentPage - 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomOffset = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.velocity.pixelsPerSecond.dx > 0) {
          changePage(isNext: false);
        }
        print(">>>>>> ${details.velocity}");
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CColors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CButton(
                child: CIcon(
                    icon: 'arrow-left',
                    width: 26,
                    height: 26,
                    color: CColors.whiteStr),
                onPressed: () => Get.back(),
              ),
              Text('배틀방 만들기', style: CTextStyles.Headline()),
              SizedBox(width: 26)
            ],
          ),
        ),
        backgroundColor: CColors.black,
        body: Layout(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Column(
                      children: [
                        SizedBox(height: 26),
                        BattleProcess(),
                        SizedBox(height: 18),
                        Obx(
                          () {
                            switch (battle.battleCreate.value.current) {
                              case 0:
                                return BattleIndexZero();
                              case 1:
                                return BattleIndexOne();
                              case 2:
                                return BattleIndexTwo();
                              default:
                                return BattleMakingFinished();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: bottomOffset,
          ),
          child: Obx(
            () {
              if (battle.battleCreate.value.current == 3) {
                return CButton(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  color: CColors.yellow,
                  type: ButtonTypes.elevated,
                  onPressed: () => Get.offAndToNamed('/battle'),
                  child: Text(
                    '시작!',
                    style: CTextStyles.Title3(
                      color: CColors.black,
                    ),
                  ),
                );
              } else {
                final battleCreate = battle.battleCreate.value;
                final disabledCondition = battleCreate.current == 1 &&
                        (battleCreate.title.isEmpty ||
                            battleCreate.image == null ||
                            battleCreate.content.isEmpty) ||
                    battleCreate.current == 2 && battleCreate.count == 0;
                return CButton(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  disabled: disabledCondition,
                  color: CColors.yellow,
                  type: ButtonTypes.elevated,
                  onPressed: disabledCondition
                      ? () {}
                      : () => changePage(isNext: true),
                  child: Text(
                    '다음',
                    style: CTextStyles.Title3(
                      color: CColors.black,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
