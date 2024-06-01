import 'package:flutter/material.dart';

import 'package:poorlex/libs/theme.dart';

import 'package:poorlex/screen/my/my_expense_input.dart';

class MainBottom extends StatelessWidget {
  const MainBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: CColors.yellow,
          border: Border(
            top: BorderSide(color: CColors.yellowLight, width: 4),
          ),
        ),
        child: TextButton(
          child: Text(
            '지출 추가하기',
            style: CTextStyles.Title3(color: CColors.black),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyExpenseInputPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
