import 'package:flutter/material.dart';

import 'package:poorlex/Widget/MainPageWidget/bottom_bar.dart';
import 'package:poorlex/Widget/CalendarPage/header.dart';

class CaledarPage extends StatefulWidget {
  const CaledarPage({super.key});

  @override
  State<CaledarPage> createState() => _CaledarPageState();
}

class _CaledarPageState extends State<CaledarPage> {
  int _current = DateTime.now().millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: const BottomBar(
          nowPage: 3,
        ),
        body: (
          Container(
              padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).viewPadding.top + 20, 0, MediaQuery.of(context).viewPadding.bottom),
              child: (
                Expanded(
                  child: Column(
                    children: [
                      CalenderHeader(this._current),
                      SingleChildScrollView(
                        child: (
                            Expanded(
                              child: (
                                  Column(
                                    children: [
                                      Text(
                                          '요약',
                                          style: TextStyle(
                                              color: Colors.white
                                          )
                                      )
                                    ],
                                  )
                              )
                            )
                        )
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                )
              )
          )
        )
    );
  }
}
