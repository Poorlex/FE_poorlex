import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Widget/Battle/RankingAppBar.dart';
import 'package:poorlex/Widget/Battle/RankingDetail.dart';
import 'package:poorlex/Widget/Common/BottomBar.dart';

import 'package:poorlex/Controller/Battle.dart';

class Ranking extends GetView {
  const Ranking({super.key});

  @override
  Widget build(BuildContext context) {
    BattleController _battle = BattleController();
    return Scaffold(
        bottomNavigationBar: BottomBar(nowPage: 2),
        backgroundColor: Colors.black,
        appBar: RankingAppBarWidget(),
        body: RankingDetailWidget());
  }
}
