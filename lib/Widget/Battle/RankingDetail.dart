import 'package:flutter/material.dart';
import 'package:poorlex/Libs/Theme.dart';

import 'package:poorlex/Widget/Battle/Detail/Chat.dart';

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
      labelColor: CColors.white,
      labelPadding: EdgeInsets.symmetric(horizontal: 17.5),
      labelStyle: CTextStyles.Title3(color: CColors.black),
      unselectedLabelStyle: CTextStyles.Title3(color: CColors.black),
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
        Tab(text: "채팅"),
      ],
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: tabController,
      children: [
        ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            Column(children: [
                Row(children: [
                    Padding(padding: EdgeInsets.fromLTRB(26, 5, 10, 5), child:
                      Container(
                        decoration: BoxDecoration(color: CColors.yellow, borderRadius: BorderRadius.circular(4), border: Border.all(color: CColors.orange, width: 2)),
                        width: 36, height: 36, child:
                        Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('7', style: CTextStyles.Headline(color: CColors.orangeDark)),
                            Text('만원', style: CTextStyles.Caption2(color: CColors.orangeDark))
                          ],
                        ),
                      ),
                    ),
                    Expanded(child:
                      Row(children: [
                        Text('빚갚고 돈모으는 절약방', style: TextStyle(fontSize: 18, color: CColors.white)),
                        Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0), child:
                          Container(color: CColors.gray30, width: 34, height: 16, alignment: Alignment.center, child:
                            Text('D-7', style: CTextStyles.Body3())
                          )
                        )
                      ])
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(children: [
                  Padding(padding: EdgeInsets.fromLTRB(26, 5, 5, 5), child:
                    Image.asset('assets/ranking/icon_people_20_20.png', width: 20, height: 20),
                  ),
                  Expanded(child:
                    Text('10/10', style: CTextStyles.Caption2()),
                  ),
                ])
              ],
            ),
            SizedBox(height: 80, child:
              Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/ranking/cong_bg_375_80.png'), fit: BoxFit.fill),
                    ),
                    child:
                      Row(children: [
                        Padding(padding: EdgeInsets.fromLTRB(16, 0, 20, 0), child:
                          Image.asset('assets/ranking/icon_first_24_24.png', width: 24, height: 24),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 30, 0), child:
                          Image.asset('assets/ranking/first_profile_60_60.png', width: 60, height: 60),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 6, 0), child:
                          Image.asset('assets/ranking/icon_lv2_16_16.png', width: 16, height: 16),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child:
                          Text('강적금', style: CTextStyles.Body2()),
                        ),
                        Expanded(child:
                          Text('-1,000', textAlign: TextAlign.right, style: CTextStyles.Body3(color: CColors.purpleLight))
                        )
                      ])
                  )
              ]),
            ),
            SizedBox(height: 64, child:
              Column(children: [
                  Row(children: [
                    Padding(padding: EdgeInsets.fromLTRB(16, 0, 27, 0), child:
                      Text('4위', style: CTextStyles.Body2()),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 44, 0), child:
                      Image.asset('assets/ranking/profile_40_40.png', width: 40, height: 40),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 6, 0), child:
                      Image.asset('assets/ranking/icon_lv2_16_16.png', width: 16, height: 16),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child:
                      Text('강적금', style: CTextStyles.Body2()),
                    ),
                    Expanded(child:
                      Text('-3,000', textAlign: TextAlign.right, style: CTextStyles.Body3(color: CColors.purpleLight))
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(height: 64, child:
              Column(children: [
                  Row(children: [
                    Padding(padding: EdgeInsets.fromLTRB(16, 0, 27, 0), child:
                      Text('5위', style: CTextStyles.Body2()),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 44, 0), child:
                      Image.asset('assets/ranking/profile_40_40.png', width: 40, height: 40),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 6, 0), child:
                      Image.asset('assets/ranking/icon_lv4_16_16.png', width: 16, height: 16),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child:
                      Text('강적금', style: CTextStyles.Body2()),
                    ),
                    Expanded(child:
                      Text('-3,200', textAlign: TextAlign.right, style: CTextStyles.Body3(color: CColors.purpleLight))
                    )
                  ])
                ]
              )
            )
          ]
        ),
        Column(children: [
          Padding(padding: EdgeInsets.fromLTRB(0, 13, 0, 11), child:
            Row(children: [
              Expanded(child:
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: CColors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))), child:
                  Text("인증내역", style: CTextStyles.Headline(), textAlign: TextAlign.center),
                  onPressed: () {
                    setState(() {
                      isAuthenticationPressed = true;
                      items = List.generate(20, (index) => '아이템 ${index}');
                    });
                  }
                )
              ),
              Expanded(child:
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: CColors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))), child:
                  Text("나의인증", style: CTextStyles.Headline(), textAlign: TextAlign.center),
                  onPressed: () {
                      setState(() {
                        isAuthenticationPressed = false;
                        items = List.generate(1, (index) => '아이템 ${index}');
                      });
                  }
                )
              )
            ])
          ),
          Visibility(visible: isAuthenticationPressed, child:
            Padding(padding: EdgeInsets.fromLTRB(24, 16, 23, 16), child:
              Row(children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 22, 0), child:
                  Container(color: CColors.gray20, width: 28, child:
                    Text("월", style: CTextStyles.Headline(), textAlign: TextAlign.center)
                  )
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 22, 0), child:
                  Container(color: CColors.gray20, width: 28, child:
                    Text("화", style: CTextStyles.Headline(), textAlign: TextAlign.center)
                  )
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 22, 0), child:
                  Container(color: CColors.gray20, width: 28, child:
                    Text("수", style: CTextStyles.Headline(), textAlign: TextAlign.center)
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 22, 0), child:
                  Container(color: CColors.gray20, width: 28, child:
                    Text("목", style: CTextStyles.Headline(), textAlign: TextAlign.center)
                  )
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 22, 0), child:
                  Container(color: CColors.gray20, width: 28, child:
                    Text("금", style: CTextStyles.Headline(), textAlign: TextAlign.center)
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 22, 0), child:
                  Container(color: CColors.gray20, width: 28, child:
                    Text("토", style: CTextStyles.Headline(), textAlign: TextAlign.center)
                  )
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child:
                  Container(color: CColors.gray20, width: 28, child:
                    Text("일", style: CTextStyles.Headline(), textAlign: TextAlign.center)
                  )
                )
              ])
            )
          ),
          Expanded(child:
            GridView.builder(padding: EdgeInsets.fromLTRB(16, 20, 16, 0), shrinkWrap: true, itemCount: items.length, scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 26.0, mainAxisSpacing: 20.0),
              itemBuilder: (BuildContext context, int index) {
                return GridItemWidget(item: items[index]);
              },
            )
          )
        ]),
        Container(child: Chat())
      ]
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final String item;

  GridItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.tealAccent, child:
      Center(child:
        GestureDetector(child:
          Image.asset('assets/ranking/first_profile_60_60.png'),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(content:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      IconButton(icon: Icon(Icons.close, color: CColors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(child:
                        Center(child:
                          Text('인증내역(1/7)', style: CTextStyles.Body3())
                        )
                      )
                    ]),
                    Image.asset('assets/ranking/first_profile_60_60.png'),
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child:
                      Text("최지출", style: CTextStyles.Headline())
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child:
                      Text("약값 지출 ...", style: CTextStyles.Headline())
                    ),
                  ]),
                  backgroundColor: CColors.black,
                  actions: [],
                );
              }
            );
          }
        )
      )
    );
  }
}
