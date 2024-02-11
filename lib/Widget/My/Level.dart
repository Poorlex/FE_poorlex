import 'package:flutter/material.dart';
import 'package:poorlex/Libs/Theme.dart';

class MyPageLevel extends StatefulWidget {
  const MyPageLevel({super.key});

  @override
  State<MyPageLevel> createState() => _MyPageLevelState();
}

class _MyPageLevelState extends State<MyPageLevel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CustomColors.gray41.withOpacity(90), borderRadius: BorderRadius.circular(10)), child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              // padding: const EdgeInsets.all(25),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Text('거지 레벨', style: TextStyle(color: CustomColors.gray50, fontSize: 14)),
                            SizedBox(height: 6),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                SizedBox(width: 25, height: 25, child: Image.asset('assets/my_page/icon_level.png')),
                                SizedBox(width: 12),
                                Text('LV.4', style: TextStyle(color: CustomColors.white, fontSize: 20)),
                            ])
                          ]
                        )
                      ),
                      Container(height: 68, width: 1, decoration: BoxDecoration(color: CustomColors.gray20)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Text('보유 포인트', style: TextStyle(color: CustomColors.gray50, fontSize: 14)),
                            SizedBox(height: 6),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(child:
                                  Text('180 P', style: TextStyle(color: CustomColors.white, fontSize: 20)),
                                )
                            ])
                          ]
                        )
                      )
                    ]
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: CustomColors.gray41.withOpacity(166),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('+62 P', style: TextStyle(color: CustomColors.yellow, fontSize: 15)),
                          SizedBox(width: 10),
                          Text('더 모으면 레벨 업 !', style: TextStyle(color: CustomColors.white, fontSize: 15)),
                        ]
                      )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                    child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                              Padding(padding: EdgeInsets.all(10), child:
                              Text('성공', style: TextStyle(color: CustomColors.gray50, fontSize: 14))),
                              Text('17', style: TextStyle(color: CustomColors.white, fontSize: 20)),
                          ]),
                          Column(children: [
                            Padding(padding: EdgeInsets.symmetric(), child:
                              Image.asset(width: 60, height: 42, 'assets/my_page/icon_gold.png'),
                            ),
                            Text('4', style: TextStyle(color: CustomColors.white, fontSize: 20)),
                          ],
                        ),
                        Column(children: [
                            Padding(padding: EdgeInsets.all(0), child:
                              Image.asset(width: 60, height: 42, 'assets/my_page/icon_silver.png'),
                            ),
                            Text('3', style: TextStyle(color: CustomColors.white, fontSize: 20)),
                        ]),
                        Column(children: [
                            Padding(padding: EdgeInsets.all(0), child:
                              Image.asset(width: 60, height: 42, 'assets/my_page/icon_cooper.png')
                            ),
                            Text('10', style: TextStyle(color: CustomColors.white, fontSize: 20)),
                        ]),
                      ]
                    )
                  )
                ]
              )
            )
          ]
        )
    );
  }
}
