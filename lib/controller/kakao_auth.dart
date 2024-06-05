import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:poorlex/enums/social_type.dart';
import 'package:poorlex/schema/social_login/social_login.dart';

class KaKaoAuthController {
  KaKaoAuthController._internal();

  factory KaKaoAuthController() {
    return _instance;
  }
  // 싱글톤 인스턴스를 저장할 정적 변수
  static final KaKaoAuthController _instance = KaKaoAuthController._internal();

  final UserApi _kakaoAuth = UserApi.instance;
  Future<User> get user async => await _kakaoAuth.me();

  /// [MEMO] ERROR 해결 방법 정리
  /// - {error: misconfigured, error_description: invalid android_key_hash or ios_bundle_id or web_site_url}
  ///     - [컴퓨터 키 해시 등록해야합니다.](https://developers.kakao.com/docs/latest/ko/android/getting-started#before-you-begin-add-key-hash-using-keytool)
  Future<SocialLoginModel?> kakaoLogin() async {
    /// [error: misconfigured 해결] kakao key hash 확인
    // print("key hash");
    // print(await KakaoSdk.origin);
    if (await isKakaoTalkInstalled()) {
      try {
        final OAuthToken oauthToken = await _kakaoAuth.loginWithKakaoTalk();
        return SocialLoginModel(
          socialType: SocialType.kakao,
          code: oauthToken.accessToken,
        );
      } catch (err) {
        print("loginWithKakaoTalk Error: $err");
      }
    } else {
      try {
        final OAuthToken oauthToken = await _kakaoAuth.loginWithKakaoAccount();
        return SocialLoginModel(
          socialType: SocialType.kakao,
          code: oauthToken.accessToken,
        );
      } catch (err) {
        print('loginWithKakaoAccount Error: $err');
      }
    }
    return null;
  }

  Future<void> logOut() async {
    try {
      await _kakaoAuth.unlink();
    } catch (err) {
      print('로그아웃 실패 : $err');
    }
  }
}
