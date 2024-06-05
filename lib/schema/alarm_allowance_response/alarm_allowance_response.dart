import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm_allowance_response.freezed.dart';
part 'alarm_allowance_response.g.dart';

@freezed
class AlarmAllowanceResponse with _$AlarmAllowanceResponse {
  factory AlarmAllowanceResponse({
    required bool allowBattleInvitationAlarm,
    required bool allowFriendAlarm,
    required bool allowExpenditureRequestAlarm,
    required bool allowBattleStatusAlarm,
    required bool allowBattleChatAlarm,
  }) = _AlarmAllowanceResponse;

  factory AlarmAllowanceResponse.fromJson(Map<String, dynamic> json) =>
      _$AlarmAllowanceResponseFromJson(json);
}
