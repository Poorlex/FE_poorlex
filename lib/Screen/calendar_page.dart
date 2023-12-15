import 'package:flutter/material.dart';

import 'package:poorlex/Widget/MainPageWidget/bottom_bar.dart';
import 'package:poorlex/Widget/CalendarPage/header.dart';
import 'package:poorlex/Widget/CalendarPage/list.dart';

class CaledarPage extends StatefulWidget {
  const CaledarPage({super.key});

  @override
  State<CaledarPage> createState() => _CaledarPageState();
}

class _CaledarPageState extends State<CaledarPage> {
  int _current = DateTime.now().millisecondsSinceEpoch;

  void select (int n) {
    this.setState(() {
      _current = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.black,
        bottomNavigationBar: const BottomBar(
          nowPage: 3,
        ),
        body: (
          Container(
              padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).viewPadding.top + 20, 0, MediaQuery.of(context).viewPadding.bottom),
              child:
                Column(
                  children: [
                    CalenderHeader(current: _current, select: select),
                    Flexible(flex: 1, child: List(current: _current,))
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                )
          )
        )
    );
  }
}
