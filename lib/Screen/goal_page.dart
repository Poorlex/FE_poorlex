import 'package:flutter/material.dart';

import 'package:poorlex/Widget/GoalPage/list.dart';
import 'package:poorlex/Widget/MainPageWidget/bottom_bar.dart';
import 'package:poorlex/Widget/Common/tab.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({super.key});

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.black,
        bottomNavigationBar: const BottomBar(
          nowPage: 1,
        ),
        body: (
          Container(
            child: SafeArea(child: CustomScrollView(
              slivers: [
                SliverFixedExtentList(
                    itemExtent: 24.0,
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Text('요약', style: TextStyle(fontSize: 24, color: Colors.white)),
                      );
                    }, childCount: 1)
                ),
                SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.black,
                    title: Row(children: [
                      Expanded(child:
                        CustomTab(
                          selected: 1234,
                          list: [
                              CustomTabItem(label: '진행중', value: 1234, onClick: print),
                              CustomTabItem(label: '완료된', value: 5678, onClick: print),
                          ]
                        )
                      )
                    ])
                ),
                SliverFixedExtentList(
                    itemExtent: 12,
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Text("11111", style: TextStyle(color: Colors.white),),
                      );
                    }, childCount: 1)
                ),
              ],
            ))
          )
            /*Container(
                padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).viewPadding.top + 20, 0, MediaQuery.of(context).viewPadding.bottom),
                child:
                Column(
                  children: [
                    GoalHeader(),
                    Flexible(flex: 1, child: GoalList())
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                )
            )*/
        )
    );
  }
}

List<Widget> _sliverList(int size, int sliverChildCount) {
  var widgetList = <Widget>[];
  for (int index = 0; index < size; index++)
    widgetList
      ..add(SliverFixedExtentList(
        itemExtent: 50.0,
        delegate:
        SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text('list item $index'),
          );
        }, childCount: sliverChildCount),
      ));

  return widgetList;
}
