import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:poorlex/Controller/Battle.dart';

import 'package:poorlex/Libs/Theme.dart';

class BattleProcess extends GetView {
  BattleProcess({super.key});

  BattleController battle = Get.find<BattleController>();

  @override
  Widget build(BuildContext context) {
    List<int> colors = [0, 1, 2];
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
              colors.length,
              (index) => Row(
                    children: [
                      if (battle.battleCreate.value.current > 3)
                        ...[]
                      else if (battle.battleCreate.value.current ==
                          colors[index]) ...[
                        Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(color: CColors.yellow)),
                        SizedBox(width: 10),
                      ] else ...[
                        Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(color: CColors.gray20)),
                        SizedBox(width: 10),
                      ],
                    ],
                  )),
        ));
  }
}
