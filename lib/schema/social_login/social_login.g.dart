// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialLoginModelImpl _$$SocialLoginModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SocialLoginModelImpl(
      providerId: json['providerId'] as String,
      socialType: $enumDecode(_$SocialTypeEnumMap, json['socialType']),
    );

Map<String, dynamic> _$$SocialLoginModelImplToJson(
        _$SocialLoginModelImpl instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'socialType': _$SocialTypeEnumMap[instance.socialType]!,
    };

const _$SocialTypeEnumMap = {
  SocialType.kakao: 'kakao',
  SocialType.apple: 'apple',
};
