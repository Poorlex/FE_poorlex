import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Libs/Theme.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:poorlex/Screen/Main/Page.dart';
import 'package:poorlex/Widget/Login/Kakao.dart';
import 'package:poorlex/Widget/Login/KakaoViewModel.dart';

import 'package:poorlex/Controller/User.dart';

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
            Image(width: 327, height: 312, image: AssetImage('assets/img_main_login.png')),
            SizedBox(height: 70),
            Text('풀렉스에서 다른 거지 친구들과 함께', style: CustomTextStyles.Body3(color: CustomColors.black)),
            Text('재미있게 절약해요', style:  CustomTextStyles.Body3(color: CustomColors.black)),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: CustomColors.yellow),
              child: Text('카카오로 3초만에 로그인', style: CustomTextStyles.Body3(color: CustomColors.black)),
              onPressed: () async {
                await KakaoView.kakaoLogin();
                setState(() {});
                Get.to(() => MainPage());
              }
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 82, 10, 225)),
              child: Text('애플 아이디로 로그인', style: CustomTextStyles.Body3(color: CustomColors.black)),
              onPressed: () async {
                signInWithApple();
                setState(() {});
              },
            ),
            // GetX(
            //   init: UserController(),
            //   builder: (controller) => Text(
            //       Get.find<UserController>().userInfo().userName,
            //       style: TextStyle(color: Colors.white)),
            // ),
            // Text('${_user.userInfo().userId}')
          ],
        ),
      ),
    );
  }
}
