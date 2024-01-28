import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Widget/Common/icon.dart';
import 'package:poorlex/Widget/MainPageWidget/bottom_bar.dart';
import 'package:poorlex/Widget/MyPageWidget/mypage_level.dart';
import 'package:poorlex/Widget/MyPageWidget/mypage_myauth.dart';
import 'package:poorlex/Widget/MyPageWidget/mypage_myfriends.dart';
import 'package:poorlex/Widget/MyPageWidget/mypage_profile.dart';

import 'package:poorlex/Controller/user_controller.dart';
import 'package:poorlex/Widget/MyPageWidget/announcement_list.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final UserController _user = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const BottomBar(
        nowPage: 4,
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 26,
              icon: CustomIcon(icon: 'setting', width: 26, height: 26, color: '#ffffff'),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 26,
              icon: CustomIcon(icon: 'ring', width: 26, height: 26, color: '#ffffff'),
              onPressed: () {},
              // icon: CustomIcon(icon: 'ring-point', width: 26, height: 26, color: '#ffffff'),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyPageProfile(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  children: [
                    MyPageLevel(),
                    MyFriends(),
                    SizedBox(height: 70),
                    MyPageMyAuth(),
                    SizedBox(height: 80),
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
