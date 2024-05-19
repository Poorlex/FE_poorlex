// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_progress_battle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberProgressBattleResponseImpl _$$MemberProgressBattleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MemberProgressBattleResponseImpl(
      battleId: (json['battleId'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      difficulty: json['difficulty'] as String,
      budgetLeft: (json['budgetLeft'] as num).toInt(),
      currentParticipantRank: (json['currentParticipantRank'] as num).toInt(),
      battleParticipantCount: (json['battleParticipantCount'] as num).toInt(),
      uncheckedAlarmCount: (json['uncheckedAlarmCount'] as num).toInt(),
      dday: (json['dday'] as num).toInt(),
    );

Map<String, dynamic> _$$MemberProgressBattleResponseImplToJson(
        _$MemberProgressBattleResponseImpl instance) =>
    <String, dynamic>{
      'battleId': instance.battleId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'difficulty': instance.difficulty,
      'budgetLeft': instance.budgetLeft,
      'currentParticipantRank': instance.currentParticipantRank,
      'battleParticipantCount': instance.battleParticipantCount,
      'uncheckedAlarmCount': instance.uncheckedAlarmCount,
      'dday': instance.dday,
    };
