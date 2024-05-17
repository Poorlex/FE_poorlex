import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/widget/battle/making/finding_friends.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/controller/battle.dart';

class BattleIndexThree extends GetView {
  const BattleIndexThree({super.key});

  @override
  Widget build(BuildContext context) {
    BattleController con = Get.put(BattleController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Container(
            width: 300,
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('친구를 초대하고', style: CTextStyles.Title2()),
                SizedBox(height: 10),
                Text('함께 배틀 해볼까요?', style: CTextStyles.Title2()),
              ],
            ),
          ),
        ),
        Obx(() {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 100),
            child: Center(
              child: Column(children: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: con.indexThreeFirstColor.value),
                    ),
                    onPressed: () {
                      con.changeIndexThreeColor(1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FindingFriends()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 75),
                      child: Text('네 초대할래요!',
                          style: CTextStyles.Title2(
                              color: con.indexThreeFirstColor.value)),
                    )),
                SizedBox(height: 30),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side:
                            BorderSide(color: con.indexThreeSecondColor.value)),
                    onPressed: () {
                      con.changeIndexThreeColor(2);
                      // con.changeBattleMakingIndex();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 46),
                      child: Text('아니요 초대안할래요!',
                          style: CTextStyles.Title2(
                              color: con.indexThreeSecondColor.value)),
                    ))
              ]),
            ),
          );
        }),
      ],
    );
  }
}
