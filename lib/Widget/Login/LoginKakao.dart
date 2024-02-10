import 'package:flutter/material.dart';
import 'package:poorlex/Widget/Login/Kakao.dart';

import 'KakaoViewModel.dart';

class LoginKakao extends StatefulWidget {
  const LoginKakao({super.key});

  @override
  State<LoginKakao> createState() => _LoginKakaoState();
}

class _LoginKakaoState extends State<LoginKakao> {
  @override
  Widget build(BuildContext context) {
    final KakaoView = KakaoViewModel(KakaoLogin());
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Center(
                child: Text('${KakaoViewModel.isLogined}'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await KakaoView.kakaoLogin();
                  setState(() {});
                },
                child: const Text('login'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await KakaoView.kakaoLogout();
                  setState(() {});
                },
                child: const Text('logut'),
              ),
              // GetX(
              //   init: UserController(),
              //   builder: (controller) =>
              //       Text(Get.find<UserController>().userInfo().userName),
              // )
            ],
          )
        ],
      ),
    );
  }
}
