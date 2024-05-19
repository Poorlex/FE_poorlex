import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _FindingBattleResponse;

  factory FindingBattleResponse.fromJson(Map<String, dynamic> json) =>
      _$FindingBattleResponseFromJson(json);
}
