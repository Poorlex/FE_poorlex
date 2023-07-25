import 'package:flutter/material.dart';

class MyPageLevel extends StatefulWidget {
  const MyPageLevel({super.key});

  @override
  State<MyPageLevel> createState() => _MyPageLevelState();
}

class _MyPageLevelState extends State<MyPageLevel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(30, 30, 30, 90),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Column(
                        children: [
                          Text(
                            '거지 레벨',
                            style:
                                TextStyle(color: Colors.white38, fontSize: 15),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.emoji_emotions_rounded,
                                  size: 30, color: Colors.amber),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'LV.4',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 2,
                      decoration: const BoxDecoration(color: Colors.white12),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Column(
                        children: [
                          Text(
                            '보유 포인트',
                            style:
                                TextStyle(color: Colors.white38, fontSize: 15),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '180P',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(166, 84, 83, 83),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '+62 P',
                          style: TextStyle(color: Colors.amber, fontSize: 15),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '더 모으면 레벨 업 !',
                          style: TextStyle(color: Colors.amber, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '성공',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          '17',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.network(
                              width: 30,
                              height: 30,
                              'https://cdn-icons-png.flaticon.com/512/179/179249.png'),
                        ),
                        const Text(
                          '4',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.network(
                              width: 30,
                              height: 30,
                              'https://cdn-icons-png.flaticon.com/512/179/179251.png'),
                        ),
                        const Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.network(
                              width: 30,
                              height: 30,
                              'https://cdn-icons-png.flaticon.com/512/625/625396.png'),
                        ),
                        const Text(
                          '10',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
