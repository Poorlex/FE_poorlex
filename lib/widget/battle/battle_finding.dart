import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/schema/finding_battle_response/finding_battle_response.dart';
import 'package:poorlex/widget/battle/battle_money_bar.dart';
import 'package:poorlex/widget/common/icon.dart';
import 'package:poorlex/widget/gnb_layout.dart';

class BattleFinding extends StatefulWidget {
  late final int smallerThan;
  BattleFinding({super.key, required this.smallerThan});

  @override
  State<BattleFinding> createState() => _BattleFindingState();
}

class _BattleFindingState extends State<BattleFinding> {
  int current = 0;
  BattleController battle = Get.find<BattleController>();

  void changeCurrent(int c) {
    setState(() {
      current = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<FindingBattleResponse> list = battle.battleList
          .where((element) => element.budget ~/ 10000 <= widget.smallerThan)
          .toList();

      return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final findingBattle = list[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed(
                '/battle/detail',
                arguments: {
                  'battleId': findingBattle.battleId,
                },
                id: GNBLayout.globalKey,
              );
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 150,
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CIcon(icon: 'people', width: 14, height: 14),
                        SizedBox(width: 10),
                        Text(
                            '${findingBattle.currentParticipant}/${findingBattle.maxParticipantCount}',
                            style: CTextStyles.Caption2()),
                        SizedBox(width: 10),
                        (findingBattle.currentParticipant) >=
                                (findingBattle.maxParticipantCount)
                            ? (Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1),
                                    color: CColors.gray30),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 1),
                                child: Text('모집완료',
                                    style: CTextStyles.Caption1(
                                        color: CColors.gray70))))
                            : SizedBox.shrink()
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BattleMoneyBar(budget: findingBattle.budget),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(findingBattle.name,
                                        style: CTextStyles.Body2()),
                                  )
                                ],
                              ),
                              SizedBox(height: 9),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(findingBattle.name,
                                          style: CTextStyles.Caption1(
                                              color: CColors.gray40))),
                                  SizedBox(height: 27)
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            image: DecorationImage(
                              image: NetworkImage(findingBattle.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        },
        separatorBuilder: (context, idx) => const SizedBox(width: 15),
        itemCount: list.length,
      );
    });
  }
}
