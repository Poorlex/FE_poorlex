import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/libs/theme.dart';

import 'package:poorlex/screen/battle/battle_create.dart';

class EmptyBattle extends StatelessWidget {
  const EmptyBattle({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double secondContainerWidth = constraints.maxWidth - 6;

        return GestureDetector(
          onTap: () {
            /// [TODO] 예산 미설정 시 예산 설정 페이지로 라우팅
            // 배틀 페이지로 이동
            Get.to(() => BattleCreate());
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(color: CColors.blackOpa80),
                width: secondContainerWidth + 6,
                height: 144,
              ),
              Container(
                width: secondContainerWidth,
                height: 150,
                decoration: BoxDecoration(color: CColors.blackOpa80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 36),
                    SizedBox(
                      width: 34,
                      height: 34,
                      child: Image.asset('assets/main_page/empty_battle.png'),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '배틀 방 만들기',
                      style: CTextStyles.Title3(
                        color: CColors.gray70,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
