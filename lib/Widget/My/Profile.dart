import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Controller/User.dart';
import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Widget/Common/user.dart';

class MyPageProfile extends StatelessWidget {
  MyPageProfile({super.key});

  UserController user = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Obx(() => LevelProfile(
                  level: user.userInfo.value.levelInfo?.level ?? 1)),
              SizedBox(height: 18),
              Container(
                  width: 300,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Text(user.userInfo.value.nickname ?? '-',
                              style: CTextStyles.Title3()))
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child:
                            Obx(() => Text(
                              user.userInfo.value.description ?? '-',
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: CTextStyles.Body2(color: CColors.gray40),
                            ))
                          )
                        ],
                      )
                    ],
                  )),
              SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      side: BorderSide(width: 1.0, color: CColors.yellow.withOpacity(0.6)),
                    ),
                    child: Container(
                        width: 210,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('프로필 편집',
                                style:
                                    CTextStyles.Body3(color: CColors.yellow)),
                          ],
                        )),
                    onPressed: () => Get.toNamed('/my/profile'),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
