import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/user_controller.dart';

class ShowModal extends StatefulWidget {
  const ShowModal({
    super.key,
  });

  @override
  State<ShowModal> createState() => _ShowModalState();
}

class _ShowModalState extends State<ShowModal> {
  late int stageLevel = 0;

  @override
  Widget build(BuildContext context) {
    void addLevel() {
      setState(() {
        stageLevel = stageLevel + 1;
      });
    }

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  if (stageLevel == 0)
                    // if (Get.find<ModalController>().modalCount == 0)
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Text('고수거지:',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const Text('반갑네',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GetX<UserController>(
                                        init: UserController(),
                                        builder: (_) => Text(
                                          Get.find<UserController>()
                                              .userInfo()
                                              .userName,
                                          style: const TextStyle(
                                            color: Color(0xffffd600),
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      const Text('!',
                                          style: TextStyle(
                                            color: Color(0xffffd600),
                                            fontSize: 20,
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('신입 거지로 들어온 것을 환영하네.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 60),
                          child: ElevatedButton(
                            onPressed: () {
                              addLevel();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffffd600),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 120, vertical: 16)),
                            child: const Text('안녕하세요!',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  if (stageLevel == 1) ...[
                    Column(
                      children: [
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Text('고수거지:',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text('이 동네 거지들은 모두',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '각자 원하는 삶을 위해',
                                        style: TextStyle(
                                            color: Color(0xffffd600),
                                            fontSize: 18),
                                      ),
                                      Text(' 열심히 라네.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '힘들고 슬플 때도 있겠지만,',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '함께 웃고 웃으며 살아가고 있지',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 60),
                          child: ElevatedButton(
                            onPressed: () {
                              addLevel();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffffd600),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 125, vertical: 16)),
                            child: const Text('그렇군요',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (stageLevel >= 2)
                    Column(
                      children: [
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('고수거지:',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text('자! 그럼 자네도 우선',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('열심히 돈을 모을 수 있도록.',
                                      style: TextStyle(
                                          color: Color(0xffffd600),
                                          fontSize: 18)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text('진정 원하던 삶이 무엇인지',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('다시 돌이켜보는 시간을 가져보게나.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffffd600),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 16)),
                                child: const Text('알겠어요',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white24,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 16)),
                                child: const Text('다음에요',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
