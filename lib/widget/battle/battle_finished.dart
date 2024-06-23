import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/libs/number_format.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/battle/battle_completed_image.dart';
import 'package:poorlex/widget/battle/battle_empty.dart';
import 'package:poorlex/widget/battle/battle_money_bar.dart';

class BattleFinished extends GetView<BattleController> {
  const BattleFinished({super.key});
  static final List<List<String>> dummy = [
    [
      'icon_gold',
      '5',
      '빚 갚고 돈모으고 절약방(완료된)',
      '50,000',
      '1',
      '10',
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fbd7fff23-8e54-4f0a-86e5-a1140dd8a98a.jpg',
      '2주전'
    ],
    [
      'icon_silver',
      '7',
      '존버는 승리함',
      '70,000',
      '3',
      '20',
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fcdd163b6-fabd-4f95-9775-cc2f80d362ac.jpg',
      '2주전'
    ],
    [
      'icon_cooper',
      '13',
      '지갑 여시지 않을게요🙏',
      '130,000',
      '5',
      '5',
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fa0f317ad-e2e4-43dd-a7e2-a9d93a5c2099.jpg',
      '3주전'
    ],
    [
      'icon_gold',
      '3',
      '이종현 화이팅',
      '30,000',
      '7',
      '10',
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fa0f317ad-e2e4-43dd-a7e2-a9d93a5c2099.jpg',
      '1주전'
    ],
    [
      'icon_cooper',
      '15',
      '개발팀 화이팅',
      '150,000',
      '1',
      '20',
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fbd7fff23-8e54-4f0a-86e5-a1140dd8a98a.jpg',
      '2주전'
    ],
    [
      'icon_gold',
      '5',
      '디자인 화이팅',
      '50,000',
      '13',
      '20',
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fbd7fff23-8e54-4f0a-86e5-a1140dd8a98a.jpg',
      '1주전'
    ],
    [
      'icon_silver',
      '9',
      '기획팀 화이팅',
      '9,000',
      '2',
      '5',
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fa0f317ad-e2e4-43dd-a7e2-a9d93a5c2099.jpg',
      '3주전'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final battleListInCompleted = controller.battleListInCompleted;
      if (battleListInCompleted.isEmpty) {
        return Column(
          children: [
            SizedBox(height: 144),
            BattleEmpty(text: "완료된 배틀이 없습니다."),
          ],
        );
      }
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, idx) {
          final battleInCompleted = battleListInCompleted[idx];
          final isFailure = battleInCompleted.budgetLeft < 0;
          return Row(
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
                        BattleMoneyBar(
                          budget: battleInCompleted.budgetLeft,
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            color: CColors.gray20,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 6),

                          /// [TODO] 몇일전인지 데이터 넣기
                          child: Text(
                            '${-1 * battleInCompleted.pastDay}일전',
                            style: CTextStyles.Caption2(
                              color: Color.fromRGBO(126, 126, 126, 1),
                              height: 16 / 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    '${battleInCompleted.name}',
                    style: CTextStyles.Body2(
                      height: 22 / 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '존버 금액 : ${formatCurrencyWithWon(battleInCompleted.budgetLeft)}',
                    style: CTextStyles.Body2(
                      color: CColors.gray50,
                      height: 22 / 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  if (!isFailure)
                    Row(
                      children: [
                        Text(
                          '${battleInCompleted.currentParticipantRank}위',
                          style: CTextStyles.Title1(
                            height: 32 / 22,
                          ),
                        ),
                        Text(
                          '/${battleInCompleted.battleParticipantCount}명',
                          style: CTextStyles.Title1(
                            height: 32 / 22,
                          ),
                        ),
                        if (battleInCompleted.currentParticipantRank == 1) ...[
                          SizedBox(width: 20),
                          Container(
                            height: 24,
                            decoration: BoxDecoration(
                              color: CColors.yellow,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                            ),
                            child: Text(
                              '+${battleInCompleted.earnedPoint}',
                              style: CTextStyles.Title1(
                                color: CColors.black,
                              ),
                            ),
                          )
                        ]
                      ],
                    )
                  else
                    Text(
                      "실패",
                      style: CTextStyles.Title1(),
                    )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 46, bottom: 14),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                ),
                child: BattleCompletedImage(
                  rank: battleInCompleted.currentParticipantRank,
                  isFailure: isFailure,
                ),
              ),
            ],
          );
        },
        itemCount: battleListInCompleted.length,
      );
    });
  }
}
