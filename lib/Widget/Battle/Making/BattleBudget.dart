import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Controller/Battle.dart';

import 'package:poorlex/Libs/Theme.dart';

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
                Color itemColor = CustomColors.yellow;
                con.changeBudgetColor(itemColor);
              } else {
                Color itemColor = CustomColors.gray41;
                con.changeBudgetColor(itemColor);
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: SizedBox(
                  width: 62,
                  height: 42,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(side: BorderSide(color: con.budgetColor.value), padding: EdgeInsets.zero,), child:
                    Center(child:
                      Text('${item}만원', style: CustomTextStyles.Body3(color: con.budgetColor.value)),
                    ),
                    onPressed: () {
                      con.budgetUpdate(item);
                    },
                  ),
                ),
              );
            }).toList(),
          ));
    });
  }
}
