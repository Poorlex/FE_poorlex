import 'package:poorlex/enums/social_type.dart';
import 'package:poorlex/schema/social_login/social_login.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// [MEMO] 현재 애플로그인은 iphone만 제공합니다.
/// 안드로이드, 웹에서 제공하려면 추가 세팅이 필요합니다.
/// https://pub.dev/packages/sign_in_with_apple
class AppleAuthController {
  AppleAuthController._internal();

  factory AppleAuthController() {
    return _instance;
  }

  static final AppleAuthController _instance = AppleAuthController._internal();

  Future<SocialLoginModel?> appleLogin() async {
    final AuthorizationCredentialAppleID credential =
        await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],

      /// iphone 외에 로그인 제공할때 사용
      webAuthenticationOptions: null,
    );
    return SocialLoginModel(
      code: credential.authorizationCode,
      socialType: SocialType.apple,
    );
  }
}
