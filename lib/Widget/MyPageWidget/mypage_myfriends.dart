import 'package:flutter/material.dart';

class MyFriends extends StatefulWidget {
  const MyFriends({super.key});

  @override
  State<MyFriends> createState() => _MyFriendsState();
}

class _MyFriendsState extends State<MyFriends> {
  final int number = 5;

  final List<List<String>> friendsImages = [
    [
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fbd7fff23-8e54-4f0a-86e5-a1140dd8a98a.jpg',
      '하니',
      'friends'
    ],
    [
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fcdd163b6-fabd-4f95-9775-cc2f80d362ac.jpg',
      '민지',
      'friends'
    ],
    [
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fa0f317ad-e2e4-43dd-a7e2-a9d93a5c2099.jpg',
      '다니엘',
      'friends'
    ],
    [
      'https://search.pstatic.net/common?type=b&size=144&expire=1&refresh=true&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2F74fe64c2-999f-42f4-be5d-2f938330e661.jpg',
      '혜인',
      'friends'
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                '내 거지 친구',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${friendsImages.length}',
                style: TextStyle(color: Colors.purple.shade600, fontSize: 18),
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idx) {
                  return Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          width: 84,
                          height: 74,
                          'assets/my_page/icon_friends.png',
                          // 'assets/my_page/icon_${friendsImages[idx][2]}'
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        friendsImages[idx][1],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, idx) => const SizedBox(width: 15),
                itemCount: friendsImages.length),
          )
        ],
      ),
    );
  }
}
