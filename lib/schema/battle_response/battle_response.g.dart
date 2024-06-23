// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BattleResponseImpl _$$BattleResponseImplFromJson(Map<String, dynamic> json) =>
    _$BattleResponseImpl(
      id: (json['id'] as num).toInt(),
      battleName: json['battleName'] as String,
      battleImageUrl: json['battleImageUrl'] as String,
      battleIntroduction: json['battleIntroduction'] as String,
      battleManager: BattleManageResponse.fromJson(
          json['battleManager'] as Map<String, dynamic>),
      maxParticipantSize: (json['maxParticipantSize'] as num).toInt(),
      currentParticipantSize: (json['currentParticipantSize'] as num).toInt(),
      battleBudget: (json['battleBudget'] as num).toInt(),
      battleDDay: (json['battleDDay'] as num).toInt(),
      isParticipating: json['isParticipating'] as bool,
    );

Map<String, dynamic> _$$BattleResponseImplToJson(
        _$BattleResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'battleName': instance.battleName,
      'battleImageUrl': instance.battleImageUrl,
      'battleIntroduction': instance.battleIntroduction,
      'battleManager': instance.battleManager,
      'maxParticipantSize': instance.maxParticipantSize,
      'currentParticipantSize': instance.currentParticipantSize,
      'battleBudget': instance.battleBudget,
      'battleDDay': instance.battleDDay,
      'isParticipating': instance.isParticipating,
    };
