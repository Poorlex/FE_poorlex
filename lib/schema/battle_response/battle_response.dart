import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_response.freezed.dart';
part 'battle_response.g.dart';

@freezed
class BattleResponse with _$BattleResponse {
  const factory BattleResponse({
    required String battleName,
    required int maxParticipantSize,
    required int currentParticipantSize,
    required int battleBudget,
    required int battleDDay,
  }) = _BattleResponse;

  factory BattleResponse.fromJson(Map<String, dynamic> json) =>
      _$BattleResponseFromJson(json);
}
