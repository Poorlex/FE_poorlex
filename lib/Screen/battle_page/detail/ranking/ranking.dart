import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Controller/battle_controller.dart';
import 'package:poorlex/Widget/BattlePage/detail/ranking/ranking_app_bar_widget.dart';
import 'package:poorlex/Widget/BattlePage/detail/ranking_detail_widget.dart';
import 'package:poorlex/Widget/MainPageWidget/bottom_bar.dart';

class Ranking extends GetView {
  const Ranking({super.key});

  @override
  Widget build(BuildContext context) {
    BattleController _battle = BattleController();
    print(_battle.battleIndex().PageNumber);
    return Scaffold(
        bottomNavigationBar: BottomBar(nowPage: 2),
        backgroundColor: Colors.black,
        appBar: RankingAppBarWidget(),
        body: RankingDetailWidget());
  }
}
