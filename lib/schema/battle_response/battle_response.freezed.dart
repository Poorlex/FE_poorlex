// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BattleResponse _$BattleResponseFromJson(Map<String, dynamic> json) {
  return _BattleResponse.fromJson(json);
}

/// @nodoc
mixin _$BattleResponse {
  String get battleName => throw _privateConstructorUsedError;
  String get battleImageUrl => throw _privateConstructorUsedError;
  String get battleIntroduction => throw _privateConstructorUsedError;
  BattleManageResponse get battleManager => throw _privateConstructorUsedError;
  int get maxParticipantSize => throw _privateConstructorUsedError;
  int get currentParticipantSize => throw _privateConstructorUsedError;
  int get battleBudget => throw _privateConstructorUsedError;
  int get battleDDay => throw _privateConstructorUsedError;
  bool get isParticipating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BattleResponseCopyWith<BattleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleResponseCopyWith<$Res> {
  factory $BattleResponseCopyWith(
          BattleResponse value, $Res Function(BattleResponse) then) =
      _$BattleResponseCopyWithImpl<$Res, BattleResponse>;
  @useResult
  $Res call(
      {String battleName,
      String battleImageUrl,
      String battleIntroduction,
      BattleManageResponse battleManager,
      int maxParticipantSize,
      int currentParticipantSize,
      int battleBudget,
      int battleDDay,
      bool isParticipating});

  $BattleManageResponseCopyWith<$Res> get battleManager;
}

/// @nodoc
class _$BattleResponseCopyWithImpl<$Res, $Val extends BattleResponse>
    implements $BattleResponseCopyWith<$Res> {
  _$BattleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battleName = null,
    Object? battleImageUrl = null,
    Object? battleIntroduction = null,
    Object? battleManager = null,
    Object? maxParticipantSize = null,
    Object? currentParticipantSize = null,
    Object? battleBudget = null,
    Object? battleDDay = null,
    Object? isParticipating = null,
  }) {
    return _then(_value.copyWith(
      battleName: null == battleName
          ? _value.battleName
          : battleName // ignore: cast_nullable_to_non_nullable
              as String,
      battleImageUrl: null == battleImageUrl
          ? _value.battleImageUrl
          : battleImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      battleIntroduction: null == battleIntroduction
          ? _value.battleIntroduction
          : battleIntroduction // ignore: cast_nullable_to_non_nullable
              as String,
      battleManager: null == battleManager
          ? _value.battleManager
          : battleManager // ignore: cast_nullable_to_non_nullable
              as BattleManageResponse,
      maxParticipantSize: null == maxParticipantSize
          ? _value.maxParticipantSize
          : maxParticipantSize // ignore: cast_nullable_to_non_nullable
              as int,
      currentParticipantSize: null == currentParticipantSize
          ? _value.currentParticipantSize
          : currentParticipantSize // ignore: cast_nullable_to_non_nullable
              as int,
      battleBudget: null == battleBudget
          ? _value.battleBudget
          : battleBudget // ignore: cast_nullable_to_non_nullable
              as int,
      battleDDay: null == battleDDay
          ? _value.battleDDay
          : battleDDay // ignore: cast_nullable_to_non_nullable
              as int,
      isParticipating: null == isParticipating
          ? _value.isParticipating
          : isParticipating // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BattleManageResponseCopyWith<$Res> get battleManager {
    return $BattleManageResponseCopyWith<$Res>(_value.battleManager, (value) {
      return _then(_value.copyWith(battleManager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BattleResponseImplCopyWith<$Res>
    implements $BattleResponseCopyWith<$Res> {
  factory _$$BattleResponseImplCopyWith(_$BattleResponseImpl value,
          $Res Function(_$BattleResponseImpl) then) =
      __$$BattleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String battleName,
      String battleImageUrl,
      String battleIntroduction,
      BattleManageResponse battleManager,
      int maxParticipantSize,
      int currentParticipantSize,
      int battleBudget,
      int battleDDay,
      bool isParticipating});

  @override
  $BattleManageResponseCopyWith<$Res> get battleManager;
}

/// @nodoc
class __$$BattleResponseImplCopyWithImpl<$Res>
    extends _$BattleResponseCopyWithImpl<$Res, _$BattleResponseImpl>
    implements _$$BattleResponseImplCopyWith<$Res> {
  __$$BattleResponseImplCopyWithImpl(
      _$BattleResponseImpl _value, $Res Function(_$BattleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battleName = null,
    Object? battleImageUrl = null,
    Object? battleIntroduction = null,
    Object? battleManager = null,
    Object? maxParticipantSize = null,
    Object? currentParticipantSize = null,
    Object? battleBudget = null,
    Object? battleDDay = null,
    Object? isParticipating = null,
  }) {
    return _then(_$BattleResponseImpl(
      battleName: null == battleName
          ? _value.battleName
          : battleName // ignore: cast_nullable_to_non_nullable
              as String,
      battleImageUrl: null == battleImageUrl
          ? _value.battleImageUrl
          : battleImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      battleIntroduction: null == battleIntroduction
          ? _value.battleIntroduction
          : battleIntroduction // ignore: cast_nullable_to_non_nullable
              as String,
      battleManager: null == battleManager
          ? _value.battleManager
          : battleManager // ignore: cast_nullable_to_non_nullable
              as BattleManageResponse,
      maxParticipantSize: null == maxParticipantSize
          ? _value.maxParticipantSize
          : maxParticipantSize // ignore: cast_nullable_to_non_nullable
              as int,
      currentParticipantSize: null == currentParticipantSize
          ? _value.currentParticipantSize
          : currentParticipantSize // ignore: cast_nullable_to_non_nullable
              as int,
      battleBudget: null == battleBudget
          ? _value.battleBudget
          : battleBudget // ignore: cast_nullable_to_non_nullable
              as int,
      battleDDay: null == battleDDay
          ? _value.battleDDay
          : battleDDay // ignore: cast_nullable_to_non_nullable
              as int,
      isParticipating: null == isParticipating
          ? _value.isParticipating
          : isParticipating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BattleResponseImpl implements _BattleResponse {
  const _$BattleResponseImpl(
      {required this.battleName,
      required this.battleImageUrl,
      required this.battleIntroduction,
      required this.battleManager,
      required this.maxParticipantSize,
      required this.currentParticipantSize,
      required this.battleBudget,
      required this.battleDDay,
      required this.isParticipating});

  factory _$BattleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BattleResponseImplFromJson(json);

  @override
  final String battleName;
  @override
  final String battleImageUrl;
  @override
  final String battleIntroduction;
  @override
  final BattleManageResponse battleManager;
  @override
  final int maxParticipantSize;
  @override
  final int currentParticipantSize;
  @override
  final int battleBudget;
  @override
  final int battleDDay;
  @override
  final bool isParticipating;

  @override
  String toString() {
    return 'BattleResponse(battleName: $battleName, battleImageUrl: $battleImageUrl, battleIntroduction: $battleIntroduction, battleManager: $battleManager, maxParticipantSize: $maxParticipantSize, currentParticipantSize: $currentParticipantSize, battleBudget: $battleBudget, battleDDay: $battleDDay, isParticipating: $isParticipating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleResponseImpl &&
            (identical(other.battleName, battleName) ||
                other.battleName == battleName) &&
            (identical(other.battleImageUrl, battleImageUrl) ||
                other.battleImageUrl == battleImageUrl) &&
            (identical(other.battleIntroduction, battleIntroduction) ||
                other.battleIntroduction == battleIntroduction) &&
            (identical(other.battleManager, battleManager) ||
                other.battleManager == battleManager) &&
            (identical(other.maxParticipantSize, maxParticipantSize) ||
                other.maxParticipantSize == maxParticipantSize) &&
            (identical(other.currentParticipantSize, currentParticipantSize) ||
                other.currentParticipantSize == currentParticipantSize) &&
            (identical(other.battleBudget, battleBudget) ||
                other.battleBudget == battleBudget) &&
            (identical(other.battleDDay, battleDDay) ||
                other.battleDDay == battleDDay) &&
            (identical(other.isParticipating, isParticipating) ||
                other.isParticipating == isParticipating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      battleName,
      battleImageUrl,
      battleIntroduction,
      battleManager,
      maxParticipantSize,
      currentParticipantSize,
      battleBudget,
      battleDDay,
      isParticipating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleResponseImplCopyWith<_$BattleResponseImpl> get copyWith =>
      __$$BattleResponseImplCopyWithImpl<_$BattleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BattleResponseImplToJson(
      this,
    );
  }
}

abstract class _BattleResponse implements BattleResponse {
  const factory _BattleResponse(
      {required final String battleName,
      required final String battleImageUrl,
      required final String battleIntroduction,
      required final BattleManageResponse battleManager,
      required final int maxParticipantSize,
      required final int currentParticipantSize,
      required final int battleBudget,
      required final int battleDDay,
      required final bool isParticipating}) = _$BattleResponseImpl;

  factory _BattleResponse.fromJson(Map<String, dynamic> json) =
      _$BattleResponseImpl.fromJson;

  @override
  String get battleName;
  @override
  String get battleImageUrl;
  @override
  String get battleIntroduction;
  @override
  BattleManageResponse get battleManager;
  @override
  int get maxParticipantSize;
  @override
  int get currentParticipantSize;
  @override
  int get battleBudget;
  @override
  int get battleDDay;
  @override
  bool get isParticipating;
  @override
  @JsonKey(ignore: true)
  _$$BattleResponseImplCopyWith<_$BattleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
