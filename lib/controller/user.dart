import 'package:get/get.dart';
import 'package:poorlex/controller/api.dart';
import 'package:poorlex/controller/hive_box.dart';
import 'package:poorlex/controller/image_picker.dart';
import 'package:poorlex/enums/social_type.dart';
import 'package:poorlex/main.dart';
import 'package:poorlex/models/user.dart';
import 'package:poorlex/provider/expenditures_provider.dart';
import 'package:poorlex/provider/login_provider.dart';
import 'package:poorlex/provider/member_provider.dart';
import 'package:poorlex/schema/expenditure_response/expenditure_response.dart';
import 'package:poorlex/schema/my_page_response/my_page_response.dart';
import 'package:poorlex/schema/social_login/social_login.dart';
import 'package:poorlex/widget/common/dialog/common_alert.dart';

/// [TODO] 지출 상세, 지출 수정, 지출 삭제를 분리해서 Controller 생성 필요
class UserController extends GetxController {
  final MemberProvider memberProvider;
  final ExpendituresProvider expendituresProvider;
  final LoginProvider loginProvider;
  UserController({
    required this.memberProvider,
    required this.expendituresProvider,
    required this.loginProvider,
  });

  final Rxn<MyPageResponse> _userInfo = Rxn<MyPageResponse>();
  MyPageResponse? get userInfo => _userInfo.value;

  final Rxn<String> _userToken = Rxn<String>();
  String? get userToken => _userToken.value;

  final Rxn<ExpenditureResponse> _expenditure = Rxn<ExpenditureResponse>();
  ExpenditureResponse? get expenditure => _expenditure.value;

  void expenditureClear() {
    _expenditure(null);
  }

  final alarmAllows = AlarmAllows().obs;

  ApiController api = Get.find<ApiController>();

  Future<void> removeExpenditure(int id) async {
    await expendituresProvider.deleteExpenditures(expenditureId: id);
    await _getUserInfo();
  }

  Future<ExpenditureResponse?> getExpenditure(int id) async {
    final response =
        await expendituresProvider.getDetailById(expenditureId: id);
    _expenditure(response);
    return response;
  }

  Future<bool> patchProfile({
    required String nickname,
    required String description,
  }) async {
    final response = await memberProvider.patchProfile(
      nickname: nickname,
      description: description,
    );

    return await response.fold(
      (l) async {
        await commonAlert(
          context: navigatorKey.currentContext!,
          message: l.message,
        );
        return false;
      },
      (r) async {
        await _getUserInfo();
        return true;
      },
    );
  }

  /// 지출 생성
  Future<bool> uploadExpenditure({
    required int price,
    required String description,
    required DateTime date,
    required FileWithName mainImage,
    FileWithName? subImage,
  }) async {
    final result = await expendituresProvider.postCreateExpenditures(
      amount: price,
      description: description,
      date: date,
      mainImage: mainImage,
      subImage: subImage,
    );
    await _getUserInfo();
    return result;
  }

  Future<void> putModifyExpenditures({
    required int expenditureId,
    required int amount,
    required String description,
    FileWithName? mainImage,
    FileWithName? subImage,
    String? mainImageUrl,
    String? subImageUrl,
  }) async {
    await expendituresProvider.putModifyExpenditures(
      expenditureId: expenditureId,
      amount: amount,
      description: description,
      mainImage: mainImage,
      subImage: subImage,
      mainImageUrl: mainImageUrl,
      subImageUrl: subImageUrl,
    );
  }

  /// [MEMO] token으로 유저 정보 가져오기 (내부에서만 사용됩니다.)
  Future<void> _getUserInfo() async {
    try {
      final userInfo = await memberProvider.getMyPage();
      _userInfo(userInfo);
    } catch (e) {}
  }

  /// token 가져오면서 user정보도 가져옵니다.
  Future<void> updateToken(String? token) async {
    _userToken(token);
    await _getUserInfo();
    await HiveBox().putToken(token);
  }

  Future<void> getAuthentication(SocialLoginModel socialLoginModel) async {
    if (socialLoginModel.socialType == SocialType.kakao) {
      final token = await loginProvider.kakao(code: socialLoginModel.code);
      await updateToken(token);
    } else if (socialLoginModel.socialType == SocialType.apple) {
      final token = await loginProvider.apple(code: socialLoginModel.code);
      await updateToken(token);
    }
  }

  /// [MEMO]
  /// 현재 사용자가 인증된 경우 (token 있을 경우) true, 그렇지 않은 경우 false를 반환
  bool isAuthenticated() {
    return _userToken.value != null;
  }
}
