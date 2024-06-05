import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "${dotenv.get('SERVER_URL')}/login/oauth";

    httpClient.addRequestModifier<Object?>((request) {
      return request;
    });
  }

  Future<String?> kakao({required String code}) async {
    final response = await post<String>(
      "/kakao",
      {},
      query: {"code": code},
      decoder: (data) {
        return data['accessToken'];
      },
    );
    return response.body;
  }

  Future<String?> apple({required String code}) async {
    final response = await post<String>(
      "/apple",
      {},
      query: {"code": code},
      decoder: (data) {
        return data['accessToken'];
      },
    );

    return response.body;
  }
}
