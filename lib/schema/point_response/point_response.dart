import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_response.freezed.dart';
part 'point_response.g.dart';

@freezed
class PointResponse with _$PointResponse {
  const factory PointResponse({
    required int totalPoint,
    required int level,
  }) = _PointResponse;

  factory PointResponse.fromJson(Map<String, dynamic> json) =>
      _$PointResponseFromJson(json);
}
