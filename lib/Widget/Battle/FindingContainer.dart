import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Libs/Theme.dart';

class FindingContainer extends GetView {
  final List<List<String>> dummy;

  const FindingContainer({super.key, required this.dummy});

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
                                Icon(Icons.people, color: CustomColors.black),
                                SizedBox(width: 4),
                                Text('${data[idx][4]}/${data[idx][5]}', style: CustomTextStyles.Caption2(CustomColors.white)),
                                SizedBox(width: 4),
                                Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(1), color: CustomColors.gray20), padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                                  child: Text('모집완료', style: CustomTextStyles.Caption2(CustomColors.gray40))
                                ),
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
                                          Image.asset(width: 26, height: 16, 'assets/my_page/${data[idx][0]}.png'),
                                          Text('${data[idx][1]}만원', style: CustomTextStyles.Body3(CustomColors.yellow)),
                                          SizedBox(width: 10),
                                          Container(
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: CustomColors.gray30,), padding: EdgeInsets.symmetric(horizontal: 6),
                                            child: Text('D-7', style: CustomTextStyles.Body3(CustomColors.white)),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Expanded(child:
                                            Text('${data[idx][2]}', style: CustomTextStyles.Body2(CustomColors.white)),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 9),
                                      Row(
                                        children: [
                                          Expanded(child:
                                            Text('${data[idx][7]}', style: CustomTextStyles.Caption1(CustomColors.gray40))
                                          ),
                                          SizedBox(height: 27)
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
                );
              },
              separatorBuilder: (context, idx) => const SizedBox(width: 15),
              itemCount: data.length
          ),
        ),
      ],
    );
  }
}
