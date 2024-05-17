import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/base.dart';

import 'package:poorlex/widget/common/bottom_bar.dart';
import 'package:poorlex/widget/calendar/header.dart';
import 'package:poorlex/widget/calendar/list.dart';

class CaledarPage extends StatefulWidget {
  const CaledarPage({super.key});

  @override
  State<CaledarPage> createState() => _CaledarPageState();
}

class _CaledarPageState extends State<CaledarPage> {
  int _current = DateTime.now().millisecondsSinceEpoch;

  void select(int n) {
    this.setState(() {
      _current = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CColors.black,
        bottomNavigationBar: BottomBar(nowPage: 3),
        body: (SafeArea(
            child: CCon(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: CCol(
                  children: [
                    CalenderHeader(current: _current, select: select),
                    Flexible(
                        flex: 1,
                        child: List(
                          current: _current,
                        ))
                  ],
                  cross: CrossAxisAlignment.start,
                )))));
  }
}
