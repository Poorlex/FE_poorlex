import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_expenditure_response.freezed.dart';
part 'battle_expenditure_response.g.dart';

@freezed
class BattleExpenditureResponse with _$BattleExpenditureResponse {
  const factory BattleExpenditureResponse({
    required int id,
    required String imageUrl,
    required int imageCount,
    required bool own,
  }) = _BattleExpenditureResponse;

  factory BattleExpenditureResponse.fromJson(Map<String, dynamic> json) =>
      _$BattleExpenditureResponseFromJson(json);
}
