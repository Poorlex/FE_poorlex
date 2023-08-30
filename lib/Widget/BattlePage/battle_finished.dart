import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Controller/battle_controller.dart';
import 'package:poorlex/Widget/BattlePage/battle_container.dart';

import 'battle_money.dart';

class BattleFinished extends GetView {
  final int PageIndex;
  const BattleFinished({super.key, required this.PageIndex});

  @override
  Widget build(BuildContext context) {
    List<List<String>> dummy = [
      [
        'icon_gold',
        '5',
        '빚 갚고 돈모으고 절약방(완료된)',
        '50,000',
        '1',
        '10',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fbd7fff23-8e54-4f0a-86e5-a1140dd8a98a.jpg'
      ],
      [
        'icon_silver',
        '7',
        '존버는 승리함',
        '70,000',
        '3',
        '20',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fcdd163b6-fabd-4f95-9775-cc2f80d362ac.jpg'
      ],
      [
        'icon_cooper',
        '13',
        '지갑 여시지 않을게요🙏',
        '130,000',
        '5',
        '5',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fa0f317ad-e2e4-43dd-a7e2-a9d93a5c2099.jpg'
      ],
      [
        'icon_gold',
        '3',
        '이종현 화이팅',
        '30,000',
        '7',
        '10',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fa0f317ad-e2e4-43dd-a7e2-a9d93a5c2099.jpg'
      ],
      [
        'icon_cooper',
        '15',
        '개발팀 화이팅',
        '150,000',
        '1',
        '20',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fbd7fff23-8e54-4f0a-86e5-a1140dd8a98a.jpg'
      ],
      [
        'icon_gold',
        '5',
        '디자인 화이팅',
        '50,000',
        '13',
        '20',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fbd7fff23-8e54-4f0a-86e5-a1140dd8a98a.jpg'
      ],
      [
        'icon_silver',
        '9',
        '기획팀 화이팅',
        '9,000',
        '2',
        '5',
        'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fa0f317ad-e2e4-43dd-a7e2-a9d93a5c2099.jpg'
      ],
    ];

    BattleController _battle = BattleController();

    return Column(
      children: [
        BattleContainer(dummy: dummy),
      ],
    );
  }
}
