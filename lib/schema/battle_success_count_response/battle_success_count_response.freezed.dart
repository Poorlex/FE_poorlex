// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_success_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BattleSuccessCountResponse _$BattleSuccessCountResponseFromJson(
    Map<String, dynamic> json) {
  return _BattleSuccessCountResponse.fromJson(json);
}

/// @nodoc
mixin _$BattleSuccessCountResponse {
  int get totalBattleSuccessCount => throw _privateConstructorUsedError;
  int get hardBattleSuccessCount => throw _privateConstructorUsedError;
  int get normalBattleSuccessCount => throw _privateConstructorUsedError;
  int get easyBattleSuccessCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BattleSuccessCountResponseCopyWith<BattleSuccessCountResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleSuccessCountResponseCopyWith<$Res> {
  factory $BattleSuccessCountResponseCopyWith(BattleSuccessCountResponse value,
          $Res Function(BattleSuccessCountResponse) then) =
      _$BattleSuccessCountResponseCopyWithImpl<$Res,
          BattleSuccessCountResponse>;
  @useResult
  $Res call(
      {int totalBattleSuccessCount,
      int hardBattleSuccessCount,
      int normalBattleSuccessCount,
      int easyBattleSuccessCount});
}

/// @nodoc
class _$BattleSuccessCountResponseCopyWithImpl<$Res,
        $Val extends BattleSuccessCountResponse>
    implements $BattleSuccessCountResponseCopyWith<$Res> {
  _$BattleSuccessCountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBattleSuccessCount = null,
    Object? hardBattleSuccessCount = null,
    Object? normalBattleSuccessCount = null,
    Object? easyBattleSuccessCount = null,
  }) {
    return _then(_value.copyWith(
      totalBattleSuccessCount: null == totalBattleSuccessCount
          ? _value.totalBattleSuccessCount
          : totalBattleSuccessCount // ignore: cast_nullable_to_non_nullable
              as int,
      hardBattleSuccessCount: null == hardBattleSuccessCount
          ? _value.hardBattleSuccessCount
          : hardBattleSuccessCount // ignore: cast_nullable_to_non_nullable
              as int,
      normalBattleSuccessCount: null == normalBattleSuccessCount
          ? _value.normalBattleSuccessCount
          : normalBattleSuccessCount // ignore: cast_nullable_to_non_nullable
              as int,
      easyBattleSuccessCount: null == easyBattleSuccessCount
          ? _value.easyBattleSuccessCount
          : easyBattleSuccessCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BattleSuccessCountResponseImplCopyWith<$Res>
    implements $BattleSuccessCountResponseCopyWith<$Res> {
  factory _$$BattleSuccessCountResponseImplCopyWith(
          _$BattleSuccessCountResponseImpl value,
          $Res Function(_$BattleSuccessCountResponseImpl) then) =
      __$$BattleSuccessCountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalBattleSuccessCount,
      int hardBattleSuccessCount,
      int normalBattleSuccessCount,
      int easyBattleSuccessCount});
}

/// @nodoc
class __$$BattleSuccessCountResponseImplCopyWithImpl<$Res>
    extends _$BattleSuccessCountResponseCopyWithImpl<$Res,
        _$BattleSuccessCountResponseImpl>
    implements _$$BattleSuccessCountResponseImplCopyWith<$Res> {
  __$$BattleSuccessCountResponseImplCopyWithImpl(
      _$BattleSuccessCountResponseImpl _value,
      $Res Function(_$BattleSuccessCountResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBattleSuccessCount = null,
    Object? hardBattleSuccessCount = null,
    Object? normalBattleSuccessCount = null,
    Object? easyBattleSuccessCount = null,
  }) {
    return _then(_$BattleSuccessCountResponseImpl(
      totalBattleSuccessCount: null == totalBattleSuccessCount
          ? _value.totalBattleSuccessCount
          : totalBattleSuccessCount // ignore: cast_nullable_to_non_nullable
              as int,
      hardBattleSuccessCount: null == hardBattleSuccessCount
          ? _value.hardBattleSuccessCount
          : hardBattleSuccessCount // ignore: cast_nullable_to_non_nullable
              as int,
      normalBattleSuccessCount: null == normalBattleSuccessCount
          ? _value.normalBattleSuccessCount
          : normalBattleSuccessCount // ignore: cast_nullable_to_non_nullable
              as int,
      easyBattleSuccessCount: null == easyBattleSuccessCount
          ? _value.easyBattleSuccessCount
          : easyBattleSuccessCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BattleSuccessCountResponseImpl implements _BattleSuccessCountResponse {
  const _$BattleSuccessCountResponseImpl(
      {required this.totalBattleSuccessCount,
      required this.hardBattleSuccessCount,
      required this.normalBattleSuccessCount,
      required this.easyBattleSuccessCount});

  factory _$BattleSuccessCountResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BattleSuccessCountResponseImplFromJson(json);

  @override
  final int totalBattleSuccessCount;
  @override
  final int hardBattleSuccessCount;
  @override
  final int normalBattleSuccessCount;
  @override
  final int easyBattleSuccessCount;

  @override
  String toString() {
    return 'BattleSuccessCountResponse(totalBattleSuccessCount: $totalBattleSuccessCount, hardBattleSuccessCount: $hardBattleSuccessCount, normalBattleSuccessCount: $normalBattleSuccessCount, easyBattleSuccessCount: $easyBattleSuccessCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleSuccessCountResponseImpl &&
            (identical(
                    other.totalBattleSuccessCount, totalBattleSuccessCount) ||
                other.totalBattleSuccessCount == totalBattleSuccessCount) &&
            (identical(other.hardBattleSuccessCount, hardBattleSuccessCount) ||
                other.hardBattleSuccessCount == hardBattleSuccessCount) &&
            (identical(
                    other.normalBattleSuccessCount, normalBattleSuccessCount) ||
                other.normalBattleSuccessCount == normalBattleSuccessCount) &&
            (identical(other.easyBattleSuccessCount, easyBattleSuccessCount) ||
                other.easyBattleSuccessCount == easyBattleSuccessCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalBattleSuccessCount,
      hardBattleSuccessCount, normalBattleSuccessCount, easyBattleSuccessCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleSuccessCountResponseImplCopyWith<_$BattleSuccessCountResponseImpl>
      get copyWith => __$$BattleSuccessCountResponseImplCopyWithImpl<
          _$BattleSuccessCountResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BattleSuccessCountResponseImplToJson(
      this,
    );
  }
}

abstract class _BattleSuccessCountResponse
    implements BattleSuccessCountResponse {
  const factory _BattleSuccessCountResponse(
          {required final int totalBattleSuccessCount,
          required final int hardBattleSuccessCount,
          required final int normalBattleSuccessCount,
          required final int easyBattleSuccessCount}) =
      _$BattleSuccessCountResponseImpl;

  factory _BattleSuccessCountResponse.fromJson(Map<String, dynamic> json) =
      _$BattleSuccessCountResponseImpl.fromJson;

  @override
  int get totalBattleSuccessCount;
  @override
  int get hardBattleSuccessCount;
  @override
  int get normalBattleSuccessCount;
  @override
  int get easyBattleSuccessCount;
  @override
  @JsonKey(ignore: true)
  _$$BattleSuccessCountResponseImplCopyWith<_$BattleSuccessCountResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
