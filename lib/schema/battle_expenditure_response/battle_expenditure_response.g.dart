// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_expenditure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BattleExpenditureResponseImpl _$$BattleExpenditureResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BattleExpenditureResponseImpl(
      id: (json['id'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      imageCount: (json['imageCount'] as num).toInt(),
      own: json['own'] as bool,
    );

Map<String, dynamic> _$$BattleExpenditureResponseImplToJson(
        _$BattleExpenditureResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'imageCount': instance.imageCount,
      'own': instance.own,
    };
