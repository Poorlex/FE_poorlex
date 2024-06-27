// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberProfileResponseImpl _$$MemberProfileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MemberProfileResponseImpl(
      nickname: json['nickname'] as String,
      description: json['description'] as String,
      levelInfo: MyPageLevelInfoResponse.fromJson(
          json['levelInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MemberProfileResponseImplToJson(
        _$MemberProfileResponseImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'description': instance.description,
      'levelInfo': instance.levelInfo,
    };
