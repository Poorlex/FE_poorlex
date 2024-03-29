import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/Battle.dart';

class BattleIndexTwo extends GetView<BattleController> {
  const BattleIndexTwo({super.key});

  Color _getItemColor(int item, int selectedIndex) {
    return item == selectedIndex ? CColors.yellow : CColors.gray41;
  }

  Widget _buildWrap(List<int> items, BattleController con, int selectedIndex) {
    return Wrap(
      spacing: 5.0,
      runSpacing: 2.0,
      children: items.map((item) {
        Color buttonColor = _getItemColor(item, selectedIndex);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: SizedBox(
            width: 50,
            height: 42,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: buttonColor),
                padding: EdgeInsets.zero,
              ),
              onPressed: () => con.indexTwoUpdate(item),
              child: Center(
                child: Text(
                  '${item}명',
                  style: CTextStyles.Body3(color: buttonColor),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    BattleController controller = Get.put(BattleController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text('몇명이 참여하나요?', style: CTextStyles.Title2()),
              IconButton(
                iconSize: 12, color: CColors.gray41, icon:
                Icon(Icons.question_mark_outlined),
                onPressed: () {},
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        Text('1등하면 20점!', style: CTextStyles.Body3(color: CColors.gray41)),
        SizedBox(height: 20),
        Obx(() => SizedBox(
            width: double.infinity,
            height: 100,
            child: _buildWrap(controller.oneToFive, controller,
                controller.selectedIndexTwo.value))),
        Text('1등하면 30점!',
            style: CTextStyles.Body3(color: CColors.gray41)),
        Obx(() => SizedBox(
            width: double.infinity,
            height: 100,
            child: _buildWrap(controller.sixToTen, controller,
                controller.selectedIndexTwo.value))),
      ],
    );
  }
}
