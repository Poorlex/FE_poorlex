import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/schema/member_alarm_reponse/member_alarm_response.dart';
import 'package:poorlex/schema/my_page_response/my_page_response.dart';

/// [MEMO] Reference
/// - [sample connect](https://gist.github.com/eduardoflorence/b4bca2da5cfb973b9f86ecfa1b9f013a)
/// - [docs](https://pub.dev/packages/get#getconnect)
class MemberProvider extends GetConnect {
  MemberProvider();
  @override
  void onInit() {
    // prefix "/member" 적용
    httpClient.baseUrl = "${dotenv.get('SERVER_URL')}/member";

    httpClient.addRequestModifier<Object?>((request) {
      final user = Get.find<UserController>();
      final token = user.userToken;
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      print(
        '### REQUEST [method: ${request.method}]'
        '\nURL: ${request.url}'
        '\n${"Header : ${request.headers}"}'
        '\n ### RESPONSE BODY: ${response.body}',
      );
      return response;
    });
  }

  /// 회원 마이페이지 정보 조회
  Future<MyPageResponse?> getMyPage() async {
    final response = await get<MyPageResponse>(
      '/my-page',
      decoder: (data) {
        return MyPageResponse.fromJson(data);
      },
    );
    return response.body;
  }

  /// [TEST] x
  ///
  /// 회원 알림 전체 조회
  Future<List<MemberAlarmResponse>?> getAlarms() async {
    final response = await get<List<MemberAlarmResponse>>(
      '/alarms',
      decoder: (data) {
        return (data as List<dynamic>)
            .map((item) => MemberAlarmResponse.fromJson(item))
            .toList();
      },
    );
    return response.body;
  }

  /// [TEST] x
  /// - status code가 200일 경우 성공, 해당 부분 api 테스트가 필요합니다.
  ///
  /// 회원 프로필 변경
  Future<bool> patchProfile({
    required String nickname,
    required String description,
  }) async {
    final response = await patch<void>(
      "/profile",
      {
        "nickname": nickname,
        "description": description,
      },
    );
    return response.statusCode == 200;
  }

  /// [TEST] x
  /// - status code가 200일 경우 성공, 해당 부분 api 테스트가 필요합니다.
  ///
  /// 회원 탈퇴
  Future<bool> memberWithdrawal() async {
    final response = await delete<void>("");
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
