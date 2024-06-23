import 'package:flutter/material.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/schema/member_progress_battle_response/member_progress_battle_response.dart';
import 'package:poorlex/widget/common/money_bar/money_bar.dart';

class BattleBox extends StatelessWidget {
  final MemberProgressBattleResponse battle;
  const BattleBox({
    super.key,
    required this.battle,
  });

  @override
  Widget build(BuildContext context) {
    // print('battle: $battle');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final double secondContainerWidth = constraints.maxWidth - 6;

            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: CColors.black),
                  width: secondContainerWidth + 6,
                  height: 144,
                ),
                Container(
                  width: secondContainerWidth,
                  height: 150,
                  decoration: BoxDecoration(color: CColors.black),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // 금액 메달
                            MoneyBar(
                              money: battle.budgetLeft,
                              width: 48,
                              height: 56,
                            ),

                            SizedBox(width: 18),

                            // 배틀 제목, 남은 예산
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  battle.name,
                                  style: CTextStyles.Headline(),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '남은 예산 : ${battle.budgetLeft} 원',
                                  style: CTextStyles.Body3(
                                    color: CColors.gray40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // 참여자 수, 입장 버튼
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${battle.currentParticipantRank}위/${battle.battleParticipantCount}명',
                              style: CTextStyles.Title1(),
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  width: 1,
                                  color: CColors.yellow,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                ),
                              ),
                              child: Text(
                                '입장',
                                style: CTextStyles.Body2(
                                  color: CColors.yellow,
                                ),
                              ),
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
