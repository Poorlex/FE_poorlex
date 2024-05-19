import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_alarm_response.freezed.dart';
part 'member_alarm_response.g.dart';

/// 회원 알림 model
@freezed
class MemberAlarmResponse with _$MemberAlarmResponse {
  const factory MemberAlarmResponse({
    required int alarmId,
    required String friendName,
    required String battleName,
    required String alarmType,
    required int minutePassed,
    required int hourPassed,
    required int dayPassed,
  }) = _MemberAlarmResponse;

  factory MemberAlarmResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberAlarmResponseFromJson(json);
}
