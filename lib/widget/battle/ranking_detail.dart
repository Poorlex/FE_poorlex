import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle_detail.dart';
import 'package:poorlex/enums/day_of_week.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/schema/battle_expenditure_response/battle_expenditure_response.dart';
import 'package:poorlex/schema/battle_response/battle_response.dart';
import 'package:poorlex/screen/battle/expense_certification.dart';
import 'package:poorlex/widget/common/money_bar/money_bar.dart';
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

  bool isAuthenticationPressed = true;

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
    isAuthenticationPressed = true;
    setState(
      () {},
    );
  }

  Future<void> _onTapMyAuthentication() async {
    await _battleDetail.getMemberExpenditures(battleId: widget.battleId);
    isAuthenticationPressed = false;
    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final battleInfo = _battleDetail.battleInfo;
      final battleExpenditures = _battleDetail.battleExpenditures;
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
  }) {
    return TabBarView(
      controller: tabController,
      children: [
        ListView(
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
                )
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
            _topRanker(),
            _normalRanker(),
            _normalRanker(),
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
              visible: isAuthenticationPressed,
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
                  return _GridItemWidget(item: battleExpenditures[index]);
                },
              ),
            )
          ],
        ),
        // Container(child: Chat())
      ],
    );
  }

  Widget _topRanker() {
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
                  child: Image.asset('assets/ranking/icon_first_24_24.png',
                      width: 24, height: 24),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: Image.asset(
                    'assets/ranking/first_profile_60_60.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                  child: Image.asset(
                    'assets/ranking/icon_lv2_16_16.png',
                    width: 16,
                    height: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text('강적금', style: CTextStyles.Body2()),
                ),
                Expanded(
                  child: Text(
                    '-1,000',
                    textAlign: TextAlign.right,
                    style: CTextStyles.Body3(
                      color: CColors.purpleLight,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _normalRanker() {
    return SizedBox(
      height: 64,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 27, 0),
                child: Text('4위', style: CTextStyles.Body2()),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 44, 0),
                child: Image.asset('assets/ranking/profile_40_40.png',
                    width: 40, height: 40),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                child: Image.asset('assets/ranking/icon_lv2_16_16.png',
                    width: 16, height: 16),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text('강적금', style: CTextStyles.Body2()),
              ),
              Expanded(
                child: Text(
                  '-3,000',
                  textAlign: TextAlign.right,
                  style: CTextStyles.Body3(
                    color: CColors.purpleLight,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GridItemWidget extends StatelessWidget {
  final BattleExpenditureResponse item;

  _GridItemWidget({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.tealAccent,
        child: Center(
            child: GestureDetector(
                child: Image.asset('assets/ranking/first_profile_60_60.png'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ExpenseCertificationScreen();
                    },
                  ));
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  IconButton(
                                    icon:
                                        Icon(Icons.close, color: CColors.white),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Expanded(
                                      child: Center(
                                          child: Text('인증내역(1/7)',
                                              style: CTextStyles.Body3())))
                                ]),
                                Image.asset(
                                    'assets/ranking/first_profile_60_60.png'),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Text("최지출",
                                        style: CTextStyles.Headline())),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Text("약값 지출 ...",
                                        style: CTextStyles.Headline())),
                              ]),
                          backgroundColor: CColors.black,
                          actions: [],
                        );
                      });
                })));
  }
}
