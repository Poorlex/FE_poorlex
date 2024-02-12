import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:poorlex/Libs/Theme.dart';

class BattleMakingFinished extends GetView {
  const BattleMakingFinished({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 146),
          child: SizedBox(width: 160, height: 160, child:
            Image.asset('assets/battle_page/BattleFinishedImg.png'),
          ),
        ),
        SizedBox(height: 30),
        Text('배틀방 완성!', style: CTextStyles.Title2())
      ]),
    );
  }
}
