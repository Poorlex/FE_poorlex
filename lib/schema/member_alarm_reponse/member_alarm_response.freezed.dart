// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_alarm_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemberAlarmResponse _$MemberAlarmResponseFromJson(Map<String, dynamic> json) {
  return _MemberAlarmResponse.fromJson(json);
}

/// @nodoc
mixin _$MemberAlarmResponse {
  int get alarmId => throw _privateConstructorUsedError;
  String get friendName => throw _privateConstructorUsedError;
  String get battleName => throw _privateConstructorUsedError;
  String get alarmType => throw _privateConstructorUsedError;
  int get minutePassed => throw _privateConstructorUsedError;
  int get hourPassed => throw _privateConstructorUsedError;
  int get dayPassed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberAlarmResponseCopyWith<MemberAlarmResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberAlarmResponseCopyWith<$Res> {
  factory $MemberAlarmResponseCopyWith(
          MemberAlarmResponse value, $Res Function(MemberAlarmResponse) then) =
      _$MemberAlarmResponseCopyWithImpl<$Res, MemberAlarmResponse>;
  @useResult
  $Res call(
      {int alarmId,
      String friendName,
      String battleName,
      String alarmType,
      int minutePassed,
      int hourPassed,
      int dayPassed});
}

/// @nodoc
class _$MemberAlarmResponseCopyWithImpl<$Res, $Val extends MemberAlarmResponse>
    implements $MemberAlarmResponseCopyWith<$Res> {
  _$MemberAlarmResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alarmId = null,
    Object? friendName = null,
    Object? battleName = null,
    Object? alarmType = null,
    Object? minutePassed = null,
    Object? hourPassed = null,
    Object? dayPassed = null,
  }) {
    return _then(_value.copyWith(
      alarmId: null == alarmId
          ? _value.alarmId
          : alarmId // ignore: cast_nullable_to_non_nullable
              as int,
      friendName: null == friendName
          ? _value.friendName
          : friendName // ignore: cast_nullable_to_non_nullable
              as String,
      battleName: null == battleName
          ? _value.battleName
          : battleName // ignore: cast_nullable_to_non_nullable
              as String,
      alarmType: null == alarmType
          ? _value.alarmType
          : alarmType // ignore: cast_nullable_to_non_nullable
              as String,
      minutePassed: null == minutePassed
          ? _value.minutePassed
          : minutePassed // ignore: cast_nullable_to_non_nullable
              as int,
      hourPassed: null == hourPassed
          ? _value.hourPassed
          : hourPassed // ignore: cast_nullable_to_non_nullable
              as int,
      dayPassed: null == dayPassed
          ? _value.dayPassed
          : dayPassed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberAlarmResponseImplCopyWith<$Res>
    implements $MemberAlarmResponseCopyWith<$Res> {
  factory _$$MemberAlarmResponseImplCopyWith(_$MemberAlarmResponseImpl value,
          $Res Function(_$MemberAlarmResponseImpl) then) =
      __$$MemberAlarmResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int alarmId,
      String friendName,
      String battleName,
      String alarmType,
      int minutePassed,
      int hourPassed,
      int dayPassed});
}

/// @nodoc
class __$$MemberAlarmResponseImplCopyWithImpl<$Res>
    extends _$MemberAlarmResponseCopyWithImpl<$Res, _$MemberAlarmResponseImpl>
    implements _$$MemberAlarmResponseImplCopyWith<$Res> {
  __$$MemberAlarmResponseImplCopyWithImpl(_$MemberAlarmResponseImpl _value,
      $Res Function(_$MemberAlarmResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alarmId = null,
    Object? friendName = null,
    Object? battleName = null,
    Object? alarmType = null,
    Object? minutePassed = null,
    Object? hourPassed = null,
    Object? dayPassed = null,
  }) {
    return _then(_$MemberAlarmResponseImpl(
      alarmId: null == alarmId
          ? _value.alarmId
          : alarmId // ignore: cast_nullable_to_non_nullable
              as int,
      friendName: null == friendName
          ? _value.friendName
          : friendName // ignore: cast_nullable_to_non_nullable
              as String,
      battleName: null == battleName
          ? _value.battleName
          : battleName // ignore: cast_nullable_to_non_nullable
              as String,
      alarmType: null == alarmType
          ? _value.alarmType
          : alarmType // ignore: cast_nullable_to_non_nullable
              as String,
      minutePassed: null == minutePassed
          ? _value.minutePassed
          : minutePassed // ignore: cast_nullable_to_non_nullable
              as int,
      hourPassed: null == hourPassed
          ? _value.hourPassed
          : hourPassed // ignore: cast_nullable_to_non_nullable
              as int,
      dayPassed: null == dayPassed
          ? _value.dayPassed
          : dayPassed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberAlarmResponseImpl implements _MemberAlarmResponse {
  const _$MemberAlarmResponseImpl(
      {required this.alarmId,
      required this.friendName,
      required this.battleName,
      required this.alarmType,
      required this.minutePassed,
      required this.hourPassed,
      required this.dayPassed});

  factory _$MemberAlarmResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberAlarmResponseImplFromJson(json);

  @override
  final int alarmId;
  @override
  final String friendName;
  @override
  final String battleName;
  @override
  final String alarmType;
  @override
  final int minutePassed;
  @override
  final int hourPassed;
  @override
  final int dayPassed;

  @override
  String toString() {
    return 'MemberAlarmResponse(alarmId: $alarmId, friendName: $friendName, battleName: $battleName, alarmType: $alarmType, minutePassed: $minutePassed, hourPassed: $hourPassed, dayPassed: $dayPassed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberAlarmResponseImpl &&
            (identical(other.alarmId, alarmId) || other.alarmId == alarmId) &&
            (identical(other.friendName, friendName) ||
                other.friendName == friendName) &&
            (identical(other.battleName, battleName) ||
                other.battleName == battleName) &&
            (identical(other.alarmType, alarmType) ||
                other.alarmType == alarmType) &&
            (identical(other.minutePassed, minutePassed) ||
                other.minutePassed == minutePassed) &&
            (identical(other.hourPassed, hourPassed) ||
                other.hourPassed == hourPassed) &&
            (identical(other.dayPassed, dayPassed) ||
                other.dayPassed == dayPassed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, alarmId, friendName, battleName,
      alarmType, minutePassed, hourPassed, dayPassed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberAlarmResponseImplCopyWith<_$MemberAlarmResponseImpl> get copyWith =>
      __$$MemberAlarmResponseImplCopyWithImpl<_$MemberAlarmResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberAlarmResponseImplToJson(
      this,
    );
  }
}

abstract class _MemberAlarmResponse implements MemberAlarmResponse {
  const factory _MemberAlarmResponse(
      {required final int alarmId,
      required final String friendName,
      required final String battleName,
      required final String alarmType,
      required final int minutePassed,
      required final int hourPassed,
      required final int dayPassed}) = _$MemberAlarmResponseImpl;

  factory _MemberAlarmResponse.fromJson(Map<String, dynamic> json) =
      _$MemberAlarmResponseImpl.fromJson;

  @override
  int get alarmId;
  @override
  String get friendName;
  @override
  String get battleName;
  @override
  String get alarmType;
  @override
  int get minutePassed;
  @override
  int get hourPassed;
  @override
  int get dayPassed;
  @override
  @JsonKey(ignore: true)
  _$$MemberAlarmResponseImplCopyWith<_$MemberAlarmResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
