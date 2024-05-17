import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/libs/theme.dart';

class FinishedContainer extends GetView {
  final List<List<String>> dummy;

  const FinishedContainer({super.key, required this.dummy});

  @override
  Widget build(BuildContext context) {
    List<List<String>> data = this.dummy;
    return Column(children: [
      Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, idx) {
                return Column(
                  children: [
                    Container(
                        height: 150,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                    width: 22,
                                    height: 14,
                                    'assets/my_page/${data[idx][0]}.png'),
                                SizedBox(width: 10),
                                Text('${data[idx][1]}만원',
                                    style: CTextStyles.Body3(
                                        color: CColors.yellow)),
                                SizedBox(width: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1),
                                      color: CColors.gray20),
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Text('${data[idx][7]}',
                                      style: CTextStyles.Caption2(
                                          color: CColors.gray41)),
                                )
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${data[idx][2]}',
                                          style: CTextStyles.Body2()),
                                      SizedBox(height: 9),
                                      Text('존버 금액 : ${data[idx][3]}',
                                          style: CTextStyles.Body2(
                                              color: CColors.gray40)),
                                      SizedBox(height: 27),
                                      Row(
                                        children: [
                                          Text('${data[idx][4]}위',
                                              style: CTextStyles.Title1()),
                                          Text('/${data[idx][5]}명',
                                              style: CTextStyles.Title1()),
                                          SizedBox(width: 20),
                                          if (data[idx][4] == '1') ...[
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: CColors.yellow),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6),
                                              child: Text('+20',
                                                  style: CTextStyles.Title3(
                                                      color: CColors.black)),
                                            )
                                          ]
                                        ],
                                      )
                                    ],
                                  )),
                                  Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              NetworkImage('${data[idx][6]}'),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ])
                          ],
                        )),
                    SizedBox(height: 10),
                  ],
                );
              },
              separatorBuilder: (context, idx) => const SizedBox(width: 15),
              itemCount: data.length))
    ]);
  }
}
