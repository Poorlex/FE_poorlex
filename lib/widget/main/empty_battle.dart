import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';

class EmptyBattle extends StatelessWidget {
  const EmptyBattle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
                decoration: BoxDecoration(color: CColors.black),
                width: 347,
                height: 144,
                child: Column(children: [])),
            Container(
              width: 341,
              height: 150,
              decoration: BoxDecoration(color: CColors.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    child: SizedBox(
                      width: 34,
                      height: 34,
                      child: Image.asset('assets/main_page/empty_battle.png'),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 0),
                    ),
                    onPressed: () {},
                  ),
                  OutlinedButton(
                    child: Text(
                      '배틀 방 만들기',
                      style: CTextStyles.Headline(color: CColors.gray70),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 0),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
