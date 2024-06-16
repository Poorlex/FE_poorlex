// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_manage_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BattleManageResponseImpl _$$BattleManageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BattleManageResponseImpl(
      nickname: json['nickname'] as String,
      level: (json['level'] as num).toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$BattleManageResponseImplToJson(
        _$BattleManageResponseImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'level': instance.level,
      'description': instance.description,
    };
