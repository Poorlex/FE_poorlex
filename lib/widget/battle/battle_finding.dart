import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/models/battle.dart';
import 'package:poorlex/widget/battle/battle_money_bar.dart';
import 'package:poorlex/widget/common/icon.dart';

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
      List<BattleList> list = battle.battleList
          .where((element) => element.budget ~/ 10000 <= widget.smallerThan)
          .cast<BattleList>()
          .toList();
      return ListView.separated(
          // shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
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
                            '${list[index].currentParticipant}/${list[index].maxParticipantCount}',
                            style: CTextStyles.Caption2()),
                        SizedBox(width: 10),
                        (list[index].currentParticipant) >=
                                (list[index].maxParticipantCount)
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
                            BattleMoneyBar(budget: list[index].budget),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(list[index].name,
                                      style: CTextStyles.Body2()),
                                )
                              ],
                            ),
                            SizedBox(height: 9),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(list[index].name,
                                        style: CTextStyles.Caption1(
                                            color: CColors.gray40))),
                                SizedBox(height: 27)
                              ],
                            )
                          ],
                        )),
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            image: DecorationImage(
                              image: NetworkImage(list[index].imageUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ));
          },
          separatorBuilder: (context, idx) => const SizedBox(width: 15),
          itemCount: list.length);
    });
  }
}
