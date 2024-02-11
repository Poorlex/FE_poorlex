import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Controller/Battle.dart';

import 'package:poorlex/Libs/Theme.dart';

class TabItem {
  String label;
  Image? icon;
  dynamic value;

  TabItem({
    required this.label,
    required this.value,
    this.icon,
  });
}

class BattleMoney extends GetView {
  BattleController _battle = BattleController();
  final int moneyIndex;
  final List<TabItem> list = [
    TabItem(label: '전체', icon: null, value: 0),
    TabItem(label: '~8만원', icon: Image.asset('assets/my_page/icon_gold.png', width: 18, height: 14), value: 1),
    TabItem(label: '~14만원', icon: Image.asset('assets/my_page/icon_silver.png', width: 18, height: 14), value: 2),
    TabItem(label: '~20만원', icon: Image.asset('assets/my_page/icon_cooper.png', width: 18, height: 14), value: 3),
  ];

  BattleMoney({
    super.key,
    required this.moneyIndex
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
          children: list.map((item) {
            bool isSelected = item.value == _battle.battleIndex().MoneyIndex;
            return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? CustomColors.yellow : CustomColors.black,
                  side: BorderSide(width: 1.0, color: Color(isSelected ? 0xffffd600 : 0xff666666)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                onPressed: () {
                  _battle.changeBattleMoneyIndex(item.value);
                },
                child: Row(
                  children: [
                    Text(item.label, style: CustomTextStyles.Body3(isSelected ? CustomColors.black : CustomColors.white)),
                    item.icon == null ? Container() : item.icon as Image
                  ],
                ),
              ),
            );
          }).toList()
      ))
    );
  }
}
