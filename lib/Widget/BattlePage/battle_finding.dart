import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Controller/battle_controller.dart';

import 'containers/battle_container.dart';
import 'battle_money.dart';
import 'containers/finding_container.dart';

class BattleFinding extends GetView {
  final int PageIndex;
  const BattleFinding({super.key, required this.PageIndex});

  @override
  Widget build(BuildContext context) {
    List<List<String>> dummy = [
      [
        'icon_gold',
        '5',
        '빚 갚고 돈모으고 절약방(탐색)',
        '50,000',
        '1',
        '10',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fbd7fff23-8e54-4f0a-86e5-a1140dd8a98a.jpg',
        '돈 모은다며, 여행간다며, 차산다며,'
      ],
      [
        'icon_silver',
        '7',
        '존버는 승리함',
        '70,000',
        '3',
        '20',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fcdd163b6-fabd-4f95-9775-cc2f80d362ac.jpg',
        '월급날 텅장되기 싫으면 들어와 너 거진거 너 빼고 다 알아..😂',
      ],
      [
        'icon_cooper',
        '13',
        '지갑 여시지 않을게요🙏',
        '130,000',
        '5',
        '5',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fa0f317ad-e2e4-43dd-a7e2-a9d93a5c2099.jpg',
        '혼자 갚지 말고 같이 갚아요'
      ],
      [
        'icon_gold',
        '3',
        '이종현 화이팅',
        '30,000',
        '7',
        '10',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fa0f317ad-e2e4-43dd-a7e2-a9d93a5c2099.jpg',
        '혼자 갚지 말고 같이 갚아요'
            ''
      ],
      [
        'icon_cooper',
        '15',
        '개발팀 화이팅',
        '150,000',
        '1',
        '20',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fbd7fff23-8e54-4f0a-86e5-a1140dd8a98a.jpg',
        '월급날 텅장되기 싫으면 들어와 너 거진거 너 빼고 다 알아..😂'
      ],
      [
        'icon_gold',
        '5',
        '디자인 화이팅',
        '50,000',
        '13',
        '20',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fbd7fff23-8e54-4f0a-86e5-a1140dd8a98a.jpg',
        '혼자 갚지 말고 같이 갚아요'
      ],
      [
        'icon_silver',
        '9',
        '기획팀 화이팅',
        '9,000',
        '2',
        '5',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fa0f317ad-e2e4-43dd-a7e2-a9d93a5c2099.jpg',
        '월급날 텅장되기 싫으면 들어와 너 거진거 너 빼고 다 알아..😂'
      ],
    ];

    BattleController _battle = Get.put(BattleController());
    print(_battle.battleIndex().MoneyIndex);

    return Obx(() => Column(
          children: [
            BattleMoney(
              moneyIndex: _battle.battleIndex().MoneyIndex,
            ),
            FindingContainer(dummy: dummy)
          ],
        ));
  }
}
