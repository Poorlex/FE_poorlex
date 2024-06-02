import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/controller/api.dart';
import 'package:poorlex/models/user.dart';
import 'package:poorlex/libs/time.dart';
import 'package:poorlex/provider/expenditures_povider.dart';
import 'package:poorlex/provider/member_provider.dart';
import 'package:poorlex/schema/expenditure_response/expenditure_response.dart';
import 'package:poorlex/schema/social_login/social_login.dart';

class UserController extends GetxController {
  final MemberProvider memberProvider;
  final ExpendituresProvider expendituresProvider;
  UserController({
    required this.memberProvider,
    required this.expendituresProvider,
  });
  final userInfo = UserInfo().obs;

  /// [TODO]
  /// 아래의 토큰은 서버에서 토큰 받아오는 로직이 추가되면 제거해야합니다.
  final userToken = UserToken(
          token:
              'eyJhbGciOiJIUzM4NCJ9.eyJpYXQiOjE3MTcyNDI3MjIsImV4cCI6MTgxNzI0MjcyMiwibWVtYmVySWQiOjI0fQ.MuCOqvidSEgPJ6nMSXeRi4Kko3CdogHOkzYqoTewYzZGc0RphkTrd3hcM8HxclOd')
      .obs;
  final expenditure = Rxn<ExpenditureResponse>();
  final expenditures = <ExpenditureResponse>[].obs;
  final alarmAllows = AlarmAllows().obs;

  ApiController api = Get.find<ApiController>();

  /// [TODO] API 테스트 필요
  Future<bool> removeExpenditure(int id) async {
    final response =
        await expendituresProvider.deleteExpenditures(expenditureId: id);
    return response;
  }

  /// [TODO] API 테스트 필요
  Future<void> getExpenditures() async {
    final response = await expendituresProvider.getList();
    expenditures.value = response ?? [];
  }

  /// [TODO] API 테스트 필요
  Future<ExpenditureResponse?> getExpenditure(int id) async {
    final response =
        await expendituresProvider.getDetailById(expenditureId: id);
    expenditure.value = response;
    return response;
  }

  /// [TODO] 제거대상
  Future<void> patchProfile({
    required String nickname,
    required String description,
  }) async {
    await memberProvider.patchProfile(
      nickname: nickname,
      description: description,
    );
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
