import 'package:flutter/material.dart';

import 'package:poorlex/libs/theme.dart';

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

class BattleMoney extends StatelessWidget {
  late final int current;
  late final Function onChange;
  final List<TabItem> list = [
    TabItem(label: '전체', icon: null, value: 1000000000000000),
    TabItem(
        label: '~8만원',
        icon:
            Image.asset('assets/my_page/icon_gold.png', width: 18, height: 14),
        value: 8),
    TabItem(
        label: '~14만원',
        icon: Image.asset('assets/my_page/icon_silver.png',
            width: 18, height: 14),
        value: 14),
    TabItem(
        label: '~20만원',
        icon: Image.asset('assets/my_page/icon_cooper.png',
            width: 18, height: 14),
        value: 20),
  ];
  BattleMoney({super.key, required this.current, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list.map(
          (item) {
            final findIndex = list.indexOf(item);
            bool isSelected = item.value == current;
            return Container(
              margin: findIndex == 0 ? null : EdgeInsets.only(left: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.all(10),
                  backgroundColor: isSelected ? CColors.yellow : CColors.black,
                  side: BorderSide(
                      width: 1.0,
                      color: Color(isSelected ? 0xffffd600 : 0xff666666)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(item.label,
                        style: CTextStyles.Body3(
                            color: isSelected ? CColors.black : CColors.white)),
                    SizedBox(width: 4),
                    item.icon == null ? SizedBox.shrink() : item.icon as Image
                  ],
                ),
                onPressed: () {
                  onChange(item.value);
                },
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
