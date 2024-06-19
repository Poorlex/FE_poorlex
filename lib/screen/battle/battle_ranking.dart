import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle_detail.dart';
import 'package:poorlex/enums/day_of_week.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/battle/ranking_detail.dart';

class BattleRanking extends StatefulWidget {
  final int battleId;
  const BattleRanking({
    super.key,
    required this.battleId,
  });

  @override
  State<BattleRanking> createState() => _BattleRankingState();
}

class _BattleRankingState extends State<BattleRanking> {
  late final _battleDetail = Get.find<BattleDetailController>();

  @override
  void initState() {
    super.initState();
    _battleDetail.getDetailById(battleId: widget.battleId);
    _battleDetail.getBattleRankings(battleId: widget.battleId);
    _battleDetail.getExpenditures(
      battleId: widget.battleId,
      dayOfWeek: getTodayDayOfWeek(),
    );
    // _battleDetail.getBattleNotiById(battleId: widget.battleId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: RankingDetailWidget(battleId: widget.battleId),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: CColors.black,
      centerTitle: true,
      title:
          Text('참여중', style: CTextStyles.Body1(), textAlign: TextAlign.center),
      actions: [
        IconButton(
          onPressed: () async {
            await Get.toNamed(
              '/battle/modify/${widget.battleId}',
            );
            _battleDetail.getDetailById(
              battleId: widget.battleId,
            );
          },
          icon: Image.asset('assets/app_bar/icon_config_26_26.png'),
          iconSize: 26,
        ),
      ],
    );
  }
}
