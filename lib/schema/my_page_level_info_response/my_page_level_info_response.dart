import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_level_info_response.freezed.dart';
part 'my_page_level_info_response.g.dart';

/// levelInfo
@freezed
class MyPageLevelInfoResponse with _$MyPageLevelInfoResponse {
  const factory MyPageLevelInfoResponse({
    required int level,
    required int point,
    required int pointLeftForLevelUp,
  }) = _MyPageLevelInfoResponse;

  factory MyPageLevelInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPageLevelInfoResponseFromJson(json);
}
