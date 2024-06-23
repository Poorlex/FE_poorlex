import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_manage_response.freezed.dart';
part 'battle_manage_response.g.dart';

@freezed
class BattleManageResponse with _$BattleManageResponse {
  factory BattleManageResponse({
    required String nickname,
    required int level,
    String? description,
  }) = _BattleManageResponse;

  factory BattleManageResponse.fromJson(Map<String, dynamic> json) =>
      _$BattleManageResponseFromJson(json);
}
