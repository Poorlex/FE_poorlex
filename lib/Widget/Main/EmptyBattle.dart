import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';

class EmptyBattle extends StatelessWidget {
  const EmptyBattle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Stack(children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5), child:
            Container(decoration: BoxDecoration(color: CustomColors.black), width: 335, height: 150, child:
              Column(children: [])
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8), child:
            Container(width: 330, height: 157, decoration: BoxDecoration(color: Color(0xff000000)), child:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                OutlinedButton(child:
                  SizedBox(width: 34, height: 34, child:
                    Image.asset('assets/main_page/empty_battle.png')
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: Text('배틀 방 만들기', style: TextStyle(color: Color.fromARGB(208, 246, 240, 240), fontSize: 18)),
                  onPressed: () {},
                )
              ])
            ),
          ),
        ])
      ]),
    );
  }
}
