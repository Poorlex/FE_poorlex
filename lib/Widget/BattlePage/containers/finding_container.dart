import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                                    Icon(Icons.people,
                                        color: Color.fromARGB(
                                            255, 66, 65, 65)),
                                    SizedBox(width: 4),
                                    Text('${data[idx][4]}/${data[idx][5]}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12))
                                  ],
                                ),
                                SizedBox(width: 4),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1),
                                    color: Colors.grey.shade800,
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      child: Container(
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 2,
                                              vertical: 1),
                                          child: Text('모집완료',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: Color(0xff7e7e7e),
                                              )),
                                        ),
                                      )),
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
                                                    color:
                                                    Color(0xffffd80c),
                                                    fontSize: 14))
                                          ],
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: Color(0xff666666),
                                          ),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 6),
                                            child: Text('D-7',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14)),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Text('${data[idx][2]}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16)),
                                    SizedBox(height: 9),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 225,
                                          height: 38,
                                          child: Text('${data[idx][7]}',
                                              style: TextStyle(
                                                  color: Color(0xff808080),
                                                  fontSize: 13)),
                                        ),
                                        SizedBox(height: 27),
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
              itemCount: data.length
          ),
        ),
      ],
    );
  }
}
