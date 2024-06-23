import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/medal.dart';
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
    return Container(
      padding: EdgeInsets.only(
        top: 14,
        left: 16,
        right: 16,
        bottom: 28,
      ),
      decoration: BoxDecoration(
        color: CColors.gray10,
        borderRadius: BorderRadius.circular(2),
      ),
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
                      height: 24 / 14,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      LevelMedal(
                        level: user.userInfo?.levelInfo.level ?? 0,
                        size: 22,
                      ),
                      SizedBox(width: 12, height: 25),
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
                    style: CTextStyles.Body3(
                      color: CColors.gray50,
                      height: 24 / 14,
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    height: 25,
                    alignment: Alignment.bottomCenter,
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
          SizedBox(height: 14),
          Container(
            decoration: BoxDecoration(
              color: CColors.gray20,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
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
            margin: EdgeInsets.only(top: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 53,
                  height: 42,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '성공',
                        style: CTextStyles.Body3(
                          color: CColors.gray50,
                        ),
                      ),
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
                ),
                SizedBox(
                  width: 53,
                  height: 42,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        height: 20,
                        'assets/my_page/icon_gold.png',
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
                ),
                SizedBox(
                  width: 53,
                  height: 42,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        height: 20,
                        'assets/my_page/icon_silver.png',
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
                ),
                SizedBox(
                  width: 53,
                  height: 42,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        height: 20,
                        'assets/my_page/icon_cooper.png',
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
