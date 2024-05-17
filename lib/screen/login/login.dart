import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Widget/Common/Base.dart';
import 'package:poorlex/Widget/Common/Buttons.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/Controller/User.dart';

class Login extends StatefulWidget {
  Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CColors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: CCon(
                color: CColors.white,
                padding: EdgeInsets.all(20),
                child: CCol(
                    main: MainAxisAlignment.center,
                    cross: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 300,
                          child: Image.asset('assets/login/login.png')),
                      SizedBox(height: 41),
                      Text('풀렉스에서 다른 거지 친구들과 함께\n재미있게 절약해봐요!',
                          style: CTextStyles.Body2(
                              color: CColors.black,
                              height: 1.4,
                              fontFamily: 'appleSDGothicNeo'),
                          textAlign: TextAlign.center),
                      SizedBox(height: 41),
                      CButton(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          type: ButtonTypes.elevated,
                          color: CColors.kakaoYellow,
                          child: Container(
                            height: 56,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/login/kakao.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  Text('카카오로 3초만에 로그인',
                                      style: CTextStyles.Body2(
                                          fontWeight: FontWeight.w600,
                                          color: CColors.black,
                                          fontFamily: 'appleSDGothicNeo')),
                                  SizedBox(width: 24)
                                ]),
                          ),
                          onPressed: () => Get.toNamed('/login/kakao')),
                      SizedBox(height: 20),
                      CButton(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          type: ButtonTypes.elevated,
                          color: CColors.black,
                          child: Container(
                            height: 56,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/login/apple.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  Text('Apple ID로 로그인',
                                      style: CTextStyles.Body2(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'appleSDGothicNeo')),
                                  SizedBox(width: 24)
                                ]),
                          ),
                          onPressed: () => Get.toNamed('/login/apple')),
                    ]))));
  }
}
