// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PointResponse _$PointResponseFromJson(Map<String, dynamic> json) {
  return _PointResponse.fromJson(json);
}

/// @nodoc
mixin _$PointResponse {
  int get totalPoint => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointResponseCopyWith<PointResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointResponseCopyWith<$Res> {
  factory $PointResponseCopyWith(
          PointResponse value, $Res Function(PointResponse) then) =
      _$PointResponseCopyWithImpl<$Res, PointResponse>;
  @useResult
  $Res call({int totalPoint, int level});
}

/// @nodoc
class _$PointResponseCopyWithImpl<$Res, $Val extends PointResponse>
    implements $PointResponseCopyWith<$Res> {
  _$PointResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPoint = null,
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      totalPoint: null == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointResponseImplCopyWith<$Res>
    implements $PointResponseCopyWith<$Res> {
  factory _$$PointResponseImplCopyWith(
          _$PointResponseImpl value, $Res Function(_$PointResponseImpl) then) =
      __$$PointResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalPoint, int level});
}

/// @nodoc
class __$$PointResponseImplCopyWithImpl<$Res>
    extends _$PointResponseCopyWithImpl<$Res, _$PointResponseImpl>
    implements _$$PointResponseImplCopyWith<$Res> {
  __$$PointResponseImplCopyWithImpl(
      _$PointResponseImpl _value, $Res Function(_$PointResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPoint = null,
    Object? level = null,
  }) {
    return _then(_$PointResponseImpl(
      totalPoint: null == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointResponseImpl implements _PointResponse {
  const _$PointResponseImpl({required this.totalPoint, required this.level});

  factory _$PointResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointResponseImplFromJson(json);

  @override
  final int totalPoint;
  @override
  final int level;

  @override
  String toString() {
    return 'PointResponse(totalPoint: $totalPoint, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointResponseImpl &&
            (identical(other.totalPoint, totalPoint) ||
                other.totalPoint == totalPoint) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalPoint, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PointResponseImplCopyWith<_$PointResponseImpl> get copyWith =>
      __$$PointResponseImplCopyWithImpl<_$PointResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointResponseImplToJson(
      this,
    );
  }
}

abstract class _PointResponse implements PointResponse {
  const factory _PointResponse(
      {required final int totalPoint,
      required final int level}) = _$PointResponseImpl;

  factory _PointResponse.fromJson(Map<String, dynamic> json) =
      _$PointResponseImpl.fromJson;

  @override
  int get totalPoint;
  @override
  int get level;
  @override
  @JsonKey(ignore: true)
  _$$PointResponseImplCopyWith<_$PointResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
