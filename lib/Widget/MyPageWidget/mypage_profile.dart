import 'package:flutter/material.dart';

class MyPageProfile extends StatelessWidget {
  const MyPageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(2, 2),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
                clipBehavior: Clip.hardEdge,
                // child: Image.network(webtoon.thumb),
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset('assets/my_page/icon_profile.png'),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const SizedBox(
                width: 300,
                height: 80,
                child: Column(
                  children: [
                    Text(
                      '최지출',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    SizedBox(
                      width: 250,
                      // 폰트 사이즈 15 일 때 , height 가 29면 픽셀안에 걸려서 39로 수정합니다.
                      height: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '돈을 많이 모아야 \n돈을 많이 쓸 수 있다.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1.0, color: Colors.amber),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 70,
                      vertical: 10,
                    ),
                    child: Text(
                      '프로필 편집',
                      style: TextStyle(color: Colors.amber, fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
