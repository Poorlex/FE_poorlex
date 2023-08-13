import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Screen/main_page.dart';

import 'Controller/user_controller.dart';
import 'Widget/Login/kakao_login.dart';
import 'Widget/Login/kakao_view_model.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final KakaoView = KakaoViewModel(KakaoLogin());
  final UserController _user = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              width: 327,
              height: 312,
              image: AssetImage('assets/img_main_login.png'),
            ),
            const SizedBox(height: 70),
            const Text(
              '풀렉스에서 다른 거지 친구들과 함께',
              style: TextStyle(fontSize: 15),
            ),
            const Text(
              '재미있게 절약해요',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfffde500)),
              onPressed: () async {
                await KakaoView.kakaoLogin();
                setState(() {});
                Get.to(() => const MainPage());
              },
              child: const Text('카카오로 3초만에 로그인',
                  style: TextStyle(color: Colors.black)),
            ),
            // GetX(
            //   init: UserController(),
            //   builder: (controller) => Text(
            //       Get.find<UserController>().userInfo().userName,
            //       style: const TextStyle(color: Colors.white)),
            // ),
            // Text('${_user.userInfo().userId}')
          ],
        ),
      ),
    );
  }
}
