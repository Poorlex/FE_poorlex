import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Controller/Goal.dart';
import 'package:poorlex/Libs/Theme.dart';

class CreateGoalFirst extends GetView<GoalController> {
  const CreateGoalFirst({super.key});

  @override
  Widget build(BuildContext context) {
    GoalController controller = Get.put(GoalController());

    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _contentController = TextEditingController();
    List<String> items = [
      'bomb.png',
      'piggy_bank.png',
      'nucleus.png',
      'diamond.png'
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
        child: Container(
          width: 300,
          height: 70,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('지금 나에게 가장 필요한\n삶의 가치는 무엇일까요?', style: TextStyle(fontSize: 24, height: 1.0, letterSpacing: -0.25, color: CustomColors.white))
          ])
        )
      ),
      SizedBox(height: 44),
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16.0, mainAxisSpacing: 50.0),
        shrinkWrap: true, itemCount: 4, scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) => GridItem(item: items[index], index: index)
      ),
    ]);
  }
}

class GridItem extends StatelessWidget {
  String item;
  int index;
  GoalController controller = Get.put(GoalController());

  GridItem({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(child:
      Container(child:
        Center(child:
          Image.asset(controller.isSelectedList[index] ? 'assets/goal/gold_${item}' : 'assets/goal/$item')
        )
      ),
      onTap: () {
        controller.toggleSelection(index);
      },
    ));
  }
}
