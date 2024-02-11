import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';

import 'package:poorlex/Screen/My/MyExpenseInput.dart';

class MainBottom extends StatelessWidget {
  const MainBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(side: BorderSide(width: 2, color: Color(0xffFFD600)), backgroundColor: CustomColors.yellow, padding: EdgeInsets.symmetric(horizontal: 124, vertical: 15)), child:
          Text('지출 추가하기', style: TextStyle(color: CustomColors.black, fontSize: 20)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyExpenseInputPage()));
          },
        ),
      ],
    );
  }
}

