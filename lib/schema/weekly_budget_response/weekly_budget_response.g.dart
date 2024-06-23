// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_budget_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyBudgetResponseImpl _$$WeeklyBudgetResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyBudgetResponseImpl(
      exist: json['exist'] as bool,
      amount: (json['amount'] as num).toInt(),
      daysBeforeEnd: (json['daysBeforeEnd'] as num).toInt(),
    );

Map<String, dynamic> _$$WeeklyBudgetResponseImplToJson(
        _$WeeklyBudgetResponseImpl instance) =>
    <String, dynamic>{
      'exist': instance.exist,
      'amount': instance.amount,
      'daysBeforeEnd': instance.daysBeforeEnd,
    };
