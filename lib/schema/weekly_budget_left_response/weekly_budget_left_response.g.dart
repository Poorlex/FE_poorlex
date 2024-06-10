// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_budget_left_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyBudgetLeftResponseImpl _$$WeeklyBudgetLeftResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyBudgetLeftResponseImpl(
      exist: json['exist'] as bool,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$$WeeklyBudgetLeftResponseImplToJson(
        _$WeeklyBudgetLeftResponseImpl instance) =>
    <String, dynamic>{
      'exist': instance.exist,
      'amount': instance.amount,
    };
