import 'package:flutter/material.dart';

import 'package:poorlex/libs/theme.dart';

import 'package:poorlex/widget/common/tab.dart';
import 'package:poorlex/screen/goal/create_goal.dart';
import 'package:poorlex/widget/goal/goal_list.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({super.key});

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CColors.black,
      body: Container(
          child: SafeArea(
              child: CustomScrollView(slivers: [
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.fromLTRB(16, 20, 0, 16),
            child: Text('목표', style: CTextStyles.Title1()),
          );
        }, childCount: 1)),
        SliverAppBar(
            pinned: true,
            backgroundColor: CColors.black,
            foregroundColor: CColors.black,
            elevation: 0,
            titleSpacing: 0,
            title: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: CColors.gray10, width: 1))),
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(children: [
                    Expanded(
                        child: CTab(selected: 1234, list: [
                      CTabItem(
                          label: '진행중', value: 1234, onClick: () => print(123)),
                      CTabItem(
                          label: '완료된', value: 5678, onClick: () => print(123)),
                    ]))
                  ]),
                ))),
        SliverList(
            // itemExtent: 1,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(child: GoalList());
        }, childCount: 1))
      ]))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateGoalPage()));
        },
        foregroundColor: CColors.white,
        backgroundColor: CColors.black,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: CColors.gray20),
            borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
