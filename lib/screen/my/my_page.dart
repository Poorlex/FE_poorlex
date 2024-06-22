import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/layout.dart';

import 'package:poorlex/widget/common/icon.dart';
import 'package:poorlex/widget/my/level.dart';
import 'package:poorlex/widget/my/my_auth.dart';
import 'package:poorlex/widget/my/profile.dart';
import 'package:poorlex/widget/my/announcement_list.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/controller/user.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final user = Get.find<UserController>();
  final layout = Get.find<LayoutController>();

  Future<void> getUserInfo() async {
    // await user.getUserInfo();
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 26,
              icon: CIcon(
                icon: 'setting',
                width: 26,
                height: 26,
                color: CColors.whiteStr,
              ),
              onPressed: () => Get.toNamed('/my/option'),
            ),
            IconButton(
              iconSize: 26,
              icon: CIcon(
                icon: 'ring',
                width: 26,
                height: 26,
                color: CColors.whiteStr,
              ),
              onPressed: () => Get.toNamed('/my/notification'),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyPageProfile(),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  MyPageLevel(),
                  // MyFriends(),
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
    );
  }
}
