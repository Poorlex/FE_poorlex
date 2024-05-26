import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:poorlex/libs/string.dart';

import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/widget/common/icon.dart';
import 'package:poorlex/widget/common/other.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/libs/time.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/widget/gnb_layout.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setContainerSize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('내 지출', style: CTextStyles.Headline()),
          SizedBox(width: 10),
          Obx(
            () => Text(user.userInfo.value.expenditureTotalCount.toString(),
                style: CTextStyles.Headline(color: CColors.purpleLight)),
          )
        ],
      ),
      SizedBox(height: 20),
      Row(children: [
        Expanded(
            child: Obx(() => Wrap(
                spacing: 18,
                runSpacing: 18,
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: (user.userInfo.value.expenditures ?? [])
                    .mapIndexed<Widget>((index, e) {
                  return size != null && index < 4
                      ? CButton(
                          onPressed: () => Get.toNamed(
                            '/my/expense-detail',
                            arguments: {'id': e.id},
                            id: GNBLayout.globalKey,
                          ),
                          child: Container(
                              width: ((size?.width ?? 36) - 18) / 2,
                              child: e.imageUrl != null
                                  ? BackgroundImageWithBlack(
                                      image: NetworkImage(e.imageUrl!),
                                      height: ((size?.width ?? 36) - 18) / 2,
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
                                                style: CTextStyles.Caption1(
                                                    color: CColors.gray50)),
                                            SizedBox(height: 13),
                                            Text('${makeComma(e.amount!)}원',
                                                style: CTextStyles.Headline()),
                                          ]))
                                  : SizedBox.shrink()),
                        )
                      : SizedBox.shrink();
                }).toList())))
      ]),
      SizedBox(height: 17),
      CButton(
        key: containerKey,
        type: ButtonTypes.outlined,
        color: CColors.yellow.withOpacity(0.6),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('지출 전체 보기', style: CTextStyles.Body3(color: CColors.yellow)),
            SizedBox(width: 5),
            CIcon(
                icon: 'arrow-game-right',
                width: 15,
                height: 15,
                color: CColors.yellowStr)
          ]),
        ),
        onPressed: () => Get.toNamed(
          '/my/expenditure',
          id: GNBLayout.globalKey,
        ),
      )
    ]));
  }
}
