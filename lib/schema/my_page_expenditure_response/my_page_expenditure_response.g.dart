// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_page_expenditure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyPageExpenditureResponseImpl _$$MyPageExpenditureResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MyPageExpenditureResponseImpl(
      id: (json['id'] as num).toInt(),
      date: json['date'] as String,
      amount: (json['amount'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$MyPageExpenditureResponseImplToJson(
        _$MyPageExpenditureResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'amount': instance.amount,
      'imageUrl': instance.imageUrl,
    };
