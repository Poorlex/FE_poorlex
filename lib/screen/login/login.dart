import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/controller/apple_auth.dart';
import 'package:poorlex/controller/hive_box.dart';
import 'package:poorlex/controller/kakao_auth.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/schema/social_login/social_login.dart';
import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/libs/theme.dart';

class Login extends StatefulWidget {
  Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _kakaoAuthController = KaKaoAuthController();
  final _appleAuthController = AppleAuthController();
  final _userController = Get.find<UserController>();

  Future<void> _tryKaKaoLogin() async {
    final SocialLoginModel? socialLoginModel =
        await _kakaoAuthController.kakaoLogin();
    await _userController.getAuthentication(socialLoginModel);
    Get.offAllNamed('/');
  }

  /// [ERROR]
  /// {tag: null, message: 400 Bad Request: "{"error":"invalid_grant","error_description":"client_id mismatch. The code was not issued to Poorlex.app."}"}
  Future<void> _tryAppleLogin() async {
    final SocialLoginModel? socialLoginModel =
        await _appleAuthController.appleLogin();
    await _userController.getAuthentication(socialLoginModel);
    print(">>>>>>>> $socialLoginModel");
    Get.offAllNamed('/');
  }

  @override
  void initState() {
    _autoLogin();
    super.initState();
  }

  /// [MEMO] local에 token이 있을 경우 메인으로 이동
  Future<void> _autoLogin() async {
    try {
      final token = await HiveBox().getToken();
      if (token == null) {
        return;
      }
      await _userController.updateToken(token);
      Get.offAllNamed('/');
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: CColors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/login/login.png',
                width: 300,
              ),
              SizedBox(height: 41),
              Text(
                '풀렉스에서 다른 거지 친구들과 함께\n재미있게 절약해봐요!',
                style: CTextStyles.Body2(
                  color: CColors.black,
                  height: 1.4,
                  fontFamily: 'appleSDGothicNeo',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 41),
              CButton(
                padding: EdgeInsets.symmetric(horizontal: 20),
                type: ButtonTypes.elevated,
                color: CColors.kakaoYellow,
                child: Container(
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/login/kakao.png',
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        '카카오로 3초만에 로그인',
                        style: CTextStyles.Body2(
                          fontWeight: FontWeight.w600,
                          color: CColors.black,
                          fontFamily: 'appleSDGothicNeo',
                        ),
                      ),
                      SizedBox(width: 24)
                    ],
                  ),
                ),
                onPressed: _tryKaKaoLogin,
              ),
              if (Platform.isIOS) ...[
                SizedBox(height: 20),
                CButton(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  type: ButtonTypes.elevated,
                  color: CColors.black,
                  child: Container(
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/login/apple.png',
                          width: 24,
                          height: 24,
                        ),
                        Text(
                          'Apple ID로 로그인',
                          style: CTextStyles.Body2(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'appleSDGothicNeo',
                          ),
                        ),
                        SizedBox(width: 24)
                      ],
                    ),
                  ),
                  onPressed: _tryAppleLogin,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
