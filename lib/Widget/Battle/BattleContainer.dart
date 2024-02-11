import 'package:flutter/material.dart';

import 'package:poorlex/Screen/Battle/Ranking.dart';

import 'package:poorlex/Libs/Theme.dart';

class BattleContainer extends StatefulWidget {
  final List<List<String>> dummy;

  const BattleContainer({super.key, required this.dummy});

  @override
  State<BattleContainer> createState() => _BattleContainerState();
}

class _BattleContainerState extends State<BattleContainer> {
  late List<List<String>> data = widget.dummy;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              shrinkWrap: true, scrollDirection: Axis.vertical,
              itemBuilder: (context, idx) {
                return GestureDetector(
                    onTap: () {
                      print('index: ${idx} 의 상세페이지로 넘어갑니다.');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => Ranking())
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                            height: 150, clipBehavior: Clip.hardEdge, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(width: 26, height: 16, 'assets/my_page/${data[idx][0]}.png'),
                                    Text('${data[idx][1]}만원', style: CustomTextStyles.Body3(CustomColors.yellow)),
                                    SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: CustomColors.gray30), padding: EdgeInsets.symmetric(horizontal: 6),
                                      child: Text('D-7', style: CustomTextStyles.Body3(CustomColors.white)),
                                    )
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text('${data[idx][2]}', style: CustomTextStyles.Body2(CustomColors.white))
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 9),
                                          Text('존버 금액 : ${data[idx][3]}', style: CustomTextStyles.Body2(CustomColors.gray40)),
                                          SizedBox(height: 27),
                                          Row(
                                            children: [
                                              Text('${data[idx][4]}위', style: CustomTextStyles.Title1(CustomColors.purpleLight)),
                                              Text('/${data[idx][5]}명', style: CustomTextStyles.Title1(CustomColors.white)),
                                              SizedBox(width: 20),
                                              Icon(Icons.chat_bubble_outline, size: 16, color: CustomColors.white),
                                              SizedBox(width: 4),
                                              Text('13', style: CustomTextStyles.Body2(CustomColors.white))
                                            ],
                                          )
                                        ],
                                      )
                                    ),
                                    Image.network(width: 90, height: 90, '${data[idx][6]}'),
                                  ],
                                )
                              ],
                            )
                        ),
                        SizedBox(height: 10),
                      ],
                    )
                );
              },
              separatorBuilder: (context, idx) => SizedBox(width: 15),
              itemCount: data.length
          ),
        )
      ]
    );
  }
}
