import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Libs/String.dart';
import 'package:poorlex/Widget/Common/Buttons.dart';

import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Common/Other.dart';
import 'package:poorlex/Widget/Common/BottomBar.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Libs/Time.dart';
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
        floatingActionButton: CButton(
          type: ButtonTypes.elevated,
          color: CColors.yellow,
          radius: 40.0,
          padding: EdgeInsets.symmetric(vertical: 22),
          child: CIcon(
              icon: 'plus', width: 20, height: 20, color: CColors.blackStr),
          onPressed: () => Get.toNamed('/my/expense-input'),
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
                icon: CIcon(
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
                          return CButton(
                            onPressed: () => Get.toNamed('/my/expense-detail', arguments: { 'id': e.id }),
                            child: Container(
                                width: ((size?.width ?? 0) - 50) / 2,
                                child: e.mainImageUrl != null ? BackgroundImageWithBlack(
                                    image: NetworkImage(e.mainImageUrl!),
                                    height: ((size?.width ?? 0) - 50) / 2,
                                    child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              CTimeFormat(DateTime.parse('${e.date} 00:00:00').millisecondsSinceEpoch, 'yyyy.MM.dd (E)'),
                                              style: CTextStyles.Caption1(
                                                  color: CColors.gray50)),
                                          SizedBox(height: 13),
                                          Text('${makeComma(e.amount!)}원',
                                              style: CTextStyles.Headline()),
                                        ])) : SizedBox.shrink()),
                          );
                        }).toList())));
              }, childCount: 1)),
            ],
          ),
        ));
  }
}
