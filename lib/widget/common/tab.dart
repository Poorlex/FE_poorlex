import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';

class CTabItem {
  String label;
  dynamic value;
  void Function(int) onClick;

  CTabItem({
    required this.label,
    required this.value,
    required this.onClick,
  });
}

class CTab extends StatelessWidget {
  final dynamic selected;
  final List<CTabItem> list;

  CTab({
    super.key,
    required this.selected,
    List<CTabItem>? list,
  }) : this.list = list ?? [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: list.map((item) {
              return GestureDetector(
                onTap: () => item.onClick(item.value),
                child: Container(
                    margin: EdgeInsets.only(right: 36),
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: selected == item.value
                          ? Border(
                              bottom:
                                  BorderSide(color: CColors.yellow, width: 2),
                            )
                          : null,
                      color: Colors.transparent,
                    ),
                    child: Text(item.label,
                        style: CTextStyles.Title3(
                            color: selected == item.value
                                ? CColors.white
                                : CColors.gray41))),
              );
            }).toList()));
  }
}
