import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/battle_controller.dart';

class BattleBudget extends GetView {
  const BattleBudget({super.key});

  @override
  Widget build(BuildContext context) {
    BattleController con = Get.put(BattleController());
    return Obx(() {
      return SizedBox(
          width: double.infinity,
          height: 200,
          child: Wrap(
            spacing: 5.0,
            runSpacing: 2.0,
            children: con.BudgetList.map((item) {
              if (con.selectedBudget == item) {
                Color itemColor = Color(0xffffd600);
                con.changeBudgetColor(itemColor);
              } else {
                Color itemColor = Color(0xff999999);
                con.changeBudgetColor(itemColor);
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: SizedBox(
                  width: 62,
                  height: 42,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: con.budgetColor.value),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      con.budgetUpdate(item);
                    },
                    child: Center(
                      child: Text('${item}만원',
                          style: TextStyle(
                              fontSize: 14, color: con.budgetColor.value)),
                    ),
                  ),
                ),
              );
            }).toList(),
          ));
    });
  }
}
