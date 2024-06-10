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

  /// 지출 수정
  /// - 메인 지출 이미지 수정 방식은 다음과 같습니다.
  ///   - 파일만을 전달하는 경우 메인 이미지 수정을 의미합니다.
  ///   - URL만을 전달하는 경우 메인 이미지 변경이 없거나 이미 등록된 서브 이미지가 메인 이미지로 변경됨을 의미합니다.
  ///   - 파일, URL 모두 전달하지 않는 경우 메인 이미지는 반드시 존재해야 하기에 에러가 발생합니다.
  ///   - 파일, URL 모두 전달하는 경우는 URL만을 전달받은 것으로 처리됩니다.
  /// - 서브 지출 이미지 수정 방식은 다음과 같습니다.
  ///   - 파일만을 전달하는 경우 서브 이미지 수정 혹은 추가를 의미합니다.
  ///   - URL만을 전달하는 경우 서브 이미지 변경이 없거나 이미 등록된 메인 이미지가 서브 이미지로 변경됨을 의미합니다.
  ///   - 파일, URL 모두 전달하지 않는 경우 원래 서브 이미지가 없거나 서브 이미지의 삭제를 의미합니다.
  ///   - 파일, URL 모두 전달하는 경우는 URL만을 전달받은 것으로 처리됩니다.
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
      if (mainImageUrl != null && mainImage == null)
        "mainImageUrl": mainImageUrl,
      if (subImageUrl != null && subImage == null) "subImageUrl": subImageUrl,
    });
    final response = await put(
      "/$expenditureId",
      formData,
      query: {
        "amount": amount.toString(),
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
