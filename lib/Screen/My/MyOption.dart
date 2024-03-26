import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Models/User.dart';
import 'package:poorlex/Widget/Layout.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/User.dart';

import 'package:poorlex/Widget/Common/Buttons.dart';
import 'package:poorlex/Widget/Common/Icon.dart';

class MyOption extends StatefulWidget {
  MyOption({super.key});

  @override
  State<MyOption> createState() => _MyOptionState();
}

class _MyOptionState extends State<MyOption> {
  final user = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    user.getUserAlarm();
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
              Text('알림 설정', style: CTextStyles.Headline()),
              SizedBox(width: 26)
            ],
          ),
        ),
        body: Layout(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Column(children: [
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Row(children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('지출 입력 알림', style: CTextStyles.Body2()),
                                SizedBox(height: 10),
                                Text('매일 9시 지출 입력 요청 알림',
                                    style: CTextStyles.Body3(
                                        color: CColors.gray41)),
                              ],
                            )),
                            Switch(
                              activeColor: CColors.white,
                              activeTrackColor: CColors.yellow,
                              inactiveThumbColor: CColors.gray10,
                              inactiveTrackColor: CColors.gray50,
                              onChanged: (bool value) => user.updateUserAlarm('EXPENDITURE_REQUEST', value),
                              value: user.alarmAllows.value.allowExpenditureRequestAlarm ?? false,
                            )
                          ])),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Row(children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('대결 시작/종료/탈락', style: CTextStyles.Body2()),
                                    SizedBox(height: 10),
                                    Text('월요일 9시 시작/일요일 10시 종료 알림',
                                        style: CTextStyles.Body3(
                                            color: CColors.gray41)),
                                  ],
                                )),
                            Switch(
                              activeColor: CColors.white,
                              activeTrackColor: CColors.yellow,
                              inactiveThumbColor: CColors.gray10,
                              inactiveTrackColor: CColors.gray50,
                              onChanged: (bool value) => user.updateUserAlarm('BATTLE_STATUS', value),
                              value: user.alarmAllows.value.allowBattleStatusAlarm ?? false,
                            )
                          ])),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Row(children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('채팅방 알림', style: CTextStyles.Body2()),
                                    SizedBox(height: 10),
                                    Text('다른 거지 지출/투표/배틀 탈락 여부',
                                        style: CTextStyles.Body3(
                                            color: CColors.gray41)),
                                  ],
                                )),
                            Switch(
                              activeColor: CColors.white,
                              activeTrackColor: CColors.yellow,
                              inactiveThumbColor: CColors.gray10,
                              inactiveTrackColor: CColors.gray50,
                              onChanged: (bool value) => user.updateUserAlarm('BATTLE_CHAT', value),
                              value: user.alarmAllows.value.allowBattleChatAlarm ?? false,
                            )
                          ])),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Row(children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('지출 입력 알림', style: CTextStyles.Body2()),
                                    SizedBox(height: 10),
                                    Text('친구 요청/요청 승인 여부',
                                        style: CTextStyles.Body3(
                                            color: CColors.gray41)),
                                  ],
                                )),
                            Switch(
                              activeColor: CColors.white,
                              activeTrackColor: CColors.yellow,
                              inactiveThumbColor: CColors.gray10,
                              inactiveTrackColor: CColors.gray50,
                              onChanged: (bool value) => user.updateUserAlarm('FRIEND', value),
                              value: user.alarmAllows.value.allowFriendAlarm ?? false,
                            )
                          ])),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Row(children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('지출 입력 알림', style: CTextStyles.Body2()),
                                    SizedBox(height: 10),
                                    Text('초대 요청/요청 승인 여부',
                                        style: CTextStyles.Body3(
                                            color: CColors.gray41)),
                                  ],
                                )),
                            Switch(
                              activeColor: CColors.white,
                              activeTrackColor: CColors.yellow,
                              inactiveThumbColor: CColors.gray10,
                              inactiveTrackColor: CColors.gray50,
                              onChanged: (bool value) => user.updateUserAlarm('BATTLE_INVITE', value),
                              value: user.alarmAllows.value.allowBattleInvitationAlarm ?? false,
                            )
                          ]))
                    ])))));
  }
}
