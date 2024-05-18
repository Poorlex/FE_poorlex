// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_success_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BattleSuccessCountResponseImpl _$$BattleSuccessCountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BattleSuccessCountResponseImpl(
      totalBattleSuccessCount: (json['totalBattleSuccessCount'] as num).toInt(),
      hardBattleSuccessCount: (json['hardBattleSuccessCount'] as num).toInt(),
      normalBattleSuccessCount:
          (json['normalBattleSuccessCount'] as num).toInt(),
      easyBattleSuccessCount: (json['easyBattleSuccessCount'] as num).toInt(),
    );

Map<String, dynamic> _$$BattleSuccessCountResponseImplToJson(
        _$BattleSuccessCountResponseImpl instance) =>
    <String, dynamic>{
      'totalBattleSuccessCount': instance.totalBattleSuccessCount,
      'hardBattleSuccessCount': instance.hardBattleSuccessCount,
      'normalBattleSuccessCount': instance.normalBattleSuccessCount,
      'easyBattleSuccessCount': instance.easyBattleSuccessCount,
    };
