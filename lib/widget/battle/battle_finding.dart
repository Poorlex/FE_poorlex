import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/schema/finding_battle_response/finding_battle_response.dart';
import 'package:poorlex/widget/battle/battle_money_bar.dart';
import 'package:poorlex/widget/common/icon.dart';
import 'package:poorlex/widget/common/image/image_network.dart';
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
    return Obx(
      () {
        List<FindingBattleResponse> list = battle.battleList
            .where((element) => element.budget ~/ 10000 <= widget.smallerThan)
            .toList();

        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final findingBattle = list[index];
            return GestureDetector(
              onTap: () async {
                await Get.toNamed(
                  '/battle/detail',
                  arguments: {
                    'battleId': findingBattle.battleId,
                  },
                  id: GNBLayout.globalKey,
                );
                battle.getBattle();
                battle.getBattleInProgress();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            CIcon(icon: 'people', width: 14, height: 14),
                            SizedBox(width: 6),
                            Text(
                              '${findingBattle.currentParticipant}/${findingBattle.maxParticipantCount}',
                              style: CTextStyles.Caption2(),
                            ),
                            if (findingBattle.currentParticipant >=
                                findingBattle.maxParticipantCount) ...[
                              SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border.all(
                                    color: CColors.yellow,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 3,
                                  vertical: 1,
                                ),
                                child: Text(
                                  '모집완료',
                                  style: CTextStyles.Caption1(
                                    color: CColors.yellow,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      BattleMoneyBar(budget: findingBattle.budget),
                      SizedBox(height: 8),
                      Text(
                        findingBattle.name,
                        style: CTextStyles.Body2(height: 24 / 16),
                      ),
                      SizedBox(height: 6),
                      Text(
                        findingBattle.introduction,
                        style: CTextStyles.Body3(
                          color: CColors.gray40,
                          height: 20 / 14,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 46, bottom: 14),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    child: CImageNetwork(
                      src: findingBattle.imageUrl,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: list.length,
        );
      },
    );
  }
}
