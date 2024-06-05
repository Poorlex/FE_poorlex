import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/controller/api.dart';
import 'package:poorlex/controller/hive_box.dart';
import 'package:poorlex/enums/social_type.dart';
import 'package:poorlex/models/user.dart';
import 'package:poorlex/libs/time.dart';
import 'package:poorlex/provider/expenditures_povider.dart';
import 'package:poorlex/provider/login_provider.dart';
import 'package:poorlex/provider/member_provider.dart';
import 'package:poorlex/schema/expenditure_response/expenditure_response.dart';
import 'package:poorlex/schema/my_page_response/my_page_response.dart';
import 'package:poorlex/schema/social_login/social_login.dart';

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

  final Rxn<ExpenditureResponse> expenditure = Rxn<ExpenditureResponse>();
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

  void updateUser(MyPageResponse? user) {
    _userInfo(user);
  }

  /// [MEMO] token으로 유저 정보 가져오기 (내부에서만 사용됩니다.)
  Future<void> _getUserInfo() async {
    final userInfo = await memberProvider.getMyPage();
    _userInfo(userInfo);
  }

  /// token 가져오면서 user정보도 가져옵니다.
  Future<void> updateToken(String? token) async {
    _userToken(token);
    await _getUserInfo();
    await HiveBox().putToken(token);
  }

  Future<void> getAuthentication(SocialLoginModel? socialLoginModel) async {
    if (socialLoginModel == null) return;
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
