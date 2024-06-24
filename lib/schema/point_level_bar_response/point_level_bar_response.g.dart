// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_level_bar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointLevelBarResponseImpl _$$PointLevelBarResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PointLevelBarResponseImpl(
      levelRange: (json['levelRange'] as num).toInt(),
      currentPoint: (json['currentPoint'] as num).toInt(),
      recentPoint: (json['recentPoint'] as num).toInt(),
    );

Map<String, dynamic> _$$PointLevelBarResponseImplToJson(
        _$PointLevelBarResponseImpl instance) =>
    <String, dynamic>{
      'levelRange': instance.levelRange,
      'currentPoint': instance.currentPoint,
      'recentPoint': instance.recentPoint,
    };
