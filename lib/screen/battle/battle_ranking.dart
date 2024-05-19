import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/widget/battle/ranking_app_bar.dart';
import 'package:poorlex/widget/battle/ranking_detail.dart';

import 'package:poorlex/Controller/Battle.dart';

class BattleRanking extends GetView<BattleController> {
  const BattleRanking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: RankingAppBarWidget(),
      body: RankingDetailWidget(),
    );
  }
}
