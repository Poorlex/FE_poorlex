import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/widget/common/icon.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/controller/user.dart';

class MyFriends extends StatefulWidget {
  MyFriends({super.key});

  @override
  State<MyFriends> createState() => _MyFriendsState();
}

class _MyFriendsState extends State<MyFriends> {
  UserController user = Get.find<UserController>();
  final int number = 5;

  final List<List<String>> friendsImages = [
    [
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fbd7fff23-8e54-4f0a-86e5-a1140dd8a98a.jpg',
      '하니',
      'friends',
      '-7,000'
    ],
    [
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fcdd163b6-fabd-4f95-9775-cc2f80d362ac.jpg',
      '민지',
      'friends',
      '-5,500'
    ],
    [
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fa0f317ad-e2e4-43dd-a7e2-a9d93a5c2099.jpg',
      '다니엘',
      'friends',
      '-5,500'
    ],
    [
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2F74fe64c2-999f-42f4-be5d-2f938330e661.jpg',
      '혜인',
      'friends',
      '-5,500'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(children: [
          Row(children: [
            Text('내 거지 친구', style: CTextStyles.Headline()),
            SizedBox(width: 10),
            // Obx(() => Text(user.userInfo.value.friends?.length.toString() ?? '-', style: CTextStyles.Headline(color: CColors.purpleLight)))
          ]),
          SizedBox(height: 20),
          SizedBox(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idx) {
                  return Column(children: [
                    Image.asset(
                        width: 84,
                        height: 74,
                        'assets/my_page/icon_friends.png'),
                    SizedBox(height: 10),
                    Text(friendsImages[idx][1], style: CTextStyles.Body3()),
                    SizedBox(height: 5),
                    Text(friendsImages[idx][3],
                        style: CTextStyles.Body3(color: CColors.gray40))
                  ]);
                },
                separatorBuilder: (context, idx) => SizedBox(width: 15),
                itemCount: friendsImages.length),
          ),
          Text(
            "11111",
            style: TextStyle(color: Colors.white),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1.0, color: CColors.yellow),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('친구 전체 보기',
                    style: CTextStyles.Body3(color: CColors.yellow)),
                SizedBox(width: 5),
                CIcon(
                    icon: 'arrow-game-right',
                    width: 15,
                    height: 15,
                    color: CColors.yellowStr)
              ]),
            ),
            onPressed: () {},
          )
        ]));
  }
}