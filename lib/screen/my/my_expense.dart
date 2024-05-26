import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/libs/string.dart';
import 'package:poorlex/widget/common/buttons.dart';

import 'package:poorlex/widget/common/icon.dart';
import 'package:poorlex/widget/common/other.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/libs/time.dart';
import 'package:poorlex/controller/user.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setContainerSize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.black,
      floatingActionButton: CButton(
        type: ButtonTypes.elevated,
        color: CColors.yellow,
        radius: 40.0,
        padding: EdgeInsets.symmetric(vertical: 22),
        child: CIcon(
            icon: 'plus-big', width: 20, height: 20, color: CColors.blackStr),
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
              onPressed: () => Navigator.of(context).pop(),
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
                    child: Obx(
                      () => Wrap(
                        spacing: 18,
                        runSpacing: 18,
                        children: user.expenditures.length == 0
                            ? [
                                Container(
                                  height: 500,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 250,
                                          child: Column(
                                            children: [
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/my_page/wallet_smile.png',
                                                    width: 200,
                                                    height: 200,
                                                  ),
                                                  SizedBox(height: 30),
                                                  Text(
                                                    '지출 내역이 없습니다.',
                                                    style: CTextStyles.Title2(
                                                        color: CColors.gray40),
                                                  )
                                                ],
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                )
                              ]
                            : user.expenditures.map<Widget>(
                                (e) {
                                  return CButton(
                                    onPressed: () => Get.toNamed(
                                        '/my/expense-detail',
                                        arguments: {'id': e.id}),
                                    child: Container(
                                      width: ((size?.width ?? 0) - 50) / 2,
                                      child: e.mainImageUrl != null
                                          ? BackgroundImageWithBlack(
                                              image:
                                                  NetworkImage(e.mainImageUrl!),
                                              height:
                                                  ((size?.width ?? 0) - 50) / 2,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      cTimeFormat(
                                                          DateTime.parse(
                                                                  '${e.date} 00:00:00')
                                                              .millisecondsSinceEpoch,
                                                          'yyyy.MM.dd (E)'),
                                                      style:
                                                          CTextStyles.Caption1(
                                                              color: CColors
                                                                  .gray50)),
                                                  SizedBox(height: 13),
                                                  Text(
                                                    '${makeComma(e.amount!)}원',
                                                    style:
                                                        CTextStyles.Headline(),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : SizedBox.shrink(),
                                    ),
                                  );
                                },
                              ).toList(),
                      ),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
