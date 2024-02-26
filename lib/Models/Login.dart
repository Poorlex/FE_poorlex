enum LoginTypes { kakao, apple }

class LoginTypeObject {
  late final LoginTypes key;
  late final String url;

  LoginTypeObject({ required this.key, required this.url });
}