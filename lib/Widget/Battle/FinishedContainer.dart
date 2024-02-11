import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Libs/Theme.dart';

class FinishedContainer extends GetView {
  final List<List<String>> dummy;
  const FinishedContainer({super.key, required this.dummy});

  @override
  Widget build(BuildContext context) {
    List<List<String>> data = this.dummy;
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, idx) {
                    return Column(
                      children: [
                        Container(
                            height: 150, clipBehavior: Clip.hardEdge, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(width: 26, height: 16, 'assets/my_page/${data[idx][0]}.png'),
                                    Text('${data[idx][1]}만원', style: TextStyle(color: CustomColors.yellow, fontSize: 14)),
                                    SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(1), color: CustomColors.gray20),
                                      padding: EdgeInsets.symmetric(horizontal: 6),
                                      child: Text('${data[idx][7]}', style: TextStyle(color: CustomColors.gray41, fontSize: 12)),
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
                                          Text('${data[idx][2]}', style: TextStyle(color: CustomColors.white, fontSize: 16)),
                                          SizedBox(height: 9),
                                          Text('존버 금액 : ${data[idx][3]}', style: TextStyle(color: CustomColors.gray40, fontSize: 15)),
                                          SizedBox(height: 27),
                                          Row(
                                            children: [
                                              Text('${data[idx][4]}위', style: TextStyle(color: CustomColors.white, fontSize: 24)),
                                              Text('/${data[idx][5]}명', style: TextStyle(color: CustomColors.white, fontSize: 24)),
                                              SizedBox(width: 20),

                                              if (data[idx][4] == '1') ...[
                                                Container(
                                                  decoration: BoxDecoration(color: CustomColors.yellow), padding: EdgeInsets.symmetric(horizontal: 6),
                                                  child: Text('+20', style: TextStyle(color: CustomColors.black, fontSize: 20)),
                                                )
                                              ]
                                            ],
                                          )
                                        ],
                                      )
                                    ),
                                    Image.network(width: 90, height: 90, '${data[idx][6]}'),
                                  ]
                                )
                              ],
                            )
                        ),
                        SizedBox(height: 10),
                      ],
                    );
              },
              separatorBuilder: (context, idx) => const SizedBox(width: 15),
              itemCount: data.length
          )
        )
      ]
    );
  }
}
