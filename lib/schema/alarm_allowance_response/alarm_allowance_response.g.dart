// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_allowance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlarmAllowanceResponseImpl _$$AlarmAllowanceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AlarmAllowanceResponseImpl(
      allowBattleInvitationAlarm: json['allowBattleInvitationAlarm'] as bool,
      allowFriendAlarm: json['allowFriendAlarm'] as bool,
      allowExpenditureRequestAlarm:
          json['allowExpenditureRequestAlarm'] as bool,
      allowBattleStatusAlarm: json['allowBattleStatusAlarm'] as bool,
      allowBattleChatAlarm: json['allowBattleChatAlarm'] as bool,
    );

Map<String, dynamic> _$$AlarmAllowanceResponseImplToJson(
        _$AlarmAllowanceResponseImpl instance) =>
    <String, dynamic>{
      'allowBattleInvitationAlarm': instance.allowBattleInvitationAlarm,
      'allowFriendAlarm': instance.allowFriendAlarm,
      'allowExpenditureRequestAlarm': instance.allowExpenditureRequestAlarm,
      'allowBattleStatusAlarm': instance.allowBattleStatusAlarm,
      'allowBattleChatAlarm': instance.allowBattleChatAlarm,
    };
