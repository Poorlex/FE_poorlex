import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/schema/alarm_allowance_response/alarm_allowance_response.dart';

class AlarmProvider extends GetConnect {
  @override
  void onInit() {
    // prefix "/alarms" 적용
    httpClient.baseUrl = "${dotenv.get('SERVER_URL')}/alarms";

    /// [TODO] header에 token 잘 들어가는지 확인 필요
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

  /// [TEST] 동작 확인 필요
  /// 알림 허용 정보 조회
  Future<AlarmAllowanceResponse?> getAllowance() async {
    final response = await get(
      '/allowance',
      decoder: (data) {
        return AlarmAllowanceResponse.fromJson(data);
      },
    );
    return response.body;
  }

  /// [MEMO] 미구현 API
  /// 알림 허용 카테고리 수정
  Future<AlarmAllowanceResponse?> patchAllowance() async {
    final response = await patch(
      '/allowance',
      {},
      decoder: (data) {
        return AlarmAllowanceResponse.fromJson(data);
      },
    );
    return response.body;
  }
}
