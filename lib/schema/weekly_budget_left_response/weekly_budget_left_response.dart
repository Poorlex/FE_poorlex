import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_budget_left_response.freezed.dart';
part 'weekly_budget_left_response.g.dart';

@freezed
class WeeklyBudgetLeftResponse with _$WeeklyBudgetLeftResponse {
  const factory WeeklyBudgetLeftResponse({
    required bool exist,
    required int left,
  }) = _WeeklyBudgetLeftResponse;

  factory WeeklyBudgetLeftResponse.fromJson(Map<String, dynamic> json) =>
      _$WeeklyBudgetLeftResponseFromJson(json);
}
