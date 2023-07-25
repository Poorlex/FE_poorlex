import 'package:flutter/material.dart';

class MyPageProfile extends StatelessWidget {
  const MyPageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                width: 200,
                clipBehavior: Clip.hardEdge,
                // child: Image.network(webtoon.thumb),
                child: Image.network(
                    'https://a-static.besthdwallpaper.com/newjeans-haerin-omg-mv-shoot-wallpaper-2560x1600-108329_7.jpg'),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                '해린',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                width: 100,
                height: 40,
                child: Text(
                  'Hype Boy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              OutlinedButton(
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
