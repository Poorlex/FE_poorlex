import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/calendar/header.dart';
import 'package:poorlex/widget/calendar/list.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              CalenderHeader(current: _current, select: select),
              Flexible(
                flex: 1,
                child: List(
                  current: _current,
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
