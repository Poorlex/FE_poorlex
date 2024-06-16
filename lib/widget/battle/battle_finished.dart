import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/battle/battle_empty.dart';
import 'package:poorlex/widget/battle/battle_money_bar.dart';
import 'package:poorlex/widget/common/image/image_network.dart';

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
      final battleListInComplete = controller.battleListInComplete;
      if (battleListInComplete.isEmpty) {
        return Column(
          children: [
            SizedBox(height: 144),
            BattleEmpty(text: "완료된 배틀이 없습니다."),
          ],
        );
      }
      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, idx) {
          return Container(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 14,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    BattleMoneyBar(
                      budget: battleListInComplete[idx].budget,
                    ),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: CColors.gray20),
                      padding: EdgeInsets.symmetric(horizontal: 6),

                      /// [TODO] 몇일전인지 데이터 넣기
                      child: Text('${"7일전"}',
                          style: CTextStyles.Caption2(color: CColors.gray41)),
                    )
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
                          Text('${battleListInComplete[idx].name}',
                              style: CTextStyles.Body2()),
                          SizedBox(height: 9),
                          Text('존버 금액 : ${battleListInComplete[idx].budget}',
                              style: CTextStyles.Body2(color: CColors.gray40)),
                          SizedBox(height: 27),
                          Row(
                            children: [
                              Text(

                                  /// [TODO] 본인이 몇위인지 넣기
                                  '${"2위"}위',
                                  style: CTextStyles.Title1()),
                              Text(
                                  '/${battleListInComplete[idx].maxParticipantCount}명',
                                  style: CTextStyles.Title1()),
                              SizedBox(width: 20),
                              if (dummy[idx][4] == '1') ...[
                                Container(
                                  decoration:
                                      BoxDecoration(color: CColors.yellow),
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Text('+20',
                                      style: CTextStyles.Title3(
                                          color: CColors.black)),
                                )
                              ]
                            ],
                          )
                        ],
                      ),
                    ),
                    CImageNetwork(
                      src: battleListInComplete[idx].imageUrl,
                      width: 90,
                      height: 90,
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: battleListInComplete.length,
      );
    });
  }
}
