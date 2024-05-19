import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_budget_response.freezed.dart';
part 'weekly_budget_response.g.dart';

@freezed
class WeeklyBudgetResponse with _$WeeklyBudgetResponse {
  const factory WeeklyBudgetResponse({
    required bool exist,
    required int amount,
  }) = _WeeklyBudgetResponse;

  factory WeeklyBudgetResponse.fromJson(Map<String, dynamic> json) =>
      _$WeeklyBudgetResponseFromJson(json);
}
