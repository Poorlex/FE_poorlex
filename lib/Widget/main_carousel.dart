// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MainCarousel extends StatefulWidget {
  const MainCarousel({super.key});

  @override
  State<MainCarousel> createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  // 제목.length 최대 15개 까지
  final List<List<String>> samples = [
    ['7', '빚갚고 돈모으는 절약방', '21000', '13'],
    ['4', '월급때까지 돈 모으는 방', '35000', '7'],
    ['2', '절약하자 절약하자', '100000', '19'],
    // ['5', 'BTS 봉준호 손흥민 이종현', '20000', '10'],
    // ['10', '절약! 절약! 절약!', '51000', '12']
  ];

  String nowRoom = '1';

  void changeRoom(int idx) {
    setState(() {
      idx = idx + 1;
      nowRoom = '$idx';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            // '참여 중인 배틀 (${idx + 1} / ${samples.length})',
            '참여 중인 배틀',
            style: TextStyle(fontSize: 14),
          ),
          Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  // primary: false,
                  itemBuilder: (context, idx) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 350,
                                  height: 170,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors
                                                              .amber.shade800,
                                                          width: 2)),
                                                  width: 60,
                                                  height: 70,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        samples[idx][0],
                                                        style: const TextStyle(
                                                            fontSize: 35),
                                                      ),
                                                      const Text(
                                                        '만원',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      samples[idx][1],
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 13,
                                                    ),
                                                    Text(
                                                      '존버 금액 : ${samples[idx][2]} 원',
                                                      style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.7),
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${samples[idx][3]}위 / 20명',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    const Icon(
                                                        Icons.chat_outlined,
                                                        color: Colors.white,
                                                        size: 18),
                                                    Text(
                                                      samples[idx][3],
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: OutlinedButton(
                                                onPressed: () {},
                                                style: OutlinedButton.styleFrom(
                                                  side: const BorderSide(
                                                      width: 1.0,
                                                      color: Colors.amber),
                                                ),
                                                child: const Text(
                                                  '입장',
                                                  style: TextStyle(
                                                    color: Colors.amber,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 5,
                      ),
                  itemCount: samples.length)),
        ],
      ),
    );
  }
}
