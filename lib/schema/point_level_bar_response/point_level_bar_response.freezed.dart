// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_level_bar_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PointLevelBarResponse _$PointLevelBarResponseFromJson(
    Map<String, dynamic> json) {
  return _PointLevelBarResponse.fromJson(json);
}

/// @nodoc
mixin _$PointLevelBarResponse {
  int get levelRange => throw _privateConstructorUsedError;
  int get currentPoint => throw _privateConstructorUsedError;
  int get recentPoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointLevelBarResponseCopyWith<PointLevelBarResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointLevelBarResponseCopyWith<$Res> {
  factory $PointLevelBarResponseCopyWith(PointLevelBarResponse value,
          $Res Function(PointLevelBarResponse) then) =
      _$PointLevelBarResponseCopyWithImpl<$Res, PointLevelBarResponse>;
  @useResult
  $Res call({int levelRange, int currentPoint, int recentPoint});
}

/// @nodoc
class _$PointLevelBarResponseCopyWithImpl<$Res,
        $Val extends PointLevelBarResponse>
    implements $PointLevelBarResponseCopyWith<$Res> {
  _$PointLevelBarResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levelRange = null,
    Object? currentPoint = null,
    Object? recentPoint = null,
  }) {
    return _then(_value.copyWith(
      levelRange: null == levelRange
          ? _value.levelRange
          : levelRange // ignore: cast_nullable_to_non_nullable
              as int,
      currentPoint: null == currentPoint
          ? _value.currentPoint
          : currentPoint // ignore: cast_nullable_to_non_nullable
              as int,
      recentPoint: null == recentPoint
          ? _value.recentPoint
          : recentPoint // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointLevelBarResponseImplCopyWith<$Res>
    implements $PointLevelBarResponseCopyWith<$Res> {
  factory _$$PointLevelBarResponseImplCopyWith(
          _$PointLevelBarResponseImpl value,
          $Res Function(_$PointLevelBarResponseImpl) then) =
      __$$PointLevelBarResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int levelRange, int currentPoint, int recentPoint});
}

/// @nodoc
class __$$PointLevelBarResponseImplCopyWithImpl<$Res>
    extends _$PointLevelBarResponseCopyWithImpl<$Res,
        _$PointLevelBarResponseImpl>
    implements _$$PointLevelBarResponseImplCopyWith<$Res> {
  __$$PointLevelBarResponseImplCopyWithImpl(_$PointLevelBarResponseImpl _value,
      $Res Function(_$PointLevelBarResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levelRange = null,
    Object? currentPoint = null,
    Object? recentPoint = null,
  }) {
    return _then(_$PointLevelBarResponseImpl(
      levelRange: null == levelRange
          ? _value.levelRange
          : levelRange // ignore: cast_nullable_to_non_nullable
              as int,
      currentPoint: null == currentPoint
          ? _value.currentPoint
          : currentPoint // ignore: cast_nullable_to_non_nullable
              as int,
      recentPoint: null == recentPoint
          ? _value.recentPoint
          : recentPoint // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointLevelBarResponseImpl implements _PointLevelBarResponse {
  const _$PointLevelBarResponseImpl(
      {required this.levelRange,
      required this.currentPoint,
      required this.recentPoint});

  factory _$PointLevelBarResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointLevelBarResponseImplFromJson(json);

  @override
  final int levelRange;
  @override
  final int currentPoint;
  @override
  final int recentPoint;

  @override
  String toString() {
    return 'PointLevelBarResponse(levelRange: $levelRange, currentPoint: $currentPoint, recentPoint: $recentPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointLevelBarResponseImpl &&
            (identical(other.levelRange, levelRange) ||
                other.levelRange == levelRange) &&
            (identical(other.currentPoint, currentPoint) ||
                other.currentPoint == currentPoint) &&
            (identical(other.recentPoint, recentPoint) ||
                other.recentPoint == recentPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, levelRange, currentPoint, recentPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PointLevelBarResponseImplCopyWith<_$PointLevelBarResponseImpl>
      get copyWith => __$$PointLevelBarResponseImplCopyWithImpl<
          _$PointLevelBarResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointLevelBarResponseImplToJson(
      this,
    );
  }
}

abstract class _PointLevelBarResponse implements PointLevelBarResponse {
  const factory _PointLevelBarResponse(
      {required final int levelRange,
      required final int currentPoint,
      required final int recentPoint}) = _$PointLevelBarResponseImpl;

  factory _PointLevelBarResponse.fromJson(Map<String, dynamic> json) =
      _$PointLevelBarResponseImpl.fromJson;

  @override
  int get levelRange;
  @override
  int get currentPoint;
  @override
  int get recentPoint;
  @override
  @JsonKey(ignore: true)
  _$$PointLevelBarResponseImplCopyWith<_$PointLevelBarResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
