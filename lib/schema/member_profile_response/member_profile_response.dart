import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poorlex/schema/my_page_level_info_response/my_page_level_info_response.dart';

part 'member_profile_response.freezed.dart';
part 'member_profile_response.g.dart';

@freezed
class MemberProfileResponse with _$MemberProfileResponse {
  factory MemberProfileResponse({
    required String nickname,
    required String description,
    required MyPageLevelInfoResponse levelInfo,
  }) = _MemberProfileResponse;

  factory MemberProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberProfileResponseFromJson(json);

  factory MemberProfileResponse.empty() => MemberProfileResponse(
        nickname: '',
        description: '',
        levelInfo: MyPageLevelInfoResponse.empty(),
      );
}
