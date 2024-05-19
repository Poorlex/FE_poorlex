import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenditure_response.freezed.dart';
part 'expenditure_response.g.dart';

/// 지출
@freezed
class ExpenditureResponse with _$ExpenditureResponse {
  const factory ExpenditureResponse({
    required int id,
    required String date,
    required int amount,
    required String description,
    required String mainImageUrl,
    required String subImageUrl,
  }) = _ExpenditureResponse;

  factory ExpenditureResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenditureResponseFromJson(json);
}
