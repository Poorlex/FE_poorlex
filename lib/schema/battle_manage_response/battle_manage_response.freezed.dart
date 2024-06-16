// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_manage_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BattleManageResponse _$BattleManageResponseFromJson(Map<String, dynamic> json) {
  return _BattleManageResponse.fromJson(json);
}

/// @nodoc
mixin _$BattleManageResponse {
  String get nickname => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BattleManageResponseCopyWith<BattleManageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleManageResponseCopyWith<$Res> {
  factory $BattleManageResponseCopyWith(BattleManageResponse value,
          $Res Function(BattleManageResponse) then) =
      _$BattleManageResponseCopyWithImpl<$Res, BattleManageResponse>;
  @useResult
  $Res call({String nickname, int level, String? description});
}

/// @nodoc
class _$BattleManageResponseCopyWithImpl<$Res,
        $Val extends BattleManageResponse>
    implements $BattleManageResponseCopyWith<$Res> {
  _$BattleManageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? level = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BattleManageResponseImplCopyWith<$Res>
    implements $BattleManageResponseCopyWith<$Res> {
  factory _$$BattleManageResponseImplCopyWith(_$BattleManageResponseImpl value,
          $Res Function(_$BattleManageResponseImpl) then) =
      __$$BattleManageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickname, int level, String? description});
}

/// @nodoc
class __$$BattleManageResponseImplCopyWithImpl<$Res>
    extends _$BattleManageResponseCopyWithImpl<$Res, _$BattleManageResponseImpl>
    implements _$$BattleManageResponseImplCopyWith<$Res> {
  __$$BattleManageResponseImplCopyWithImpl(_$BattleManageResponseImpl _value,
      $Res Function(_$BattleManageResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? level = null,
    Object? description = freezed,
  }) {
    return _then(_$BattleManageResponseImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BattleManageResponseImpl implements _BattleManageResponse {
  _$BattleManageResponseImpl(
      {required this.nickname, required this.level, this.description});

  factory _$BattleManageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BattleManageResponseImplFromJson(json);

  @override
  final String nickname;
  @override
  final int level;
  @override
  final String? description;

  @override
  String toString() {
    return 'BattleManageResponse(nickname: $nickname, level: $level, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleManageResponseImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nickname, level, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleManageResponseImplCopyWith<_$BattleManageResponseImpl>
      get copyWith =>
          __$$BattleManageResponseImplCopyWithImpl<_$BattleManageResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BattleManageResponseImplToJson(
      this,
    );
  }
}

abstract class _BattleManageResponse implements BattleManageResponse {
  factory _BattleManageResponse(
      {required final String nickname,
      required final int level,
      final String? description}) = _$BattleManageResponseImpl;

  factory _BattleManageResponse.fromJson(Map<String, dynamic> json) =
      _$BattleManageResponseImpl.fromJson;

  @override
  String get nickname;
  @override
  int get level;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$BattleManageResponseImplCopyWith<_$BattleManageResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
