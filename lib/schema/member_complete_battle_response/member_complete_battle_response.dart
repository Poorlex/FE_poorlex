import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_complete_battle_response.freezed.dart';
part 'member_complete_battle_response.g.dart';

@freezed
class MemberCompleteBattleResponse with _$MemberCompleteBattleResponse {
  const factory MemberCompleteBattleResponse({
    required int battleId,
    required String name,
    required String imageUrl,
    required String difficulty,
    required int pastDay,
    required int budget,
    required int budgetLeft,
    required int currentParticipantRank,
    required int battleParticipantCount,
    required int earnedPoint,
  }) = _MemberCompleteBattleResponse;

  factory MemberCompleteBattleResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberCompleteBattleResponseFromJson(json);
}
