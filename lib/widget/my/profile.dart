import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/audio_controller.dart';

import 'package:poorlex/controller/user.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/user.dart';

class MyPageProfile extends StatelessWidget {
  MyPageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController user = Get.find<UserController>();
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Obx(
                () => LevelProfile(level: user.userInfo?.levelInfo.level ?? 1),
              ),
              SizedBox(height: 18),
              Container(
                width: 300,
                child: Column(
                  children: [
                    Obx(
                      () => Text(
                        user.userInfo?.nickname ?? '-',
                        style: CTextStyles.Title3(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Obx(
                      () => Text(
                        user.userInfo?.description ?? '-',
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: CTextStyles.Body2(color: CColors.gray40),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  AudioController().play(audioType: AudioType.complete);
                  Get.toNamed('/my/profile');
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: CColors.yellow),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  width: 211,
                  height: 30,
                  child: Text(
                    '프로필 편집',
                    style: CTextStyles.Body3(color: CColors.yellow),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
