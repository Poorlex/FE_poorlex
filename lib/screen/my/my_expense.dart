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
  final _userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    _userController.getExpenditures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CButton(
        type: ButtonTypes.elevated,
        color: CColors.yellow,
        radius: 40.0,
        padding: EdgeInsets.symmetric(vertical: 22),
        child: CIcon(
            icon: 'plus-big', width: 20, height: 20, color: CColors.blackStr),
        onPressed: () async {
          await Get.toNamed('/my/expense/create');
          _userController.getExpenditures();
        },
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
      body: Obx(() {
        if (_userController.userInfo == null ||
            _userController.userInfo!.expenditures.isEmpty) {
          return _emptyWidget();
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 163 / 153,
            mainAxisSpacing: 17,
            crossAxisSpacing: 17,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: _userController.expenditures.length,
          itemBuilder: (context, index) {
            final item = _userController.expenditures[index];
            return GestureDetector(
              onTap: () async {
                await Get.toNamed('/my/expense-detail/${item.id}');
                _userController.getExpenditures();
              },
              child: Container(
                child: BackgroundImageWithBlack(
                  image: NetworkImage(item.mainImageUrl),
                  height: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          cTimeFormat(
                              DateTime.parse('${item.date} 00:00:00')
                                  .millisecondsSinceEpoch,
                              'yyyy.MM.dd (E)'),
                          style: CTextStyles.Caption1(color: CColors.gray50)),
                      SizedBox(height: 13),
                      Text(
                        '${makeComma(item.amount)}원',
                        style: CTextStyles.Headline(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _emptyWidget() {
    return Container(
      height: 500,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 250,
            child: Column(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/empty.png',
                      width: 160,
                      height: 160,
                    ),
                    SizedBox(height: 47),
                    Text(
                      '입력한 정보가 없습니다.',
                      style: CTextStyles.Title2(color: CColors.gray50),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
