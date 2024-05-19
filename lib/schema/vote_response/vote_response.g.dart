// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoteResponseImpl _$$VoteResponseImplFromJson(Map<String, dynamic> json) =>
    _$VoteResponseImpl(
      alarmType: json['alarmType'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      alarmId: (json['alarmId'] as num?)?.toInt(),
      memberId: (json['memberId'] as num?)?.toInt(),
      voteAmount: (json['voteAmount'] as num?)?.toInt(),
      agree: json['agree'] as bool?,
      voteMakerNickname: json['voteMakerNickname'] as String?,
      voteName: json['voteName'] as String?,
      voteStatus: json['voteStatus'] as String?,
      voteAgreeCount: (json['voteAgreeCount'] as num?)?.toInt(),
      voteId: (json['voteId'] as num?)?.toInt(),
      voteDisagreeCount: (json['voteDisagreeCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VoteResponseImplToJson(_$VoteResponseImpl instance) =>
    <String, dynamic>{
      'alarmType': instance.alarmType,
      'createdAt': instance.createdAt.toIso8601String(),
      'alarmId': instance.alarmId,
      'memberId': instance.memberId,
      'voteAmount': instance.voteAmount,
      'agree': instance.agree,
      'voteMakerNickname': instance.voteMakerNickname,
      'voteName': instance.voteName,
      'voteStatus': instance.voteStatus,
      'voteAgreeCount': instance.voteAgreeCount,
      'voteId': instance.voteId,
      'voteDisagreeCount': instance.voteDisagreeCount,
    };
