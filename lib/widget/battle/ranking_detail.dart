import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle_detail.dart';
import 'package:poorlex/enums/day_of_week.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/schema/battle_expenditure_response/battle_expenditure_response.dart';
import 'package:poorlex/schema/battle_response/battle_response.dart';
import 'package:poorlex/schema/participant_ranking_response/participant_ranking_response.dart';
import 'package:poorlex/screen/battle/expense_certification.dart';
import 'package:poorlex/widget/common/image/image_network.dart';
import 'package:poorlex/widget/common/money_bar/money_bar.dart';
import 'package:poorlex/widget/level/medal.dart';
import 'package:poorlex/widget/level/profile.dart';
import 'package:poorlex/widget/loading_screen.dart';

class RankingDetailWidget extends StatefulWidget {
  final int battleId;
  const RankingDetailWidget({
    required this.battleId,
  });

  @override
  State<RankingDetailWidget> createState() => _RankingDetailWidget();
}

class _RankingDetailWidget extends State<RankingDetailWidget>
    with SingleTickerProviderStateMixin {
  late final _battleDetail = Get.find<BattleDetailController>();
  late TabController tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 300),
  );

  /// 해당 변수가 false이면 나의인증 상태입니다.
  bool _isAuthenticationPressed = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final _days = DayOfWeek.values;

  DayOfWeek _selectedDay = getTodayDayOfWeek();

  Future<void> _onTapAuthentication() async {
    await _battleDetail.getExpenditures(
      battleId: widget.battleId,
      dayOfWeek: getTodayDayOfWeek(),
    );
    _isAuthenticationPressed = true;
    setState(
      () {},
    );
  }

  Future<void> _onTapMyAuthentication() async {
    await _battleDetail.getMemberExpenditures(battleId: widget.battleId);
    _isAuthenticationPressed = false;
    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final battleInfo = _battleDetail.battleInfo;
      final battleExpenditures = _battleDetail.battleExpenditures;
      final battleRankings = _battleDetail.battleRankings;
      if (battleInfo == null) {
        return LoadingScreen();
      }
      return Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                child: _tabBar(context),
              ),
            ],
          ),
          Expanded(
            child: _tabBarView(
              battleInfo: battleInfo,
              battleExpenditures: battleExpenditures,
              battleRankings: battleRankings,
            ),
          ),
        ],
      );
    });
  }

  Widget _tabBar(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelColor: CColors.white,
      labelPadding: EdgeInsets.symmetric(horizontal: 17.5),
      labelStyle: CTextStyles.Title3(
        color: CColors.black,
        fontFamily: 'NeoDunggeunmoPro-Regular',
      ),
      unselectedLabelColor: CColors.gray41,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: CColors.yellow,
      dividerColor: CColors.black,
      padding: EdgeInsets.symmetric(horizontal: 0),
      onTap: (index) {},
      tabAlignment: TabAlignment.center,
      tabs: [
        Tab(text: "랭킹"),
        Tab(text: "인증"),
        // Tab(text: "채팅"),
      ],
    );
  }

  Widget _tabBarView({
    required BattleResponse battleInfo,
    required List<BattleExpenditureResponse> battleExpenditures,
    required List<ParticipantRankingResponse> battleRankings,
  }) {
    return TabBarView(
      controller: tabController,
      children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24, top: 12, bottom: 12),
                  child: MoneyBar(
                    money: battleInfo.battleBudget,
                    width: 31,
                    height: 36,
                  ),
                ),
                SizedBox(width: 13),
                Text(
                  '빚갚고 돈모으는 절약방',
                  style: TextStyle(
                    fontSize: 18,
                    color: CColors.white,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  color: CColors.gray30,
                  width: 34,
                  height: 16,
                  alignment: Alignment.center,
                  child: Text(
                    'D-${battleInfo.battleDDay}',
                    style: CTextStyles.Body3(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24, top: 9, bottom: 9),
                  child: Image.asset(
                    'assets/ranking/icon_people_20_20.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                Text(
                  '${battleInfo.currentParticipantSize}/${battleInfo.maxParticipantSize}',
                  style: CTextStyles.Caption2(),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: battleRankings.length,
                itemBuilder: (context, index) {
                  final battleRank = battleRankings[index];
                  if (battleRank.rank <= 3) {
                    return _topRanker(battleRank);
                  } else {
                    return _normalRanker(battleRank);
                  }
                },
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 13, bottom: 11),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text(
                        "인증내역",
                        style: CTextStyles.Headline(),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: _onTapAuthentication,
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text(
                        "나의인증",
                        style: CTextStyles.Headline(),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: _onTapMyAuthentication,
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: _isAuthenticationPressed,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    _days.length,
                    (index) {
                      final isSelected = _selectedDay == _days[index];
                      return GestureDetector(
                        onTap: () async {
                          _selectedDay = _days[index];
                          await _battleDetail.getExpenditures(
                            battleId: widget.battleId,
                            dayOfWeek: _selectedDay,
                          );
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            color: isSelected ? CColors.yellow : CColors.gray20,
                          ),
                          alignment: Alignment.center,
                          width: 28,
                          height: 28,
                          child: Text(
                            "${getKoreanDayOfWeek(_days[index])}",
                            style: CTextStyles.Headline(
                              color:
                                  isSelected ? CColors.black : CColors.gray60,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
                shrinkWrap: true,
                itemCount: battleExpenditures.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 26.0,
                  mainAxisSpacing: 20.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return _GridItemWidget(
                    item: battleExpenditures[index],
                    allMine: !_isAuthenticationPressed,
                  );
                },
              ),
            )
          ],
        ),
        // Container(child: Chat())
      ],
    );
  }

  Widget _topRanker(ParticipantRankingResponse battleRank) {
    final rankAsset = battleRank.rank == 1
        ? "first"
        : battleRank.rank == 2
            ? "second"
            : "third";
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ranking/cong_bg_375_80.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 20, 0),
                  child: Image.asset(
                    'assets/ranking/icon_${rankAsset}_24_24.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: CProfile(
                    level: battleRank.level,
                    width: 60,
                    height: 60,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                  child: CLevelMedal(
                    height: 16,
                    width: 16,
                    level: battleRank.level,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text('${battleRank.nickname}',
                      style: CTextStyles.Body2()),
                ),
                if (battleRank.role == "MANAGER") ...[
                  SizedBox(width: 10),
                  Container(
                    width: 30,
                    height: 16,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: CColors.gray20,
                        borderRadius: BorderRadius.circular(2)),
                    child: Text(
                      "방장",
                      style: TextStyle(
                        height: 1,
                        fontSize: 12,
                        color: CColors.gray60,
                      ),
                    ),
                  )
                ],
                Expanded(
                  child: Text(
                    '-${battleRank.expenditure}',
                    textAlign: TextAlign.right,
                    style: CTextStyles.Body3(
                      color: CColors.purpleLight,
                    ),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _normalRanker(ParticipantRankingResponse battleRank) {
    return SizedBox(
      height: 64,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 27, 0),
                child: Text('${battleRank.rank}위', style: CTextStyles.Body2()),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 44, 0),
                child: CProfile(
                  level: battleRank.level,
                  width: 40,
                  height: 40,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                child: CLevelMedal(
                  height: 16,
                  width: 16,
                  level: battleRank.level,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child:
                    Text('${battleRank.nickname}', style: CTextStyles.Body2()),
              ),
              if (battleRank.role == "MANAGER") ...[
                SizedBox(width: 10),
                Container(
                  width: 30,
                  height: 16,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: CColors.gray20,
                      borderRadius: BorderRadius.circular(2)),
                  child: Text(
                    "방장",
                    style: TextStyle(
                      height: 1,
                      fontSize: 12,
                      color: CColors.gray60,
                    ),
                  ),
                )
              ],
              Expanded(
                child: Text(
                  '-3,000',
                  textAlign: TextAlign.right,
                  style: CTextStyles.Body3(
                    color: CColors.purpleLight,
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}

class _GridItemWidget extends StatelessWidget {
  final BattleExpenditureResponse item;
  final bool allMine;

  _GridItemWidget({
    required this.item,
    required this.allMine,
  });

  @override
  Widget build(BuildContext context) {
    final highlight = item.own && !allMine;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: highlight ? CColors.purpleLight : Colors.transparent,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            child: CImageNetwork(
              width: double.maxFinite,
              height: double.maxFinite,
              src: item.imageUrl,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ExpenseCertificationScreen(
                      expenditureId: item.id,
                    );
                  },
                ),
              );
            },
          ),
          if (item.imageCount != 1)
            Positioned(
              top: -2,
              right: -2,
              child: Container(
                alignment: Alignment.center,
                width: 24,
                height: 14,
                decoration: BoxDecoration(
                  color: CColors.black.withOpacity(0.8),
                ),
                child: Text(
                  "+${item.imageCount}",
                  style: CTextStyles.Body3(
                    color: CColors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          if (highlight)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                width: 24,
                height: 14,
                decoration: BoxDecoration(
                  color: CColors.purpleLight,
                ),
                child: Text(
                  "my",
                  style: CTextStyles.Body3(),
                ),
              ),
            )
        ],
      ),
    );
  }
}
