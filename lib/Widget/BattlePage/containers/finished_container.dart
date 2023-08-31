import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishedContainer extends GetView {
  final List<List<String>> dummy;
  const FinishedContainer({super.key, required this.dummy});

  @override
  Widget build(BuildContext context) {
    List<List<String>> data = this.dummy;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: SizedBox(
            height: 450,
            width: 350,
            child: SizedBox(
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, idx) {
                    return Column(
                      children: [
                        Container(
                            width: 375,
                            height: 150,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                            width: 26,
                                            height: 16,
                                            'assets/my_page/${data[idx][0]}.png'),
                                        Text('${data[idx][1]}만원',
                                            style: TextStyle(
                                                color: Color(0xffffd80c),
                                                fontSize: 14)),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1),
                                          color: Color(0xff333333)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Text(
                                          '${data[idx][7]}',
                                          style: TextStyle(
                                              color: Color(0xff7e7e7e),
                                              fontSize: 12),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('${data[idx][2]}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16)),
                                        SizedBox(height: 9),
                                        Text('존버 금액 : ${data[idx][3]}',
                                            style: TextStyle(
                                                color: Color(0xff808080),
                                                fontSize: 15)),
                                        SizedBox(height: 27),
                                        Row(
                                          children: [
                                            Text(
                                              '${data[idx][4]}위',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24),
                                            ),
                                            Text('/${data[idx][5]}명',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24)),
                                            SizedBox(width: 20),
                                            if (data[idx][4] == '1') ...[
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xffffd600)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 6),
                                                  child: Text('+20',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20)),
                                                ),
                                              )
                                            ]
                                          ],
                                        )
                                      ],
                                    ),
                                    Image.network(
                                      width: 90,
                                      height: 90,
                                      '${data[idx][6]}',
                                    ),
                                  ],
                                )
                              ],
                            )),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                  separatorBuilder: (context, idx) => const SizedBox(width: 15),
                  itemCount: data.length),
            ),
          ),
        ),
      ],
    );
  }
}
