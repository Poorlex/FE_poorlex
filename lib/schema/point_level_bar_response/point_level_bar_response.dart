import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_level_bar_response.freezed.dart';
part 'point_level_bar_response.g.dart';

@freezed
class PointLevelBarResponse with _$PointLevelBarResponse {
  const factory PointLevelBarResponse({
    required int levelRange,
    required int currentPoint,
    required int recentPoint,
  }) = _PointLevelBarResponse;

  factory PointLevelBarResponse.fromJson(Map<String, dynamic> json) =>
      _$PointLevelBarResponseFromJson(json);
}
