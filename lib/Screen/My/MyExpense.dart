import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Common/Other.dart';
import 'package:poorlex/Widget/Common/Picker.dart';
import 'package:poorlex/Widget/Common/BottomBar.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/User.dart';

class MyExpensePage extends StatefulWidget {
  MyExpensePage({super.key});

  @override
  State<MyExpensePage> createState() => _MyExpensePageState();
}

class _MyExpensePageState extends State<MyExpensePage> {
  final user = Get.find<UserController>();
  final GlobalKey containerKey = GlobalKey();
  Size? size;
  final int current = DateTime.now().millisecondsSinceEpoch;

  void setContainerSize() {
    if (containerKey.currentContext != null) {
      final RenderBox renderBox =
          containerKey.currentContext!.findRenderObject() as RenderBox;
      setState(() {
        size = renderBox.size;
      });
    }
  }

  void select(int n) {
    print(n);
  }

  @override
  void initState() {
    super.initState();
    user.getExpenditures();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setContainerSize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CColors.black,
        bottomNavigationBar: BottomBar(
          nowPage: 4,
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CColors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                iconSize: 26,
                style: IconButton.styleFrom(
                    padding: EdgeInsets.zero, minimumSize: Size.zero),
                icon: CustomIcon(
                    icon: 'arrow-left',
                    width: 26,
                    height: 26,
                    color: CColors.whiteStr),
                onPressed: () => Get.back(),
              ),
              Text('내 지출', style: CTextStyles.Headline()),
              SizedBox(width: 26)
            ],
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                return Container(
                  key: containerKey,
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
                  child: Obx(() => Wrap(
                      spacing: 18,
                      runSpacing: 18,
                      children:
                      (user.expenditures.value ?? []).map<Widget>((e) {
                        return Container(
                            width: ((size?.width ?? 0) - 18) / 2,
                            child: BackgroundImageWithBlack(
                                image: 'assets/sample/sample2.png',
                                height: ((size?.width ?? 0) - 18) / 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('2023.08.09 (목)',
                                          style: CTextStyles.Caption1(
                                              color: CColors.gray50)),
                                      SizedBox(height: 13),
                                      Text('9.000원', style: CTextStyles.Headline()),
                                    ])));
                      }).toList()))
                );
              }, childCount: 1)),
              /*
              SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: CColors.black,
                  elevation: 0,
                  title: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          iconSize: 26,
                          style: IconButton.styleFrom(
                              padding: EdgeInsets.zero, minimumSize: Size.zero),
                          icon: CustomIcon(
                              icon: 'arrow-game-left',
                              width: 25,
                              height: 25,
                              color: CColors.whiteStr),
                          onPressed: () {},
                        ),
                        Picker(
                            type: 'MONTH',
                            current: current,
                            child: Row(
                              children: [
                                Text(
                                    DateFormat('yyyy년 MM월').format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            current)),
                                    style: TextStyle(
                                        color: CColors.white, fontSize: 20)),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_drop_down_sharp,
                                    size: 35, color: CColors.white)
                              ],
                            ),
                            select: select),
                        IconButton(
                          iconSize: 26,
                          style: IconButton.styleFrom(
                              padding: EdgeInsets.zero, minimumSize: Size.zero),
                          icon: CustomIcon(
                              icon: 'arrow-game-right',
                              width: 25,
                              height: 25,
                              color: CColors.whiteStr),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
                    child: Column(
                      children: [
                        Row(children: [
                          Expanded(
                              child: TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: BackgroundImageWithBlack(
                                image: 'assets/sample/sample2.png',
                                height: 153,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('2023.08.09 (목)',
                                        style: TextStyle(
                                            color: CColors.gray50,
                                            fontSize: 13)),
                                    SizedBox(height: 13),
                                    Text('9.000원',
                                        style: TextStyle(
                                            color: CColors.white,
                                            fontSize: 18)),
                                  ],
                                )),
                            onPressed: () {},
                          )),
                          SizedBox(width: 17),
                          Expanded(
                              child: TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: BackgroundImageWithBlack(
                                image: 'assets/sample/sample2.png',
                                height: 153,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('2023.08.09 (목)',
                                        style: TextStyle(
                                            color: CColors.gray50,
                                            fontSize: 13)),
                                    SizedBox(height: 13),
                                    Text('9.000원',
                                        style: TextStyle(
                                            color: CColors.white,
                                            fontSize: 18)),
                                  ],
                                )),
                            onPressed: () {},
                          )),
                        ]),
                        SizedBox(height: 17),
                        Row(children: [
                          Expanded(
                              child: TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: BackgroundImageWithBlack(
                                image: 'assets/sample/sample2.png',
                                height: 153,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('2023.08.09 (목)',
                                        style: TextStyle(
                                            color: CColors.gray50,
                                            fontSize: 13)),
                                    SizedBox(height: 13),
                                    Text('9.000원',
                                        style: TextStyle(
                                            color: CColors.white,
                                            fontSize: 18)),
                                  ],
                                )),
                            onPressed: () {},
                          )),
                          SizedBox(width: 17),
                          Expanded(
                              child: TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: BackgroundImageWithBlack(
                                image: 'assets/sample/sample2.png',
                                height: 153,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('2023.08.09 (목)',
                                        style: TextStyle(
                                            color: CColors.gray50,
                                            fontSize: 13)),
                                    SizedBox(height: 13),
                                    Text('9.000원',
                                        style: TextStyle(
                                            color: CColors.white,
                                            fontSize: 18)),
                                  ],
                                )),
                            onPressed: () {},
                          )),
                        ]),
                        SizedBox(height: 17),
                        Row(children: [
                          Expanded(
                              child: BackgroundImageWithBlack(
                                  image: 'assets/sample/sample2.png',
                                  height: 153,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('2023.08.09 (목)',
                                          style: TextStyle(
                                              color: CColors.gray50,
                                              fontSize: 13)),
                                      SizedBox(height: 13),
                                      Text('9.000원',
                                          style: TextStyle(
                                              color: CColors.white,
                                              fontSize: 18)),
                                    ],
                                  ))),
                          SizedBox(width: 17),
                          Expanded(
                              child: BackgroundImageWithBlack(
                                  image: 'assets/sample/sample2.png',
                                  height: 153,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('2023.08.09 (목)',
                                          style: TextStyle(
                                              color: CColors.gray50,
                                              fontSize: 13)),
                                      SizedBox(height: 13),
                                      Text('9.000원',
                                          style: TextStyle(
                                              color: CColors.white,
                                              fontSize: 18)),
                                    ],
                                  ))),
                        ]),
                      ],
                    ));
              }, childCount: 1)),
              */
            ],
          ),
        ));
  }
}
