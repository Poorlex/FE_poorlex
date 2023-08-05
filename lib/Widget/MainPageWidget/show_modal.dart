import 'package:flutter/material.dart';

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
                                      Text('안녕하세요',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('USER 님!',
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontSize: 18)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('반가워요, 저는 거린이라고 합니다.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('요즘 저에겐 고민이 하나 있는데요.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
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
                                backgroundColor: Colors.amber,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 102, vertical: 10)),
                            child: const Text('무슨 고민인데?',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  if (stageLevel >= 1)
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
                                      Text('저는 거지지만 제가 왜 동냥을',
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
                                  Text('해야 하는지 모르겠어요.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text('제가',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('열심히 돈을 모을 수 있도록',
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontSize: 18)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('저에게 도움을 주시면 안될까요?',
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
                                    backgroundColor: Colors.amber,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 16)),
                                child: const Text('도와주기',
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
                                child: const Text('무시하기',
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
