import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Models/User.dart';

import 'package:poorlex/Widget/Common/Buttons.dart';
import 'package:poorlex/Widget/Common/icon.dart';
import 'package:poorlex/Widget/Common/other.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/User.dart';

class MyPageMyAuth extends StatefulWidget {
  const MyPageMyAuth({super.key});

  @override
  State<MyPageMyAuth> createState() => _MyPageMyAuthState();
}

class _MyPageMyAuthState extends State<MyPageMyAuth> {
  final user = Get.find<UserController>();
  final GlobalKey containerKey = GlobalKey();
  Size? size;

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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setContainerSize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('내 지출', style: CTextStyles.Headline()),
          SizedBox(width: 10),
          Obx(
            () => Text(user.userInfo.value.friendTotalCount.toString(),
                style: CTextStyles.Headline(color: CColors.purpleLight)),
          )
        ],
      ),
      SizedBox(height: 20),
      Container(
          key: containerKey,
          child: Obx(() => Wrap(
              spacing: 18,
              runSpacing: 18,
              children:
                  (user.userInfo.value.expenditures ?? []).map<Widget>((e) {
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
              }).toList()))),
      SizedBox(height: 17),
      CButton(
        type: ButtonTypes.outlined,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('지출 전체 보기', style: CTextStyles.Body3(color: CColors.yellow)),
            SizedBox(width: 5),
            CustomIcon(
                icon: 'arrow-game-right',
                width: 15,
                height: 15,
                color: CColors.yellowStr)
          ]),
        ),
        onPressed: () => Get.toNamed('/my/expenditure'),
      )
    ]);
  }
}
