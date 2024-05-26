// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BattleResponseImpl _$$BattleResponseImplFromJson(Map<String, dynamic> json) =>
    _$BattleResponseImpl(
      battleName: json['battleName'] as String,
      battleImageUrl: json['battleImageUrl'] as String,
      maxParticipantSize: (json['maxParticipantSize'] as num).toInt(),
      currentParticipantSize: (json['currentParticipantSize'] as num).toInt(),
      battleBudget: (json['battleBudget'] as num).toInt(),
      battleDDay: (json['battleDDay'] as num).toInt(),
      rankings: (json['rankings'] as List<dynamic>)
          .map((e) =>
              ParticipantRankingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BattleResponseImplToJson(
        _$BattleResponseImpl instance) =>
    <String, dynamic>{
      'battleName': instance.battleName,
      'battleImageUrl': instance.battleImageUrl,
      'maxParticipantSize': instance.maxParticipantSize,
      'currentParticipantSize': instance.currentParticipantSize,
      'battleBudget': instance.battleBudget,
      'battleDDay': instance.battleDDay,
      'rankings': instance.rankings,
    };
