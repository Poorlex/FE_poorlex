import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_expenditure_response.freezed.dart';
part 'my_page_expenditure_response.g.dart';

/// expenditure
@freezed
class MyPageExpenditureResponse with _$MyPageExpenditureResponse {
  const factory MyPageExpenditureResponse({
    required int id,
    required String date,
    required int amount,
    required String imageUrl,
  }) = _MyPageExpenditureResponse;

  factory MyPageExpenditureResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPageExpenditureResponseFromJson(json);
}
