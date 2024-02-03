import 'package:flutter/material.dart';

import 'package:poorlex/Widget/BattleDetailPage/chat.dart';

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

  List<String> items = List.generate(5, (index) => '아이템 ${index}');

  bool isAuthenticationPressed = true;

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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 13, 0, 11),
            child: Row(children: [
              Expanded(
                // todo: 인증내역이 선택되어 있다면 body 값 변경
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAuthenticationPressed = true;
                        items = List.generate(20, (index) => '아이템 ${index}');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text("인증내역",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: -0.25,
                            height: 1.611),
                        textAlign: TextAlign.center)),
              ),
              Expanded(
                // todo: 인증내역이 선택되어 있다면 body 값 변경
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAuthenticationPressed = false;
                        items = List.generate(1, (index) => '아이템 ${index}');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text("나의인증",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: -0.25,
                            height: 1.611),
                        textAlign: TextAlign.center)),
              ),
            ]),
          ),
          Visibility(
            visible: isAuthenticationPressed,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 23, 16),
              child: Row(children: [
                // todo: 선택되면 이미지 바뀔 수 있게 로직 짜주기
                // todo: global 키를 활용해서 padding 값을 조정하는 로직을 추가해주기
                //       row.key 설정하고 다른 곳에서 row.key.currentContext?.size?.width 등으로 설정하기
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 22, 0),
                  child: Container(
                      color: Color(0xff333333),
                      width: 28,
                      child: Text("월",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: -0.25,
                            height: 1.611,
                          ),
                          textAlign: TextAlign.center)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 22, 0),
                  child: Container(
                      color: Color(0xff333333),
                      width: 28,
                      child: Text("화",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: -0.25,
                            height: 1.611,
                          ),
                          textAlign: TextAlign.center)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 22, 0),
                  child: Container(
                      color: Color(0xff333333),
                      width: 28,
                      child: Text("수",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: -0.25,
                            height: 1.611,
                          ),
                          textAlign: TextAlign.center)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 22, 0),
                  child: Container(
                      color: Color(0xff333333),
                      width: 28,
                      child: Text("목",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: -0.25,
                            height: 1.611,
                          ),
                          textAlign: TextAlign.center)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 22, 0),
                  child: Container(
                      color: Color(0xff333333),
                      width: 28,
                      child: Text("금",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: -0.25,
                            height: 1.611,
                            backgroundColor: Color(0xff333333),
                          ),
                          textAlign: TextAlign.center)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 22, 0),
                  child: Container(
                      color: Color(0xff333333),
                      width: 28,
                      child: Text("토",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: -0.25,
                            height: 1.611,
                            backgroundColor: Color(0xff333333),
                          ),
                          textAlign: TextAlign.center)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                      color: Color(0xff333333),
                      width: 28,
                      child: Text("일",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: -0.25,
                            height: 1.611,
                            backgroundColor: Color(0xff333333),
                          ),
                          textAlign: TextAlign.center)),
                ),
              ]),
            ),
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 26.0,
              mainAxisSpacing: 20.0,
            ),
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            shrinkWrap: true,
            itemCount: items.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return GridItemWidget(item: items[index]);
            },
          ))
        ]),
        Container(
          child: Chat()
        ),
      ],
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final String item;

  GridItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: Center(
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Expanded(
                              child: Center(
                                  child: Text('인증내역(1/7)',
                                      style: TextStyle(color: Colors.white)))),
                        ]),
                        Image.asset('assets/ranking/first_profile_60_60.png'),
                        // todo: 나중에 패딩값을 어떻게 줄 것인지 논의필요해 보임
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Text("최지출",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18))),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Text("약값 지출 ...",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18))),
                      ]),
                  // contentPadding: EdgeInsets.zero,
                  backgroundColor: Colors.black,
                  actions: [],
                );
              },
            );
          },
          child: Image.asset('assets/ranking/first_profile_60_60.png'),
        ),
      ),
    );
  }
}
