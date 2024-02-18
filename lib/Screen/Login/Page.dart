import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';

import 'package:poorlex/Widget/Common/Base.dart';
import 'package:poorlex/Widget/Common/Buttons.dart';

import 'package:poorlex/Widget/Login/LoginModal.dart';

class Login extends StatefulWidget {
  Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(child:
            CCon(color: CColors.white, padding: EdgeInsets.all(20), child:
              CCol(main: MainAxisAlignment.center, cross: CrossAxisAlignment.center, children: [
                Image.asset('assets/login/login.png'),
                SizedBox(height: 41),
                Text('풀렉스에서 다른 거지 친구들과 함께\n재미있게 절약해봐요!', style: CTextStyles.Body2(color: CColors.black, fontFamily: 'appleSDGothicNeo'), textAlign: TextAlign.center),
                SizedBox(height: 41),
                Button(type: ButtonTypes.elevated, color: CColors.kakaoYellow, child:
                    Container(height: 56, child:
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Image.asset('assets/login/kakao.png', width: 24, height: 24,),
                        Text('카카오로 3초만에 로그인', style: CTextStyles.Body2(color: CColors.black, fontFamily: 'appleSDGothicNeo')),
                        SizedBox(width: 24)
                      ]),
                    ),
                    onPressed: () => Navigator.push(context, LoginModal(loginType: LoginTypes.kakao))
                ),
                SizedBox(height: 20),
                Button(type: ButtonTypes.elevated, color: CColors.black, child:
                    Container(height: 56, child:
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Image.asset('assets/login/apple.png', width: 24, height: 24,),
                        Text('Apple ID로 로그인', style: CTextStyles.Body2(fontFamily: 'appleSDGothicNeo')),
                        SizedBox(width: 24)
                      ]),
                    ),
                    onPressed: () => Navigator.push(context, LoginModal(loginType: LoginTypes.apple))
                ),
              ])
            )
        )
    );
  }
}
