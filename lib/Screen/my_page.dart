import 'package:flutter/material.dart';
import 'package:poorlex/Widget/MyPageWidget/mypage_level.dart';
import 'package:poorlex/Widget/MyPageWidget/mypage_myauth.dart';
import 'package:poorlex/Widget/MyPageWidget/mypage_myfriends.dart';
import 'package:poorlex/Widget/MyPageWidget/mypage_profile.dart';

import '../Widget/MyPageWidget/announcement_list.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded),
              iconSize: 35,
            )
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyPageProfile(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  children: [
                    MyPageLevel(),
                    MyFriends(),
                    MyPageMyAuth(),
                    AnnounceMent()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
