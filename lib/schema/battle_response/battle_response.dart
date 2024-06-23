import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poorlex/schema/battle_manage_response/battle_manage_response.dart';

part 'battle_response.freezed.dart';
part 'battle_response.g.dart';

@freezed
class BattleResponse with _$BattleResponse {
  const factory BattleResponse({
    required int id,
    required String battleName,
    required String battleImageUrl,
    required String battleIntroduction,
    required BattleManageResponse battleManager,
    required int maxParticipantSize,
    required int currentParticipantSize,
    required int battleBudget,
    required int battleDDay,
    required bool isParticipating,
  }) = _BattleResponse;

  factory BattleResponse.fromJson(Map<String, dynamic> json) =>
      _$BattleResponseFromJson(json);
}
