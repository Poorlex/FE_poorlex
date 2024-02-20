enum LoginTypes { kakao, apple }

class LoginTypeObject {
  late final String label;
  late final LoginTypes key;
  late final String url;

  LoginTypeObject({ required this.label, required this.key, required this.url });
}