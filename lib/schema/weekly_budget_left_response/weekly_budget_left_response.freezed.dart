// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_budget_left_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeeklyBudgetLeftResponse _$WeeklyBudgetLeftResponseFromJson(
    Map<String, dynamic> json) {
  return _WeeklyBudgetLeftResponse.fromJson(json);
}

/// @nodoc
mixin _$WeeklyBudgetLeftResponse {
  bool get exist => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeeklyBudgetLeftResponseCopyWith<WeeklyBudgetLeftResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyBudgetLeftResponseCopyWith<$Res> {
  factory $WeeklyBudgetLeftResponseCopyWith(WeeklyBudgetLeftResponse value,
          $Res Function(WeeklyBudgetLeftResponse) then) =
      _$WeeklyBudgetLeftResponseCopyWithImpl<$Res, WeeklyBudgetLeftResponse>;
  @useResult
  $Res call({bool exist, int amount});
}

/// @nodoc
class _$WeeklyBudgetLeftResponseCopyWithImpl<$Res,
        $Val extends WeeklyBudgetLeftResponse>
    implements $WeeklyBudgetLeftResponseCopyWith<$Res> {
  _$WeeklyBudgetLeftResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$WeeklyBudgetLeftResponseImplCopyWith<$Res>
    implements $WeeklyBudgetLeftResponseCopyWith<$Res> {
  factory _$$WeeklyBudgetLeftResponseImplCopyWith(
          _$WeeklyBudgetLeftResponseImpl value,
          $Res Function(_$WeeklyBudgetLeftResponseImpl) then) =
      __$$WeeklyBudgetLeftResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool exist, int amount});
}

/// @nodoc
class __$$WeeklyBudgetLeftResponseImplCopyWithImpl<$Res>
    extends _$WeeklyBudgetLeftResponseCopyWithImpl<$Res,
        _$WeeklyBudgetLeftResponseImpl>
    implements _$$WeeklyBudgetLeftResponseImplCopyWith<$Res> {
  __$$WeeklyBudgetLeftResponseImplCopyWithImpl(
      _$WeeklyBudgetLeftResponseImpl _value,
      $Res Function(_$WeeklyBudgetLeftResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exist = null,
    Object? amount = null,
  }) {
    return _then(_$WeeklyBudgetLeftResponseImpl(
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
class _$WeeklyBudgetLeftResponseImpl implements _WeeklyBudgetLeftResponse {
  const _$WeeklyBudgetLeftResponseImpl(
      {required this.exist, required this.amount});

  factory _$WeeklyBudgetLeftResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyBudgetLeftResponseImplFromJson(json);

  @override
  final bool exist;
  @override
  final int amount;

  @override
  String toString() {
    return 'WeeklyBudgetLeftResponse(exist: $exist, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyBudgetLeftResponseImpl &&
            (identical(other.exist, exist) || other.exist == exist) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, exist, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyBudgetLeftResponseImplCopyWith<_$WeeklyBudgetLeftResponseImpl>
      get copyWith => __$$WeeklyBudgetLeftResponseImplCopyWithImpl<
          _$WeeklyBudgetLeftResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyBudgetLeftResponseImplToJson(
      this,
    );
  }
}

abstract class _WeeklyBudgetLeftResponse implements WeeklyBudgetLeftResponse {
  const factory _WeeklyBudgetLeftResponse(
      {required final bool exist,
      required final int amount}) = _$WeeklyBudgetLeftResponseImpl;

  factory _WeeklyBudgetLeftResponse.fromJson(Map<String, dynamic> json) =
      _$WeeklyBudgetLeftResponseImpl.fromJson;

  @override
  bool get exist;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$WeeklyBudgetLeftResponseImplCopyWith<_$WeeklyBudgetLeftResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
