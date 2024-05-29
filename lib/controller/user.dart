import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/controller/api.dart';
import 'package:poorlex/models/user.dart';
import 'package:poorlex/libs/time.dart';
import 'package:poorlex/schema/social_login/social_login.dart';

class UserController extends GetxController {
  final userInfo = UserInfo().obs;

  /// [TODO]
  /// 아래의 토큰은 서버에서 토큰 받아오는 로직이 추가되면 제거해야합니다.
  final userToken = UserToken(
          token:
              'eyJhbGciOiJIUzM4NCJ9.eyJpYXQiOjE3MTY5NTQyMzAsImV4cCI6MTgxNjk1NDIzMCwibWVtYmVySWQiOjI0fQ.nLVpg98TIcjArKxMVIDeXNegLD49OmoSo_wioI_TybTqAWNP6V7-szrOyoUQzp-N')
      .obs;
  final expenditure = Expenditure().obs;
  final expenditures = <Expenditure>[].obs;
  final alarmAllows = AlarmAllows().obs;

  ApiController api = Get.find<ApiController>();

  /// [TODO] 제거대상
  Future<bool> getNotification() async {
    var ui = await api.request(method: Methods.get, url: '/api/member/alarms');
    if (ui.success) print(ui.body);
    return ui.success;
  }

  /// [TODO] 제거대상
  Future<bool> updateUserAlarm(String type, bool isAllow) async {
    var ui = await api.request(
        method: Methods.patch,
        url: '/api/alarms/allowance',
        body: {'alarmType': type, 'allowed': isAllow});
    if (ui.success) await getUserAlarm();
    return ui.success;
  }

  /// [TODO] 제거대상
  Future<bool> getUserAlarm() async {
    var ui =
        await api.request(method: Methods.get, url: '/api/alarms/allowance');
    if (ui.success) updateAlarmAllows(AlarmAllows.fromJson(ui.body!));
    return ui.success;
  }

  /// [TODO] 제거대상
  Future<bool> getUserInfo() async {
    var ui = await api.request(method: Methods.get, url: '/api/member/my-page');
    if (ui.success) {
      updateUser(UserInfo.fromJson(ui.body!));
    }
    return ui.success;
  }

  /// [TODO] 제거대상
  Future<bool> signout() async {
    var result = await api.request(method: Methods.delete, url: '/api/member');
    return result.success;
  }

  /// [TODO] 제거대상
  Future<bool> removeExpenditure(int id) async {
    var e = await api.request(
        method: Methods.delete, url: '/api/expenditures/${id}');
    return e.success;
  }

  /// [TODO] 제거대상
  Future<bool> getExpenditures() async {
    var e = await api.request(method: Methods.get, url: '/api/expenditures');
    if (e.success)
      updateExpenditures((e.body ?? [])
          .map<Expenditure>((b) => Expenditure.fromJson(b))
          .toList());
    return e.success;
  }

  /// [TODO] 제거대상
  Future<Expenditure> getExpenditure(int id) async {
    var e =
        await api.request(method: Methods.get, url: '/api/expenditures/${id}');
    if (e.success) {
      expenditure.value = Expenditure.fromJson(e.body);
      update();
      return expenditure.value;
    } else
      return Expenditure();
  }

  /// [TODO] 제거대상
  Future<bool> patchProfile({
    required String nickname,
    required String description,
  }) async {
    var r = await api.request(
        method: Methods.patch,
        url: '/api/member/profile',
        body: {'nickname': nickname, 'description': description});
    if (r.success) await getUserInfo();
    return r.success;
  }

  /// [TODO] 제거대상
  Future<bool> uploadExpenditure({
    required String price,
    required String description,
    required int day,
    int? id,
    XFile? mainImage,
    XFile? subImage,
    String? originMainImage,
    String? originSubImage,
  }) async {
    Map<String, List<XFile>> files = {};
    Map<String, String> body = {
      'amount': price,
      'description': description,
      'date': cTimeFormat(day, 'yyyy-MM-dd')
    };

    if (mainImage != null)
      files['mainImage'] = [mainImage];
    else if (originMainImage != null) body['mainImageUrl'] = originMainImage;
    if (subImage != null)
      files['subImage'] = [subImage];
    else if (originSubImage != null) body['subImageUrl'] = originSubImage;

    var r = await api.requestMultipart(
        method: id == null ? Methods.post : Methods.put,
        url: id == null ? '/api/expenditures' : '/api/expenditures/${id}',
        body: body,
        files: files);
    if (r.success) {
      await getUserInfo();
      await getExpenditures();
    }
    return r.success;
  }

  /// [TODO] 제거대상
  void updateAlarmAllows(AlarmAllows allows) {
    alarmAllows.value = allows;
    update();
  }

  /// [TODO] 제거대상
  void updateExpenditures(List<Expenditure> list) {
    expenditures.value = list;
    update();
  }

  /// [TODO] 제거대상
  void updateUser(UserInfo? user) {
    print(user);
    if (user != null) {
      userInfo.update((val) {
        val?.nickname = user.nickname;
        val?.description = user.description;
        val?.levelInfo = user.levelInfo;
        val?.battleSuccessInfo = user.battleSuccessInfo;
        val?.friendTotalCount = user.friendTotalCount;
        val?.friends = user.friends;
        val?.expenditures = user.expenditures;
        val?.expenditureTotalCount = user.expenditureTotalCount;
      });
    } else {
      userInfo.update((val) {
        val = UserInfo();
      });
    }
  }

  /// [TODO] 제거대상
  bool updateToken(UserToken? token) {
    if (token != null) {
      userToken.update((val) {
        val?.token = token.token;
        val?.refreshToken = token.refreshToken;
      });
      api.updateToken(token.token!);
      var auth = Hive.box('auth');
      auth.put('token', token.token);
      return true;
    } else {
      userToken.update((val) {
        val = UserToken();
      });
      api.updateToken('');
      return false;
    }
  }

  /// 초기갑은 null입니다.
  ///  null을 허용하는 observable
  final Rxn<SocialLoginModel> _authenticationInfo = Rxn<SocialLoginModel>();

  /// [TODO] kakao 혹은 apple 로그인 이후 서버에서 토큰 발급 받는 로직을 구현해야합니다.
  Future<void> getAuthentication(SocialLoginModel? socialLoginModel) async {
    _authenticationInfo(socialLoginModel);
  }

  /// [TODO]
  /// 여기에 실제 인증 상태 확인 로직을 구현해야합니다.
  /// 현재 사용자가 인증된 경우 true, 그렇지 않은 경우 false를 반환
  bool isAuthenticated() {
    return _authenticationInfo.value != null;
  }
}
