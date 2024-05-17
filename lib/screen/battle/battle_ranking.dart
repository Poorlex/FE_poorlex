import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/widget/battle/ranking_app_bar.dart';
import 'package:poorlex/widget/battle/ranking_detail.dart';
import 'package:poorlex/widget/common/bottom_bar.dart';

import 'package:poorlex/Controller/Battle.dart';

class BattleRanking extends GetView {
  const BattleRanking({super.key});

  @override
  Widget build(BuildContext context) {
    BattleController _battle = BattleController();
    return Scaffold(
      bottomNavigationBar: BottomBar(nowPage: 2),
      backgroundColor: Colors.black,
      appBar: RankingAppBarWidget(),
      body: RankingDetailWidget(),
    );
  }
}
