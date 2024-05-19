// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finding_battle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FindingBattleResponseImpl _$$FindingBattleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FindingBattleResponseImpl(
      battleId: (json['battleId'] as num).toInt(),
      name: json['name'] as String,
      introduction: json['introduction'] as String,
      imageUrl: json['imageUrl'] as String,
      difficulty: json['difficulty'] as String,
      budget: (json['budget'] as num).toInt(),
      currentParticipant: (json['currentParticipant'] as num).toInt(),
      maxParticipantCount: (json['maxParticipantCount'] as num).toInt(),
      rankings: ParticipantRankingResponse.fromJson(
          json['rankings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FindingBattleResponseImplToJson(
        _$FindingBattleResponseImpl instance) =>
    <String, dynamic>{
      'battleId': instance.battleId,
      'name': instance.name,
      'introduction': instance.introduction,
      'imageUrl': instance.imageUrl,
      'difficulty': instance.difficulty,
      'budget': instance.budget,
      'currentParticipant': instance.currentParticipant,
      'maxParticipantCount': instance.maxParticipantCount,
      'rankings': instance.rankings,
    };
