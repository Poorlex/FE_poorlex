import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BattleIndexThree extends GetView {
  const BattleIndexThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Container(
            width: 300,
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('친구를 초대하고',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    )),
                SizedBox(height: 10),
                Text('함께 배틀 해볼까요?',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Center(
            child: Column(children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xffffd600)),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 75),
                    child: Text('네 초대할래요!',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffffd600))),
                  )),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xff999999)),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 46),
                    child: Text('아니요 초대안할래요!',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff999999))),
                  ))
            ]),
          ),
        )
      ],
    );
  }
}
