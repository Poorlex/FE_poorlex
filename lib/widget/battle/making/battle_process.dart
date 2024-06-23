import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/controller/battle.dart';

import 'package:poorlex/libs/theme.dart';

class BattleProcess extends GetView {
  BattleProcess({super.key});

  final BattleController battle = Get.find<BattleController>();

  @override
  Widget build(BuildContext context) {
    List<int> colors = [0, 1, 2];
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
              colors.length,
              (index) => Row(
                    children: [
                      if (battle.battleCreate.current > 3)
                        ...[]
                      else if (battle.battleCreate.current ==
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
