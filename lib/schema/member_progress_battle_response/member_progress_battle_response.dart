import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_progress_battle_response.freezed.dart';
part 'member_progress_battle_response.g.dart';

@freezed
class MemberProgressBattleResponse with _$MemberProgressBattleResponse {
  const factory MemberProgressBattleResponse({
    required int battleId,
    required String name,
    required String imageUrl,
    required String difficulty,
    required int budgetLeft,
    required int currentParticipantRank,
    required int battleParticipantCount,
    required int uncheckedAlarmCount,
    required int dday,
  }) = _MemberProgressBattleResponse;

  factory MemberProgressBattleResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberProgressBattleResponseFromJson(json);
}
