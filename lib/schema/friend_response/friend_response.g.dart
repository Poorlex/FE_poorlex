// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendResponseImpl _$$FriendResponseImplFromJson(Map<String, dynamic> json) =>
    _$FriendResponseImpl(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String,
      weeklyExpenditure: (json['weeklyExpenditure'] as num).toInt(),
    );

Map<String, dynamic> _$$FriendResponseImplToJson(
        _$FriendResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'weeklyExpenditure': instance.weeklyExpenditure,
    };
