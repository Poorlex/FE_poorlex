// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_page_level_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyPageLevelInfoResponseImpl _$$MyPageLevelInfoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MyPageLevelInfoResponseImpl(
      level: (json['level'] as num).toInt(),
      point: (json['point'] as num).toInt(),
      pointLeftForLevelUp: (json['pointLeftForLevelUp'] as num).toInt(),
    );

Map<String, dynamic> _$$MyPageLevelInfoResponseImplToJson(
        _$MyPageLevelInfoResponseImpl instance) =>
    <String, dynamic>{
      'level': instance.level,
      'point': instance.point,
      'pointLeftForLevelUp': instance.pointLeftForLevelUp,
    };
