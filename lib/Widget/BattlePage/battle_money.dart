import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Widget/BattlePage/battle_finding.dart';
import 'package:poorlex/Widget/BattlePage/battle_finished.dart';

import '../../Controller/battle_controller.dart';
import 'battle_participant.dart';

class BattleMoney extends GetView {
  final int moneyIndex;
  const BattleMoney({super.key, required this.moneyIndex});

  @override
  Widget build(BuildContext context) {
    BattleController _battle = BattleController();
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (_battle.battleIndex().MoneyIndex == 0) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffffd600),
                        fixedSize: Size(48, 32)),
                    onPressed: () {
                      _battle.changeBattleMoneyIndex(0);
                    },
                    child: Row(
                      children: [
                        Text('전체',
                            style:
                                TextStyle(color: Colors.black, fontSize: 14)),
                      ],
                    ),
                  ),
                ] else ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(48, 32),
                        side: const BorderSide(
                            width: 1.0, color: Color(0xff666666))),
                    onPressed: () {
                      _battle.changeBattleMoneyIndex(0);
                    },
                    child: Row(
                      children: [
                        Text('전체',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    ),
                  ),
                ],
                SizedBox(width: 8),
                if (_battle.battleIndex().MoneyIndex == 1) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffffd600),
                        fixedSize: Size(81, 32)),
                    onPressed: () {
                      _battle.changeBattleMoneyIndex(1);
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text('~8만원',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                          Image.asset(
                              width: 18,
                              height: 14,
                              'assets/my_page/icon_gold.png'),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(81, 32),
                        side: const BorderSide(
                            width: 1.0, color: Color(0xff666666))),
                    onPressed: () {
                      _battle.changeBattleMoneyIndex(1);
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text('~8만원',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          Image.asset(
                              width: 18,
                              height: 14,
                              'assets/my_page/icon_gold.png'),
                        ],
                      ),
                    ),
                  ),
                ],
                SizedBox(width: 8),
                if (_battle.battleIndex().MoneyIndex == 2) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffffd600),
                        fixedSize: Size(88, 32)),
                    onPressed: () {
                      _battle.changeBattleMoneyIndex(2);
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text('~14만원',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                          Image.asset(
                              width: 18,
                              height: 14,
                              'assets/my_page/icon_silver.png'),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(88, 32),
                        side: const BorderSide(
                            width: 1.0, color: Color(0xff666666))),
                    onPressed: () {
                      _battle.changeBattleMoneyIndex(2);
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text('~14만원',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          Image.asset(
                              width: 18,
                              height: 14,
                              'assets/my_page/icon_silver.png'),
                        ],
                      ),
                    ),
                  ),
                ],
                SizedBox(width: 8),
                if (_battle.battleIndex().MoneyIndex == 3) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffffd600),
                        fixedSize: Size(88, 32)),
                    onPressed: () {
                      _battle.changeBattleMoneyIndex(3);
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text('~20만원',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                          Image.asset(
                              width: 18,
                              height: 14,
                              'assets/my_page/icon_cooper.png'),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(88, 32),
                        side: const BorderSide(
                            width: 1.0, color: Color(0xff666666))),
                    onPressed: () {
                      _battle.changeBattleMoneyIndex(3);
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text('~20만원',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          Image.asset(
                              width: 18,
                              height: 14,
                              'assets/my_page/icon_cooper.png'),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
