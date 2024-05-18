import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_success_count_response.freezed.dart';
part 'battle_success_count_response.g.dart';

/// battleSuccessInfo
@freezed
class BattleSuccessCountResponse with _$BattleSuccessCountResponse {
  const factory BattleSuccessCountResponse({
    required int totalBattleSuccessCount,
    required int hardBattleSuccessCount,
    required int normalBattleSuccessCount,
    required int easyBattleSuccessCount,
  }) = _BattleSuccessCountResponse;

  factory BattleSuccessCountResponse.fromJson(Map<String, dynamic> json) =>
      _$BattleSuccessCountResponseFromJson(json);
}
