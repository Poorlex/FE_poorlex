import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/Icon.dart';

class CRadio extends StatelessWidget {
  final bool isChecked;
  final void Function() onChanged;
  const CRadio({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: 20,
        height: 20,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: CColors.white,
            width: 1,
          ),
          color: isChecked ? CColors.yellow : Colors.transparent,
        ),
        child: isChecked
            ? CIcon(
                icon: 'check',
                width: 12,
                height: 9,
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
