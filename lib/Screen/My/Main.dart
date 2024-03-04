import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Controller/Layout.dart';

import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Common/BottomBar.dart';
import 'package:poorlex/Widget/Layout.dart';
import 'package:poorlex/Widget/My/Level.dart';
import 'package:poorlex/Widget/My/MyAuth.dart';

// import 'package:poorlex/Widget/My/MyFriends.dart';
import 'package:poorlex/Widget/My/Profile.dart';
import 'package:poorlex/Widget/My/AnnouncementList.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/Api.dart';
import 'package:poorlex/Controller/User.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final user = Get.find<UserController>();
  final api = Get.find<ApiController>();
  final layout = Get.find<LayoutController>();

  getUserInfo () async {
    await user.getUserInfo();
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CColors.black,
        bottomNavigationBar: BottomBar(nowPage: 4),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CColors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                iconSize: 26,
                icon: CIcon(
                    icon: 'setting',
                    width: 26,
                    height: 26,
                    color: CColors.whiteStr),
                onPressed: () => Get.toNamed('/my/option'),
              ),
              IconButton(
                iconSize: 26,
                icon: CIcon(
                    icon: 'ring',
                    width: 26,
                    height: 26,
                    color: CColors.whiteStr),
                onPressed: () {},
              )
            ],
          ),
        ),
        body: Layout(
          child: SingleChildScrollView(
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
          ),
        )
    );
  }
}
