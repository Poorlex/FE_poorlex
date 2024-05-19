// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_complete_battle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberCompleteBattleResponseImpl _$$MemberCompleteBattleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MemberCompleteBattleResponseImpl(
      battleId: (json['battleId'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      difficulty: json['difficulty'] as String,
      pastDay: (json['pastDay'] as num).toInt(),
      budgetLeft: (json['budgetLeft'] as num).toInt(),
      currentParticipantRank: (json['currentParticipantRank'] as num).toInt(),
      battleParticipantCount: (json['battleParticipantCount'] as num).toInt(),
      earnedPoint: (json['earnedPoint'] as num).toInt(),
    );

Map<String, dynamic> _$$MemberCompleteBattleResponseImplToJson(
        _$MemberCompleteBattleResponseImpl instance) =>
    <String, dynamic>{
      'battleId': instance.battleId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'difficulty': instance.difficulty,
      'pastDay': instance.pastDay,
      'budgetLeft': instance.budgetLeft,
      'currentParticipantRank': instance.currentParticipantRank,
      'battleParticipantCount': instance.battleParticipantCount,
      'earnedPoint': instance.earnedPoint,
    };
