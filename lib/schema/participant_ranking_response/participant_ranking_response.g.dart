// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_ranking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantRankingResponseImpl _$$ParticipantRankingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ParticipantRankingResponseImpl(
      rank: (json['rank'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      nickname: json['nickname'] as String,
      expenditure: (json['expenditure'] as num).toInt(),
      role: json['role'] as String,
    );

Map<String, dynamic> _$$ParticipantRankingResponseImplToJson(
        _$ParticipantRankingResponseImpl instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'level': instance.level,
      'nickname': instance.nickname,
      'expenditure': instance.expenditure,
      'role': instance.role,
    };
