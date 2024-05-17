import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/widget/common/buttons.dart';

class BattleIndexTwo extends StatelessWidget {
  BattleIndexTwo({super.key});

  final BattleController battle = Get.find<BattleController>();

  Widget _buildWrap(List<int> items, int selectedIndex) {
    return Wrap(
      spacing: 16.0,
      children: items.map((item) {
        var count = battle.battleCreate.value.count;
        return CButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            color: count == item ? CColors.yellow : CColors.gray41,
            type: ButtonTypes.outlined,
            child: Text('${item}명',
                style: CTextStyles.Body3(
                    color: count == item ? CColors.yellow : CColors.gray41)),
            onPressed: () => battle.changeCount(item));
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final BattleController controller = Get.put(BattleController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text('몇명이 참여하나요?', style: CTextStyles.Title2()),
              CButton(
                child: Icon(Icons.question_mark_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text('1등하면 20점!', style: CTextStyles.Body2(color: CColors.gray41)),
        SizedBox(height: 20),
        Obx(() =>
            _buildWrap([1, 2, 3, 4, 5], controller.selectedIndexTwo.value)),
        SizedBox(height: 40),
        Text('1등하면 30점!', style: CTextStyles.Body2(color: CColors.gray41)),
        SizedBox(height: 20),
        Obx(() =>
            _buildWrap([6, 7, 8, 9, 10], controller.selectedIndexTwo.value)),
      ],
    );
  }
}
