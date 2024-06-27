// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenditure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenditureResponseImpl _$$ExpenditureResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenditureResponseImpl(
      id: (json['id'] as num).toInt(),
      date: json['date'] as String,
      memberId: (json['memberId'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      description: json['description'] as String,
      mainImageUrl: json['mainImageUrl'] as String,
      subImageUrl: json['subImageUrl'] as String?,
    );

Map<String, dynamic> _$$ExpenditureResponseImplToJson(
        _$ExpenditureResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'memberId': instance.memberId,
      'amount': instance.amount,
      'description': instance.description,
      'mainImageUrl': instance.mainImageUrl,
      'subImageUrl': instance.subImageUrl,
    };
