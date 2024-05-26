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
  int get maxParticipantSize => throw _privateConstructorUsedError;
  int get currentParticipantSize => throw _privateConstructorUsedError;
  int get battleBudget => throw _privateConstructorUsedError;
  int get battleDDay => throw _privateConstructorUsedError;
  List<ParticipantRankingResponse> get rankings =>
      throw _privateConstructorUsedError;

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
      int maxParticipantSize,
      int currentParticipantSize,
      int battleBudget,
      int battleDDay,
      List<ParticipantRankingResponse> rankings});
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
    Object? maxParticipantSize = null,
    Object? currentParticipantSize = null,
    Object? battleBudget = null,
    Object? battleDDay = null,
    Object? rankings = null,
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
      rankings: null == rankings
          ? _value.rankings
          : rankings // ignore: cast_nullable_to_non_nullable
              as List<ParticipantRankingResponse>,
    ) as $Val);
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
      int maxParticipantSize,
      int currentParticipantSize,
      int battleBudget,
      int battleDDay,
      List<ParticipantRankingResponse> rankings});
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
    Object? maxParticipantSize = null,
    Object? currentParticipantSize = null,
    Object? battleBudget = null,
    Object? battleDDay = null,
    Object? rankings = null,
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
      rankings: null == rankings
          ? _value._rankings
          : rankings // ignore: cast_nullable_to_non_nullable
              as List<ParticipantRankingResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BattleResponseImpl implements _BattleResponse {
  const _$BattleResponseImpl(
      {required this.battleName,
      required this.battleImageUrl,
      required this.maxParticipantSize,
      required this.currentParticipantSize,
      required this.battleBudget,
      required this.battleDDay,
      required final List<ParticipantRankingResponse> rankings})
      : _rankings = rankings;

  factory _$BattleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BattleResponseImplFromJson(json);

  @override
  final String battleName;
  @override
  final String battleImageUrl;
  @override
  final int maxParticipantSize;
  @override
  final int currentParticipantSize;
  @override
  final int battleBudget;
  @override
  final int battleDDay;
  final List<ParticipantRankingResponse> _rankings;
  @override
  List<ParticipantRankingResponse> get rankings {
    if (_rankings is EqualUnmodifiableListView) return _rankings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rankings);
  }

  @override
  String toString() {
    return 'BattleResponse(battleName: $battleName, battleImageUrl: $battleImageUrl, maxParticipantSize: $maxParticipantSize, currentParticipantSize: $currentParticipantSize, battleBudget: $battleBudget, battleDDay: $battleDDay, rankings: $rankings)';
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
            (identical(other.maxParticipantSize, maxParticipantSize) ||
                other.maxParticipantSize == maxParticipantSize) &&
            (identical(other.currentParticipantSize, currentParticipantSize) ||
                other.currentParticipantSize == currentParticipantSize) &&
            (identical(other.battleBudget, battleBudget) ||
                other.battleBudget == battleBudget) &&
            (identical(other.battleDDay, battleDDay) ||
                other.battleDDay == battleDDay) &&
            const DeepCollectionEquality().equals(other._rankings, _rankings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      battleName,
      battleImageUrl,
      maxParticipantSize,
      currentParticipantSize,
      battleBudget,
      battleDDay,
      const DeepCollectionEquality().hash(_rankings));

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
          required final int maxParticipantSize,
          required final int currentParticipantSize,
          required final int battleBudget,
          required final int battleDDay,
          required final List<ParticipantRankingResponse> rankings}) =
      _$BattleResponseImpl;

  factory _BattleResponse.fromJson(Map<String, dynamic> json) =
      _$BattleResponseImpl.fromJson;

  @override
  String get battleName;
  @override
  String get battleImageUrl;
  @override
  int get maxParticipantSize;
  @override
  int get currentParticipantSize;
  @override
  int get battleBudget;
  @override
  int get battleDDay;
  @override
  List<ParticipantRankingResponse> get rankings;
  @override
  @JsonKey(ignore: true)
  _$$BattleResponseImplCopyWith<_$BattleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
