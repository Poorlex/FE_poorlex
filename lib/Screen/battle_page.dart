import 'package:flutter/material.dart';

import '../Widget/BattlePage/battle_option.dart';
import '../Widget/MainPageWidget/bottom_bar.dart';

class BattlePage extends StatelessWidget {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(nowPage: 2),
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '배틀',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.question_mark,
                      ),
                      iconSize: 26,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      iconSize: 26,
                    ),
                  ],
                ),
              ),
            ],
          )),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [BattleOption()],
          )
        ],
      ),
    );
  }
}
