import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';

import 'package:poorlex/Widget/Common/Tab.dart';
import 'package:poorlex/Screen/Goal/CreateGoal.dart';
import 'package:poorlex/Widget/Goal/List.dart';
import 'package:poorlex/Widget/Main/BottomBar.dart';

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
      backgroundColor: CustomColors.black,
      bottomNavigationBar: BottomBar(nowPage: 1),
      body: Container(
          child: SafeArea(
              child: CustomScrollView(slivers: [
                SliverList(
                    delegate:
                        SliverChildBuilderDelegate((BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(16, 20, 0, 16),
                    child:
                        Text('목표', style: TextStyle(fontSize: 24, color: CustomColors.white)),
                  );
                }, childCount: 1)),
                SliverAppBar(
                  pinned: true,
                  backgroundColor: CustomColors.black,
                  foregroundColor: CustomColors.black,
                  elevation: 0,
                  titleSpacing: 0,
                  title: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: CustomColors.gray10, width: 1))),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Row(children: [
                        Expanded(
                            child: CustomTab(selected: 1234, list: [
                          CustomTabItem(
                              label: '진행중', value: 1234, onClick: () => print(123)),
                          CustomTabItem(
                              label: '완료된', value: 5678, onClick: () => print(123)),
                        ]))
                      ]),
                    )
                  )
                ),
                SliverList(
                    // itemExtent: 1,
                    delegate:
                        SliverChildBuilderDelegate((BuildContext context, int index) {
                  return Container(child: GoalList());
                }, childCount: 1))
              ]
            )
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateGoalPage()));
        },
        foregroundColor: CustomColors.white,
        backgroundColor: CustomColors.black,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: CustomColors.gray20),
            borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
