import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:poorlex/Widget/Common/icon.dart';
import 'package:poorlex/Widget/Common/other.dart';

import 'package:poorlex/Widget/MainPageWidget/bottom_bar.dart';
import 'package:poorlex/Widget/Common/picker.dart';

class MyExpensePage extends StatefulWidget {
  MyExpensePage({
    super.key
  });

  @override
  State<MyExpensePage> createState() => _MyExpensePageState();
}

class _MyExpensePageState extends State<MyExpensePage> {
  final int current = DateTime.now().millisecondsSinceEpoch;

  void select (int n) {
    print(n);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomBar(
        nowPage: 4,
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                iconSize: 26, style: IconButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                icon: CustomIcon(icon: 'arrow-left', width: 26, height: 26, color: '#ffffff'),
                onPressed: () {},
            ),
            Text('내 지출', style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(width: 26)
          ],
        ),
      ),
      body:
        SafeArea(child:
          CustomScrollView(
            slivers: [
              SliverList(
                  delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
                      child:
                        Column(
                          children: [
                            Row(
                                children: [
                                  Expanded(child:
                                    TextButton(
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                      child:
                                        BackgroundImageWithBlack(image: 'assets/sample/sample2.png', height: 153, child:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                                              SizedBox(height: 13),
                                              Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                                            ],
                                          )
                                        ),
                                      onPressed: () {  },
                                    )
                                  ),
                                  SizedBox(width: 17),
                                  Expanded(child:
                                    TextButton(
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                      child:
                                        BackgroundImageWithBlack(image: 'assets/sample/sample2.png', height: 153, child:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                                              SizedBox(height: 13),
                                              Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                                            ],
                                          )
                                        ),
                                      onPressed: () {  },
                                    )
                                  ),
                                ]
                            ),
                            SizedBox(height: 17),
                            Row(
                                children: [
                                  Expanded(child:
                                  TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    child:
                                    BackgroundImageWithBlack(image: 'assets/sample/sample2.png', height: 153, child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                                        SizedBox(height: 13),
                                        Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                                      ],
                                    )
                                    ),
                                    onPressed: () {  },
                                  )
                                  ),
                                  SizedBox(width: 17),
                                  Expanded(child:
                                  TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    child:
                                    BackgroundImageWithBlack(image: 'assets/sample/sample2.png', height: 153, child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                                        SizedBox(height: 13),
                                        Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                                      ],
                                    )
                                    ),
                                    onPressed: () {  },
                                  )
                                  ),
                                ]
                            ),
                          ],
                        )
                    );
                  }, childCount: 1)
              ),
              SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.black,
                  elevation: 0,
                  title: Container(
                      child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              iconSize: 26, style: IconButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                              icon: CustomIcon(icon: 'arrow-game-left', width: 25, height: 25, color: '#ffffff'),
                              onPressed: () {},
                            ),
                            Picker(
                                type: 'MONTH',
                                current: current,
                                child: Row(
                                  children: [
                                    Text(DateFormat('yyyy년 MM월').format(DateTime.fromMillisecondsSinceEpoch(current)),
                                        style: TextStyle(color: Colors.white, fontSize: 20)),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_drop_down_sharp, size: 35, color: Colors.white,)
                                  ],
                                ),
                                select: select
                            ),
                            IconButton(
                              iconSize: 26, style: IconButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                              icon: CustomIcon(icon: 'arrow-game-right', width: 25, height: 25, color: '#ffffff'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                  )
              ),
              SliverList(
                  delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
                        child:
                        Column(
                          children: [
                            Row(
                                children: [
                                  Expanded(child:
                                  TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    child:
                                    BackgroundImageWithBlack(image: 'assets/sample/sample2.png', height: 153, child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                                        SizedBox(height: 13),
                                        Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                                      ],
                                    )
                                    ),
                                    onPressed: () {  },
                                  )
                                  ),
                                  SizedBox(width: 17),
                                  Expanded(child:
                                  TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    child:
                                    BackgroundImageWithBlack(image: 'assets/sample/sample2.png', height: 153, child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                                        SizedBox(height: 13),
                                        Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                                      ],
                                    )
                                    ),
                                    onPressed: () {  },
                                  )
                                  ),
                                ]
                            ),
                            SizedBox(height: 17),
                            Row(
                                children: [
                                  Expanded(child:
                                  TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    child:
                                    BackgroundImageWithBlack(image: 'assets/sample/sample2.png', height: 153, child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                                        SizedBox(height: 13),
                                        Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                                      ],
                                    )
                                    ),
                                    onPressed: () {  },
                                  )
                                  ),
                                  SizedBox(width: 17),
                                  Expanded(child:
                                  TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    child:
                                    BackgroundImageWithBlack(image: 'assets/sample/sample2.png', height: 153, child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                                        SizedBox(height: 13),
                                        Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                                      ],
                                    )
                                    ),
                                    onPressed: () {  },
                                  )
                                  ),
                                ]
                            ),
                            SizedBox(height: 17),
                            Row(
                                children: [
                                  Expanded(child:
                                    BackgroundImageWithBlack(image: 'assets/sample/sample2.png', height: 153, child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                                          SizedBox(height: 13),
                                          Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                                        ],
                                      )
                                    )
                                  ),
                                  SizedBox(width: 17),
                                  Expanded(child:
                                    BackgroundImageWithBlack(image: 'assets/sample/sample2.png', height: 153, child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                                          SizedBox(height: 13),
                                          Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                                        ],
                                      )
                                    )
                                  ),
                                ]
                            ),
                          ],
                        )
                    );
                  }, childCount: 1)
              ),
            ],
          ),
        )
    );
  }
}
