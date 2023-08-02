import 'package:flutter/material.dart';

class EmptyBattle extends StatelessWidget {
  const EmptyBattle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                child: Container(
                    decoration: const BoxDecoration(color: Color(0xff000000)),
                    width: 335,
                    height: 150,
                    child: const Column(
                      children: [],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                child: Container(
                    width: 330,
                    height: 157,
                    decoration: const BoxDecoration(color: Color(0xff000000)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: SizedBox(
                            width: 34,
                            height: 34,
                            child: Image.asset(
                                'assets/main_page/empty_battle.png'),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('배틀 방 만들기',
                              style: TextStyle(
                                  color: Color.fromARGB(208, 246, 240, 240),
                                  fontSize: 18)),
                        )
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
