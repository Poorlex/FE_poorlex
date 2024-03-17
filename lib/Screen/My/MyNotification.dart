import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Controller/User.dart';
import 'package:poorlex/Widget/Common/Buttons.dart';

import 'package:poorlex/Widget/Common/Icon.dart';

import 'package:poorlex/Libs/Theme.dart';

class MyNotification extends StatefulWidget {
  MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  final user = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    user.getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.black,
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
              Text('알림', style: CTextStyles.Headline()),
              SizedBox(width: 26)
            ],
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('오늘', style: CTextStyles.Headline()),
                    SizedBox(width: 2),
                    Image.asset('assets/my_page/new.png')
                  ],
                ),
                SizedBox(height: 10),
                Container(height: 1, color: CColors.yellow),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text.rich(
                        TextSpan(
                            style: CTextStyles.Body3(height: 1.6),
                            children: [
                              TextSpan(
                                  text: '김저금님이 절약하자 절약하자 방에 초대하셨습니다. 김저금님이'),
                              TextSpan(text: '  '),
                              TextSpan(
                                  text: '5분전',
                                  style:
                                      CTextStyles.Body3(color: CColors.gray40))
                            ]),
                      )),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: CButton(
                            type: ButtonTypes.elevated,
                            color: CColors.yellow,
                            child: Text('수락',
                                style:
                                    CTextStyles.Body3(color: CColors.black))),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text.rich(
                          TextSpan(
                              style: CTextStyles.Body3(height: 1.6),
                              children: [
                                TextSpan(
                                    text: '김저금님이 절약하자 절약하자 방에 초대하셨습니다. 김저금님이'),
                                TextSpan(text: '  '),
                                TextSpan(
                                    text: '5분전',
                                    style: CTextStyles.Body3(
                                        color: CColors.gray40))
                              ]),
                        ))
                      ],
                    ))
              ],
            )),
      )),
    );
  }
}
