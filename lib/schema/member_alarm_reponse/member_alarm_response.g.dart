// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_alarm_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberAlarmResponseImpl _$$MemberAlarmResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MemberAlarmResponseImpl(
      alarmId: (json['alarmId'] as num).toInt(),
      friendName: json['friendName'] as String,
      battleName: json['battleName'] as String,
      alarmType: json['alarmType'] as String,
      minutePassed: (json['minutePassed'] as num).toInt(),
      hourPassed: (json['hourPassed'] as num).toInt(),
      dayPassed: (json['dayPassed'] as num).toInt(),
    );

Map<String, dynamic> _$$MemberAlarmResponseImplToJson(
        _$MemberAlarmResponseImpl instance) =>
    <String, dynamic>{
      'alarmId': instance.alarmId,
      'friendName': instance.friendName,
      'battleName': instance.battleName,
      'alarmType': instance.alarmType,
      'minutePassed': instance.minutePassed,
      'hourPassed': instance.hourPassed,
      'dayPassed': instance.dayPassed,
    };
