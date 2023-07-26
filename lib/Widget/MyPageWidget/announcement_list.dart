import 'package:flutter/material.dart';

class AnnounceMent extends StatefulWidget {
  const AnnounceMent({
    super.key,
  });

  @override
  State<AnnounceMent> createState() => _AnnounceMentState();
}

class _AnnounceMentState extends State<AnnounceMent> {
  final List<List<String>> announcements = [
    ['공지사항'],
    ['고객센터'],
    ['이용약관'],
    ['개인정보 처리방침'],
  ];

  final List<String> appVersion = ['앱 버전', 'U.0.0.0'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var box in announcements)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      box[0],
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.white),
                iconSize: 20,
              ),
            ],
          ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appVersion[0],
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              appVersion[1],
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        )
      ],
    );
  }
}
