import 'package:flutter/material.dart';
import 'package:poorlex/Screen/my_page/my_expense_input_page.dart';

class MainBottom extends StatelessWidget {
  const MainBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyExpenseInputPage()));
          },
          style: ElevatedButton.styleFrom(
              side: const BorderSide(width: 2, color: Color(0xffFFD600)),
              backgroundColor: Colors.amber,
              padding:
                  const EdgeInsets.symmetric(horizontal: 124, vertical: 15)),
          child: const Text(
            '지출 추가하기',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ],
    );
  }
}

