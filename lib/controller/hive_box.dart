import 'package:hive_flutter/hive_flutter.dart';

/// [MEMO] 싱글톤 생성 참고
class HiveBox {
  // private 생성자
  HiveBox._internal();
  // factory 생성자
  factory HiveBox() {
    return _instance;
  }
  // 싱글톤 인스턴스를 저장할 정적 변수
  static final HiveBox _instance = HiveBox._internal();

  static const _boxName = 'auth';
  static late Box _mainBox;
  static String _tokenKey = 'token';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    _mainBox = await Hive.openBox("$_boxName");
  }

  /// null 넣을시 초기화
  Future<void> putToken(String? value) async {
    await _mainBox.put(_tokenKey, value);
  }

  /// token 삭제
  Future<void> deleteToken() async {
    await _mainBox.delete(_tokenKey);
  }
}
