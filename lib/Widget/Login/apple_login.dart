import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../Controller/user_controller.dart';

class AppleLogin extends StatefulWidget {
  const AppleLogin({super.key});

  @override
  State<AppleLogin> createState() => _AppleLoginState();
}

class _AppleLoginState extends State<AppleLogin> {
  final UserController _con = Get.put(UserController());

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
          _con.userUpdateApple('애플', '로그인', credential.identityToken);
        } else {
          // 로그인 성공 처리
          _con.userUpdateApple(credential.familyName, credential.givenName,
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

  void ApplelogOut() async {}

  @override
  Widget build(BuildContext context) {
    final UserController user = Get.put(UserController());
    return Container(
        //   decoration: const BoxDecoration(color: Colors.white),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       const Center(
        //         child: Text('apple'),
        //       ),
        //       ElevatedButton(
        //         onPressed: () {
        //           signInWithApple();
        //         },
        //         child: const Text('hi'),
        //       ),
        //       Text(user.userInfo().userId, style: const TextStyle(fontSize: 10)),
        //       Text(user.userInfo().userName, style: const TextStyle(fontSize: 10))
        //     ],
        //   ),
        );
  }
}
