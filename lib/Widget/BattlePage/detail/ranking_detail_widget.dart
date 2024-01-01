import 'package:flutter/material.dart';

class RankingDetailWidget extends StatefulWidget {
  const RankingDetailWidget({Key? key}) : super(key: key);

  @override
  State<RankingDetailWidget> createState() => _RankingDetailWidget();
}

class _RankingDetailWidget extends State<RankingDetailWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 3,
    vsync: this,
    initialIndex: 0,

    /// 탭 변경 애니메이션 시간
    animationDuration: const Duration(milliseconds: 300),
  );

  @override
  void initState() {
    tabController.addListener(() {
      /// 프레임당 콜백
    });

    /// 탭바의 index가 변경되고 있는지 체크
    /// true or false
    tabController.indexIsChanging;

    /// 탭바의 개수
    tabController.length;

    /// 변경 전의 index
    tabController.previousIndex;

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Container(
            height: 50,
            child: _tabBar(context),
          ),
        ]),
        Expanded(
          child: _tabBarView(),
        ),
      ],
    );
  }

  Widget _tabBar(BuildContext context) {
    var screen_width = MediaQuery.of(context).size.width;
    print(screen_width);

    return TabBar(
      controller: tabController,
      labelColor: Colors.white,
      labelPadding: const EdgeInsets.symmetric(horizontal: 17.5),
      labelStyle:
          const TextStyle(fontSize: 20, fontFamily: 'NeoDunggeunmoPro-Regular'),
      unselectedLabelStyle: const TextStyle(
        fontSize: 20,
        fontFamily: 'NeoDunggeunmoPro-Regular',
      ),
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: const Color(0xFFFFD600),
      dividerColor: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 0),
      onTap: (index) {},
      tabAlignment: TabAlignment.center,
      tabs: const [
        Tab(text: "랭킹"),
        Tab(text: "인증"),
        Tab(text: "채팅"),
      ],
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: tabController,
      children: [
        // todo: 랭킹 ListView 를 활용해서 등수 표현해주기
        ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(26, 5, 10, 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFFFD600),
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(color: Color(0xffD07309), width: 2)),
                        width: 36,
                        height: 36,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '7',
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff732900),
                                  height: 1.0),
                            ),
                            Text(
                              '만원',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff732900),
                                  height: 1.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Row(children: [
                      Text(
                        '빚갚고 돈모으는 절약방',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Container(
                              color: Color(0xff666666),
                              width: 34,
                              height: 16,
                              alignment: Alignment.center,
                              child: Text(
                                  // todo-al: 여기에 7 대신 day 변수값 넣어주기
                                  'D-7',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      height: 1.0))))
                    ]))
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(26, 5, 5, 5),
                    child: Image.asset(
                      'assets/ranking/icon_people_20_20.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '10/10',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ])
              ],
            ),
            SizedBox(
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
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 20, 0),
                        child: Image.asset(
                          'assets/ranking/icon_first_24_24.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                        child: Image.asset(
                          'assets/ranking/first_profile_60_60.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                        child: Image.asset(
                          'assets/ranking/icon_lv2_16_16.png',
                          width: 16,
                          height: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          '강적금',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      Expanded(
                          child: Text('-1,000',
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Color(0xffB265FF)))),
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 64,
              child: Column(
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 27, 0),
                      child: Text(
                        '4위',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 44, 0),
                      child: Image.asset(
                        'assets/ranking/profile_40_40.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                      child: Image.asset(
                        'assets/ranking/icon_lv2_16_16.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        '강적금',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Expanded(
                        child: Text('-3,000',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Color(0xffB265FF)))),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 64,
              child: Column(
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 27, 0),
                      child: Text(
                        '5위',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 44, 0),
                      child: Image.asset(
                        'assets/ranking/profile_40_40.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                      child: Image.asset(
                        'assets/ranking/icon_lv4_16_16.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        '강적금',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Expanded(
                        child: Text('-3,200',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Color(0xffB265FF)))),
                  ]),
                ],
              ),
            ),
          ],
        ),
        // todo: 인증
        Column(children: [
          Text("200", style: TextStyle(color: Colors.white)),
          Text("200", style: TextStyle(color: Colors.white))
        ]),
        // todo: 채팅
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry T')),
        ),
      ],
    );
  }
}
