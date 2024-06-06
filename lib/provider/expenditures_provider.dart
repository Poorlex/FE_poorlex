import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/libs/time.dart';
import 'package:poorlex/schema/expenditure_response/expenditure_response.dart';

class ExpendituresProvider extends GetConnect {
  @override
  void onInit() {
    // prefix "/expenditures" 적용
    httpClient.baseUrl = "${dotenv.get('SERVER_URL')}/expenditures";

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

  /// [TEST] x
  /// 지출 상세 조회
  Future<ExpenditureResponse?> getDetailById({
    required int expenditureId,
  }) async {
    final response = await get<ExpenditureResponse>(
      "/$expenditureId",
      decoder: (data) {
        return ExpenditureResponse.fromJson(data);
      },
    );
    return response.body;
  }

  /// [TEST] x
  /// 회원 지출 목록 조회
  Future<List<ExpenditureResponse>?> getList() async {
    final response = await get<List<ExpenditureResponse>>(
      "",
      decoder: (data) {
        print("data $data");
        return (data as List<dynamic>)
            .map((e) => ExpenditureResponse.fromJson(e))
            .toList();
      },
    );
    return response.body;
  }

  /// [TEST] x
  /// 회원 주간 총 지출 조회 (요청 시간 기준)
  Future<int?> getWeeklyAmount() async {
    final response = await get<int>(
      "/weekly",
      decoder: (data) {
        /// [MEMO]: 필요시 schema 구현
        /// api 문서 기준 MemberWeeklyTotalExpenditureResponse 입니다.
        return data['amount'];
      },
    );
    return response.body;
  }

  /// [TEST] x
  ///  api 연결하면서, formData 형식 수정 필요 할 수 도 있음.
  ///
  /// 지출 수정
  Future<bool> putModifyExpenditures({
    required int expenditureId,
    required int amount,
    required String description,
    XFile? mainImage,
    XFile? subImage,
    String? mainImageUrl,
    String? subImageUrl,
  }) async {
    // FormData 객체 생성
    final formData = FormData({
      if (mainImage != null)
        "mainImage": MultipartFile(
          File(mainImage.path),
          filename: mainImage.name,
        ),
      if (subImage != null)
        "subImage": MultipartFile(
          File(subImage.path),
          filename: subImage.name,
        ),
    });
    final response = await put(
      "/$expenditureId",
      formData,
      query: {
        "amount": amount,
        "description": description,
      },
    );
    return response.statusCode == 200;
  }

  /// [TEST] x
  /// 지출 삭제
  Future<bool> deleteExpenditures({
    required int expenditureId,
  }) async {
    final response = await delete("/$expenditureId");
    return response.statusCode == 200;
  }

  /// [TEST] x
  /// 지출 등록
  Future<bool> postCreateExpenditures({
    required int amount,
    required String description,
    required DateTime date,
    required XFile mainImage,
    XFile? subImage,
  }) async {
    final formData = FormData({
      "mainImage": MultipartFile(
        File(mainImage.path),
        filename: mainImage.name,
      ),
      if (subImage != null)
        "subImage": MultipartFile(
          File(subImage.path),
          filename: subImage.name,
        ),
    });
    print({
      "amount": amount.toString(),
      "description": description,
      "date": cFormatDateToString(date),
    });
    final response = await post(
      "",
      formData,
      query: {
        "amount": amount.toString(),
        "description": description,
        "date": cFormatDateToString(date),
      },
    );
    return response.statusCode == 201;
  }
}
