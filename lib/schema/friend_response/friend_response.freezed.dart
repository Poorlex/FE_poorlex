// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FriendResponse _$FriendResponseFromJson(Map<String, dynamic> json) {
  return _FriendResponse.fromJson(json);
}

/// @nodoc
mixin _$FriendResponse {
  int get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  int get weeklyExpenditure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendResponseCopyWith<FriendResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendResponseCopyWith<$Res> {
  factory $FriendResponseCopyWith(
          FriendResponse value, $Res Function(FriendResponse) then) =
      _$FriendResponseCopyWithImpl<$Res, FriendResponse>;
  @useResult
  $Res call({int id, String nickname, int weeklyExpenditure});
}

/// @nodoc
class _$FriendResponseCopyWithImpl<$Res, $Val extends FriendResponse>
    implements $FriendResponseCopyWith<$Res> {
  _$FriendResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? weeklyExpenditure = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      weeklyExpenditure: null == weeklyExpenditure
          ? _value.weeklyExpenditure
          : weeklyExpenditure // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendResponseImplCopyWith<$Res>
    implements $FriendResponseCopyWith<$Res> {
  factory _$$FriendResponseImplCopyWith(_$FriendResponseImpl value,
          $Res Function(_$FriendResponseImpl) then) =
      __$$FriendResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String nickname, int weeklyExpenditure});
}

/// @nodoc
class __$$FriendResponseImplCopyWithImpl<$Res>
    extends _$FriendResponseCopyWithImpl<$Res, _$FriendResponseImpl>
    implements _$$FriendResponseImplCopyWith<$Res> {
  __$$FriendResponseImplCopyWithImpl(
      _$FriendResponseImpl _value, $Res Function(_$FriendResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? weeklyExpenditure = null,
  }) {
    return _then(_$FriendResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      weeklyExpenditure: null == weeklyExpenditure
          ? _value.weeklyExpenditure
          : weeklyExpenditure // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendResponseImpl implements _FriendResponse {
  const _$FriendResponseImpl(
      {required this.id,
      required this.nickname,
      required this.weeklyExpenditure});

  factory _$FriendResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String nickname;
  @override
  final int weeklyExpenditure;

  @override
  String toString() {
    return 'FriendResponse(id: $id, nickname: $nickname, weeklyExpenditure: $weeklyExpenditure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.weeklyExpenditure, weeklyExpenditure) ||
                other.weeklyExpenditure == weeklyExpenditure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nickname, weeklyExpenditure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendResponseImplCopyWith<_$FriendResponseImpl> get copyWith =>
      __$$FriendResponseImplCopyWithImpl<_$FriendResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendResponseImplToJson(
      this,
    );
  }
}

abstract class _FriendResponse implements FriendResponse {
  const factory _FriendResponse(
      {required final int id,
      required final String nickname,
      required final int weeklyExpenditure}) = _$FriendResponseImpl;

  factory _FriendResponse.fromJson(Map<String, dynamic> json) =
      _$FriendResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get nickname;
  @override
  int get weeklyExpenditure;
  @override
  @JsonKey(ignore: true)
  _$$FriendResponseImplCopyWith<_$FriendResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
