import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/medal.dart';

import 'package:poorlex/widget/common/other.dart';
import 'package:poorlex/controller/user.dart';

class MyPageLevel extends StatefulWidget {
  MyPageLevel({super.key});

  @override
  State<MyPageLevel> createState() => _MyPageLevelState();
}

class _MyPageLevelState extends State<MyPageLevel> {
  UserController user = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return GameBox(
      color: CColors.gray10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 28),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '거지 레벨',
                          style: CTextStyles.Body3(
                            color: CColors.gray50,
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            LevelMedal(
                              level: user.userInfo?.levelInfo.level ?? 0,
                              size: 20,
                            ),
                            SizedBox(width: 12),
                            Obx(
                              () => Text(
                                'LV.${user.userInfo?.levelInfo.level ?? '-'}',
                                style: CTextStyles.Title3(),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 68,
                      width: 1,
                      decoration: BoxDecoration(color: CColors.gray20),
                    ),
                    Column(
                      children: [
                        Text(
                          '보유 포인트',
                          style: CTextStyles.Body3(color: CColors.gray50),
                        ),
                        SizedBox(height: 12),
                        Container(
                          child: Obx(
                            () => Text(
                              '${user.userInfo?.levelInfo.point ?? '-'} P',
                              style: CTextStyles.Title3(),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: CColors.gray20,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            '+${user.userInfo?.levelInfo.pointLeftForLevelUp ?? '-'} P',
                            style: CTextStyles.Body3(
                              color: CColors.yellow,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '더 모으면 레벨 업 !',
                          style: CTextStyles.Body3(),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 26, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '성공',
                              style: CTextStyles.Body3(
                                color: CColors.gray50,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Obx(
                            () => Text(
                              user.userInfo?.battleSuccessInfo
                                      .totalBattleSuccessCount
                                      .toString() ??
                                  '-',
                              style: CTextStyles.Title3(),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Image.asset(
                                width: 35,
                                height: 42,
                                'assets/my_page/icon_gold.png'),
                          ),
                          Obx(
                            () => Text(
                              user.userInfo?.battleSuccessInfo
                                      .hardBattleSuccessCount
                                      .toString() ??
                                  '-',
                              style: CTextStyles.Title3(),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Image.asset(
                                width: 35,
                                height: 42,
                                'assets/my_page/icon_silver.png'),
                          ),
                          Obx(
                            () => Text(
                              user.userInfo?.battleSuccessInfo
                                      .normalBattleSuccessCount
                                      .toString() ??
                                  '-',
                              style: CTextStyles.Title3(),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Image.asset(
                              width: 35,
                              height: 42,
                              'assets/my_page/icon_cooper.png',
                            ),
                          ),
                          Obx(
                            () => Text(
                              user.userInfo?.battleSuccessInfo
                                      .easyBattleSuccessCount
                                      .toString() ??
                                  '-',
                              style: CTextStyles.Title3(),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
