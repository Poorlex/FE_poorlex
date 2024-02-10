import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Main/BottomBar.dart';
import 'package:poorlex/Widget/My/Level.dart';
import 'package:poorlex/Widget/My/MyAuth.dart';
import 'package:poorlex/Widget/My/MyFriends.dart';
import 'package:poorlex/Widget/My/Profile.dart';
import 'package:poorlex/Widget/My/AnnouncementList.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/User.dart';

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
      backgroundColor: CustomColors.black,
      bottomNavigationBar: const BottomBar(
        nowPage: 4,
      ),
      appBar: AppBar(
        backgroundColor: CustomColors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 26,
              icon: CustomIcon(icon: 'setting', width: 26, height: 26, color: CustomColors.whiteStr),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 26,
              icon: CustomIcon(icon: 'ring', width: 26, height: 26, color: CustomColors.whiteStr),
              onPressed: () {},
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
