// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_page_level_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyPageLevelInfoResponse _$MyPageLevelInfoResponseFromJson(
    Map<String, dynamic> json) {
  return _MyPageLevelInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$MyPageLevelInfoResponse {
  int get level => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  int get pointLeftForLevelUp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyPageLevelInfoResponseCopyWith<MyPageLevelInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageLevelInfoResponseCopyWith<$Res> {
  factory $MyPageLevelInfoResponseCopyWith(MyPageLevelInfoResponse value,
          $Res Function(MyPageLevelInfoResponse) then) =
      _$MyPageLevelInfoResponseCopyWithImpl<$Res, MyPageLevelInfoResponse>;
  @useResult
  $Res call({int level, int point, int pointLeftForLevelUp});
}

/// @nodoc
class _$MyPageLevelInfoResponseCopyWithImpl<$Res,
        $Val extends MyPageLevelInfoResponse>
    implements $MyPageLevelInfoResponseCopyWith<$Res> {
  _$MyPageLevelInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? point = null,
    Object? pointLeftForLevelUp = null,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      pointLeftForLevelUp: null == pointLeftForLevelUp
          ? _value.pointLeftForLevelUp
          : pointLeftForLevelUp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyPageLevelInfoResponseImplCopyWith<$Res>
    implements $MyPageLevelInfoResponseCopyWith<$Res> {
  factory _$$MyPageLevelInfoResponseImplCopyWith(
          _$MyPageLevelInfoResponseImpl value,
          $Res Function(_$MyPageLevelInfoResponseImpl) then) =
      __$$MyPageLevelInfoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int level, int point, int pointLeftForLevelUp});
}

/// @nodoc
class __$$MyPageLevelInfoResponseImplCopyWithImpl<$Res>
    extends _$MyPageLevelInfoResponseCopyWithImpl<$Res,
        _$MyPageLevelInfoResponseImpl>
    implements _$$MyPageLevelInfoResponseImplCopyWith<$Res> {
  __$$MyPageLevelInfoResponseImplCopyWithImpl(
      _$MyPageLevelInfoResponseImpl _value,
      $Res Function(_$MyPageLevelInfoResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? point = null,
    Object? pointLeftForLevelUp = null,
  }) {
    return _then(_$MyPageLevelInfoResponseImpl(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      pointLeftForLevelUp: null == pointLeftForLevelUp
          ? _value.pointLeftForLevelUp
          : pointLeftForLevelUp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyPageLevelInfoResponseImpl implements _MyPageLevelInfoResponse {
  const _$MyPageLevelInfoResponseImpl(
      {required this.level,
      required this.point,
      required this.pointLeftForLevelUp});

  factory _$MyPageLevelInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyPageLevelInfoResponseImplFromJson(json);

  @override
  final int level;
  @override
  final int point;
  @override
  final int pointLeftForLevelUp;

  @override
  String toString() {
    return 'MyPageLevelInfoResponse(level: $level, point: $point, pointLeftForLevelUp: $pointLeftForLevelUp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPageLevelInfoResponseImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.pointLeftForLevelUp, pointLeftForLevelUp) ||
                other.pointLeftForLevelUp == pointLeftForLevelUp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, level, point, pointLeftForLevelUp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPageLevelInfoResponseImplCopyWith<_$MyPageLevelInfoResponseImpl>
      get copyWith => __$$MyPageLevelInfoResponseImplCopyWithImpl<
          _$MyPageLevelInfoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyPageLevelInfoResponseImplToJson(
      this,
    );
  }
}

abstract class _MyPageLevelInfoResponse implements MyPageLevelInfoResponse {
  const factory _MyPageLevelInfoResponse(
      {required final int level,
      required final int point,
      required final int pointLeftForLevelUp}) = _$MyPageLevelInfoResponseImpl;

  factory _MyPageLevelInfoResponse.fromJson(Map<String, dynamic> json) =
      _$MyPageLevelInfoResponseImpl.fromJson;

  @override
  int get level;
  @override
  int get point;
  @override
  int get pointLeftForLevelUp;
  @override
  @JsonKey(ignore: true)
  _$$MyPageLevelInfoResponseImplCopyWith<_$MyPageLevelInfoResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
