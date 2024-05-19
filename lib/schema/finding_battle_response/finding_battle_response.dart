import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poorlex/schema/participant_ranking_response/participant_ranking_response.dart';

part 'finding_battle_response.freezed.dart';
part 'finding_battle_response.g.dart';

@freezed
class FindingBattleResponse with _$FindingBattleResponse {
  const factory FindingBattleResponse({
    required int battleId,
    required String name,
    required String introduction,
    required String imageUrl,
    required String difficulty,
    required int budget,
    required int currentParticipant,
    required int maxParticipantCount,
    required ParticipantRankingResponse rankings,
  }) = _FindingBattleResponse;

  factory FindingBattleResponse.fromJson(Map<String, dynamic> json) =>
      _$FindingBattleResponseFromJson(json);
}
