import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Screen/main_page.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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

  void signInWithApple() async {
    final bool isAvailable = await SignInWithApple.isAvailable();
    if (isAvailable) {
      try {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );
        if (credential.familyName == null) {
          _user.userUpdateApple('애플', '로그인', credential.identityToken);
        } else {
          // 로그인 성공 처리
          _user.userUpdateApple(credential.familyName, credential.givenName,
              credential.identityToken);
        }
      } catch (error) {
        // 에러 처리
        print(error);
      }
    } else {
      print('isAvailale false');
    }
  }

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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 82, 10, 225)),
              onPressed: () async {
                signInWithApple();
                setState(() {});
              },
              child: const Text('애플 아이디로 로그인',
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
