// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialLoginModelImpl _$$SocialLoginModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SocialLoginModelImpl(
      code: json['code'] as String,
      socialType: $enumDecode(_$SocialTypeEnumMap, json['socialType']),
    );

Map<String, dynamic> _$$SocialLoginModelImplToJson(
        _$SocialLoginModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'socialType': _$SocialTypeEnumMap[instance.socialType]!,
    };

const _$SocialTypeEnumMap = {
  SocialType.kakao: 'kakao',
  SocialType.apple: 'apple',
};