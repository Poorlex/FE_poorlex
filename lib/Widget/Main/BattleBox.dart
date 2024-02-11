import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';

class BattleBox extends StatelessWidget {
  final List<String> sample;
  const BattleBox({super.key, required this.sample});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 12), child:
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Stack(children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5), child:
            Container(decoration: BoxDecoration(color: CustomColors.black), width: 360, height: 150, child:
              Column(children: [
              ])
            )
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8), child:
            Container(width: 350, height: 157, decoration: BoxDecoration(color: CustomColors.black), child:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Column(children: [
                      Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14), child:
                        Container(
                          decoration: BoxDecoration(color: CustomColors.yellow, borderRadius: BorderRadius.circular(10), border: Border.all(color: CustomColors.yellow, width: 2)),
                          width: 48, child:
                          Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(sample[0], style: CustomTextStyles.LargeTitle(color: CustomColors.black)),
                              Text('만원', style: CustomTextStyles.Body3(color: CustomColors.black))
                            ]
                          )
                        ),
                      ),
                    ]),
                    Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(sample[1], style: CustomTextStyles.Headline()),
                        SizedBox(height: 13),
                        Text('존버 금액 : ${sample[2]} 원', style: CustomTextStyles.Body3(color: CustomColors.white.withOpacity(0.7))),
                      ]),
                    ]),
                  ]),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20), child:
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Row(children: [
                        Row(children: [
                          Text('${sample[3]}위 / 20명', style: CustomTextStyles.Title1()),
                          SizedBox(width: 28),
                          Icon(Icons.chat_outlined, color: CustomColors.white, size: 16),
                          SizedBox(width: 4),
                          Text(sample[3], style: CustomTextStyles.Body3()),
                        ]),
                      ]),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 1), child:
                        OutlinedButton(style: OutlinedButton.styleFrom(side: BorderSide(width: 1.0, color: CustomColors.yellow)), child:
                          Text('입장', style: CustomTextStyles.Body2(color: CustomColors.yellow)),
                          onPressed: () {},
                        )
                      )
                    ])
                  )
                ])
              ])
            )
          )
        ])
      ])
    );
  }
}
