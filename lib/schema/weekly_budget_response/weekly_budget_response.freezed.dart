// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_budget_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeeklyBudgetResponse _$WeeklyBudgetResponseFromJson(Map<String, dynamic> json) {
  return _WeeklyBudgetResponse.fromJson(json);
}

/// @nodoc
mixin _$WeeklyBudgetResponse {
  bool get exist => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeeklyBudgetResponseCopyWith<WeeklyBudgetResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyBudgetResponseCopyWith<$Res> {
  factory $WeeklyBudgetResponseCopyWith(WeeklyBudgetResponse value,
          $Res Function(WeeklyBudgetResponse) then) =
      _$WeeklyBudgetResponseCopyWithImpl<$Res, WeeklyBudgetResponse>;
  @useResult
  $Res call({bool exist, int amount});
}

/// @nodoc
class _$WeeklyBudgetResponseCopyWithImpl<$Res,
        $Val extends WeeklyBudgetResponse>
    implements $WeeklyBudgetResponseCopyWith<$Res> {
  _$WeeklyBudgetResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exist = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      exist: null == exist
          ? _value.exist
          : exist // ignore: cast_nullable_to_non_nullable
              as bool,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyBudgetResponseImplCopyWith<$Res>
    implements $WeeklyBudgetResponseCopyWith<$Res> {
  factory _$$WeeklyBudgetResponseImplCopyWith(_$WeeklyBudgetResponseImpl value,
          $Res Function(_$WeeklyBudgetResponseImpl) then) =
      __$$WeeklyBudgetResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool exist, int amount});
}

/// @nodoc
class __$$WeeklyBudgetResponseImplCopyWithImpl<$Res>
    extends _$WeeklyBudgetResponseCopyWithImpl<$Res, _$WeeklyBudgetResponseImpl>
    implements _$$WeeklyBudgetResponseImplCopyWith<$Res> {
  __$$WeeklyBudgetResponseImplCopyWithImpl(_$WeeklyBudgetResponseImpl _value,
      $Res Function(_$WeeklyBudgetResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exist = null,
    Object? amount = null,
  }) {
    return _then(_$WeeklyBudgetResponseImpl(
      exist: null == exist
          ? _value.exist
          : exist // ignore: cast_nullable_to_non_nullable
              as bool,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyBudgetResponseImpl implements _WeeklyBudgetResponse {
  const _$WeeklyBudgetResponseImpl({required this.exist, required this.amount});

  factory _$WeeklyBudgetResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyBudgetResponseImplFromJson(json);

  @override
  final bool exist;
  @override
  final int amount;

  @override
  String toString() {
    return 'WeeklyBudgetResponse(exist: $exist, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyBudgetResponseImpl &&
            (identical(other.exist, exist) || other.exist == exist) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, exist, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyBudgetResponseImplCopyWith<_$WeeklyBudgetResponseImpl>
      get copyWith =>
          __$$WeeklyBudgetResponseImplCopyWithImpl<_$WeeklyBudgetResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyBudgetResponseImplToJson(
      this,
    );
  }
}

abstract class _WeeklyBudgetResponse implements WeeklyBudgetResponse {
  const factory _WeeklyBudgetResponse(
      {required final bool exist,
      required final int amount}) = _$WeeklyBudgetResponseImpl;

  factory _WeeklyBudgetResponse.fromJson(Map<String, dynamic> json) =
      _$WeeklyBudgetResponseImpl.fromJson;

  @override
  bool get exist;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$WeeklyBudgetResponseImplCopyWith<_$WeeklyBudgetResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
