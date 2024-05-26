import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poorlex/schema/participant_ranking_response/participant_ranking_response.dart';

part 'battle_response.freezed.dart';
part 'battle_response.g.dart';

@freezed
class BattleResponse with _$BattleResponse {
  const factory BattleResponse({
    required String battleName,
    required String battleImageUrl,
    required int maxParticipantSize,
    required int currentParticipantSize,
    required int battleBudget,
    required int battleDDay,
    required List<ParticipantRankingResponse> rankings,
  }) = _BattleResponse;

  factory BattleResponse.fromJson(Map<String, dynamic> json) =>
      _$BattleResponseFromJson(json);
}
