import 'package:flutter/material.dart';

class SampleWidget extends StatefulWidget {
  const SampleWidget({Key? key}) : super(key: key);

  @override
  State<SampleWidget> createState() => _SampleWidget();
}

class _SampleWidget extends State<SampleWidget>
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
            child: _tabBar(),
          ),
        ]),
        Expanded(
          child: _tabBarView(),
        ),
        ElevatedButton(
          onPressed: () {
            // 애니메이션 없이 바로 변경
            tabController.index = 2;
          },
          child: const Text("test"),
        ),
        ElevatedButton(
          onPressed: () {
            // 애니메이션 없이 바로 변경
            tabController.animateTo(0);
          },
          child: const Text("test 2"),
        ),
      ],
    );
  }

  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      labelStyle:
          const TextStyle(fontSize: 20, fontFamily: 'NeoDunggeunmoPro-Regular'),
      unselectedLabelStyle: const TextStyle(
        fontSize: 20,
        fontFamily: 'NeoDunggeunmoPro-Regular',
      ),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: const Color(0xFFFFD600),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      isScrollable: true,
      onTap: (index) {},
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
                                  fontSize: 14, color: Color(0xff732900)),
                            ),
                            const Text(
                              '만원',
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xff732900)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '빚갚고 돈모으는 절약방',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
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
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                      child: Image.asset(
                        'assets/ranking/icon_first_24_24.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '10/10',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
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
