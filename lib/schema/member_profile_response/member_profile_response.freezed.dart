// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemberProfileResponse _$MemberProfileResponseFromJson(
    Map<String, dynamic> json) {
  return _MemberProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$MemberProfileResponse {
  String get nickname => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  MyPageLevelInfoResponse get levelInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberProfileResponseCopyWith<MemberProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberProfileResponseCopyWith<$Res> {
  factory $MemberProfileResponseCopyWith(MemberProfileResponse value,
          $Res Function(MemberProfileResponse) then) =
      _$MemberProfileResponseCopyWithImpl<$Res, MemberProfileResponse>;
  @useResult
  $Res call(
      {String nickname, String description, MyPageLevelInfoResponse levelInfo});

  $MyPageLevelInfoResponseCopyWith<$Res> get levelInfo;
}

/// @nodoc
class _$MemberProfileResponseCopyWithImpl<$Res,
        $Val extends MemberProfileResponse>
    implements $MemberProfileResponseCopyWith<$Res> {
  _$MemberProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? description = null,
    Object? levelInfo = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      levelInfo: null == levelInfo
          ? _value.levelInfo
          : levelInfo // ignore: cast_nullable_to_non_nullable
              as MyPageLevelInfoResponse,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MyPageLevelInfoResponseCopyWith<$Res> get levelInfo {
    return $MyPageLevelInfoResponseCopyWith<$Res>(_value.levelInfo, (value) {
      return _then(_value.copyWith(levelInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MemberProfileResponseImplCopyWith<$Res>
    implements $MemberProfileResponseCopyWith<$Res> {
  factory _$$MemberProfileResponseImplCopyWith(
          _$MemberProfileResponseImpl value,
          $Res Function(_$MemberProfileResponseImpl) then) =
      __$$MemberProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nickname, String description, MyPageLevelInfoResponse levelInfo});

  @override
  $MyPageLevelInfoResponseCopyWith<$Res> get levelInfo;
}

/// @nodoc
class __$$MemberProfileResponseImplCopyWithImpl<$Res>
    extends _$MemberProfileResponseCopyWithImpl<$Res,
        _$MemberProfileResponseImpl>
    implements _$$MemberProfileResponseImplCopyWith<$Res> {
  __$$MemberProfileResponseImplCopyWithImpl(_$MemberProfileResponseImpl _value,
      $Res Function(_$MemberProfileResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? description = null,
    Object? levelInfo = null,
  }) {
    return _then(_$MemberProfileResponseImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      levelInfo: null == levelInfo
          ? _value.levelInfo
          : levelInfo // ignore: cast_nullable_to_non_nullable
              as MyPageLevelInfoResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberProfileResponseImpl implements _MemberProfileResponse {
  _$MemberProfileResponseImpl(
      {required this.nickname,
      required this.description,
      required this.levelInfo});

  factory _$MemberProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberProfileResponseImplFromJson(json);

  @override
  final String nickname;
  @override
  final String description;
  @override
  final MyPageLevelInfoResponse levelInfo;

  @override
  String toString() {
    return 'MemberProfileResponse(nickname: $nickname, description: $description, levelInfo: $levelInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberProfileResponseImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.levelInfo, levelInfo) ||
                other.levelInfo == levelInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nickname, description, levelInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberProfileResponseImplCopyWith<_$MemberProfileResponseImpl>
      get copyWith => __$$MemberProfileResponseImplCopyWithImpl<
          _$MemberProfileResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberProfileResponseImplToJson(
      this,
    );
  }
}

abstract class _MemberProfileResponse implements MemberProfileResponse {
  factory _MemberProfileResponse(
          {required final String nickname,
          required final String description,
          required final MyPageLevelInfoResponse levelInfo}) =
      _$MemberProfileResponseImpl;

  factory _MemberProfileResponse.fromJson(Map<String, dynamic> json) =
      _$MemberProfileResponseImpl.fromJson;

  @override
  String get nickname;
  @override
  String get description;
  @override
  MyPageLevelInfoResponse get levelInfo;
  @override
  @JsonKey(ignore: true)
  _$$MemberProfileResponseImplCopyWith<_$MemberProfileResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
