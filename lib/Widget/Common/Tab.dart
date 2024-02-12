import 'package:flutter/material.dart';
import 'package:poorlex/Libs/Theme.dart';

class CustomTabItem {
  String label;
  dynamic value;
  Function onClick;

  CustomTabItem({
    required this.label,
    required this.value,
    required this.onClick
  });
}

class CustomTab extends StatelessWidget {
  dynamic selected;
  List<CustomTabItem> list = [];
  CustomTab({
    super.key,
    required this.selected,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(scrollDirection: Axis.horizontal, child:
      Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children:
        list.map((item) {
          return Container(margin: EdgeInsets.fromLTRB(0, 0, 36, 0), child:
            TextButton(style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size(0, 0), alignment: Alignment.centerLeft), child:
              Container(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  decoration: selected == item.value ? BoxDecoration(border: Border(bottom: BorderSide(color: CColors.yellow, width: 2))) : null, child:
                  Text(item.label, style: CTextStyles.Title3(color: selected == item.value ? CColors.white : CColors.gray41))
              ),
              onPressed: () => item.onClick(item.value)
            )
          );
        }).toList()
      )
    );
  }
}
