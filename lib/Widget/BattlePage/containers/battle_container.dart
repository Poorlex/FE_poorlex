import 'package:flutter/material.dart';

import '../../../Screen/battle_page/detail/ranking/ranking.dart';

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
                      return GestureDetector(
                          onTap: () {
                            // todo-al: 여기서 랭킹 페이지로 넘어가는 페이지 링크해주기
                            print('index: ${idx} 의 상세페이지로 넘어갑니다.');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (c) => Ranking()));
                          },
                          child: Column(
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
                                                        color:
                                                            Color(0xffb265ff),
                                                        fontSize: 24),
                                                  ),
                                                  Text('/${data[idx][5]}명',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 24)),
                                                  SizedBox(width: 20),
                                                  Icon(
                                                      Icons.chat_bubble_outline,
                                                      size: 16,
                                                      color: Colors.white),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text('13',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16))
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
                          ));
                    },
                    separatorBuilder: (context, idx) =>
                        const SizedBox(width: 15),
                    itemCount: data.length),
              ),
            )),
      ],
    );
  }
}
