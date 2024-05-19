import 'package:freezed_annotation/freezed_annotation.dart';

part 'vote_response.freezed.dart';
part 'vote_response.g.dart';

/// 배틀 알림 조회
///
/// 아래의 3개의 response 통합
/// - 배틀알림 (BattleAlarmResponse)
/// - 투표 표 알림 (VotingPaperResponse)
/// - 투표 알림 (VoteResponse)
@freezed
class VoteResponse with _$VoteResponse {
  const factory VoteResponse({
    required String alarmType,
    required DateTime createdAt,
    int? alarmId,
    int? memberId,
    int? voteAmount,
    bool? agree,
    String? voteMakerNickname,
    String? voteName,
    String? voteStatus,
    int? voteAgreeCount,
    int? voteId,
    int? voteDisagreeCount,
  }) = _VoteResponse;

  factory VoteResponse.fromJson(Map<String, dynamic> json) =>
      _$VoteResponseFromJson(json);
}
