// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_ranking_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParticipantRankingResponse _$ParticipantRankingResponseFromJson(
    Map<String, dynamic> json) {
  return _ParticipantRankingResponse.fromJson(json);
}

/// @nodoc
mixin _$ParticipantRankingResponse {
  int get rank => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  int get expenditure => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantRankingResponseCopyWith<ParticipantRankingResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantRankingResponseCopyWith<$Res> {
  factory $ParticipantRankingResponseCopyWith(ParticipantRankingResponse value,
          $Res Function(ParticipantRankingResponse) then) =
      _$ParticipantRankingResponseCopyWithImpl<$Res,
          ParticipantRankingResponse>;
  @useResult
  $Res call(
      {int rank, int level, String nickname, int expenditure, String role});
}

/// @nodoc
class _$ParticipantRankingResponseCopyWithImpl<$Res,
        $Val extends ParticipantRankingResponse>
    implements $ParticipantRankingResponseCopyWith<$Res> {
  _$ParticipantRankingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? level = null,
    Object? nickname = null,
    Object? expenditure = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      expenditure: null == expenditure
          ? _value.expenditure
          : expenditure // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParticipantRankingResponseImplCopyWith<$Res>
    implements $ParticipantRankingResponseCopyWith<$Res> {
  factory _$$ParticipantRankingResponseImplCopyWith(
          _$ParticipantRankingResponseImpl value,
          $Res Function(_$ParticipantRankingResponseImpl) then) =
      __$$ParticipantRankingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int rank, int level, String nickname, int expenditure, String role});
}

/// @nodoc
class __$$ParticipantRankingResponseImplCopyWithImpl<$Res>
    extends _$ParticipantRankingResponseCopyWithImpl<$Res,
        _$ParticipantRankingResponseImpl>
    implements _$$ParticipantRankingResponseImplCopyWith<$Res> {
  __$$ParticipantRankingResponseImplCopyWithImpl(
      _$ParticipantRankingResponseImpl _value,
      $Res Function(_$ParticipantRankingResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? level = null,
    Object? nickname = null,
    Object? expenditure = null,
    Object? role = null,
  }) {
    return _then(_$ParticipantRankingResponseImpl(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      expenditure: null == expenditure
          ? _value.expenditure
          : expenditure // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantRankingResponseImpl implements _ParticipantRankingResponse {
  const _$ParticipantRankingResponseImpl(
      {required this.rank,
      required this.level,
      required this.nickname,
      required this.expenditure,
      required this.role});

  factory _$ParticipantRankingResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ParticipantRankingResponseImplFromJson(json);

  @override
  final int rank;
  @override
  final int level;
  @override
  final String nickname;
  @override
  final int expenditure;
  @override
  final String role;

  @override
  String toString() {
    return 'ParticipantRankingResponse(rank: $rank, level: $level, nickname: $nickname, expenditure: $expenditure, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantRankingResponseImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.expenditure, expenditure) ||
                other.expenditure == expenditure) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rank, level, nickname, expenditure, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantRankingResponseImplCopyWith<_$ParticipantRankingResponseImpl>
      get copyWith => __$$ParticipantRankingResponseImplCopyWithImpl<
          _$ParticipantRankingResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantRankingResponseImplToJson(
      this,
    );
  }
}

abstract class _ParticipantRankingResponse
    implements ParticipantRankingResponse {
  const factory _ParticipantRankingResponse(
      {required final int rank,
      required final int level,
      required final String nickname,
      required final int expenditure,
      required final String role}) = _$ParticipantRankingResponseImpl;

  factory _ParticipantRankingResponse.fromJson(Map<String, dynamic> json) =
      _$ParticipantRankingResponseImpl.fromJson;

  @override
  int get rank;
  @override
  int get level;
  @override
  String get nickname;
  @override
  int get expenditure;
  @override
  String get role;
  @override
  @JsonKey(ignore: true)
  _$$ParticipantRankingResponseImplCopyWith<_$ParticipantRankingResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
