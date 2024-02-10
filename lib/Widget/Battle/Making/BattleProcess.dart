import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:poorlex/Controller/Battle.dart';

class BattleProcess extends GetView {
  const BattleProcess({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> colors = [0, 1, 2, 3];

    BattleController con = Get.put(BattleController());
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          colors.length,
          (index) {
            return Row(
              children: [
                if (con.battleMakingIndex().BattleIndex > 3)
                  ...[]
                else if (con.battleMakingIndex().BattleIndex ==
                    colors[index]) ...[
                  Container(width: 5, height: 5, decoration: BoxDecoration(color: Color(0xffffd600))),
                  SizedBox(width: 10),
                ] else ...[
                  Container(width: 5, height: 5, decoration: BoxDecoration(color: Color(0xff333333))),
                  SizedBox(width: 10),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
