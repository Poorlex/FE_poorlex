// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_expenditure_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BattleExpenditureResponse _$BattleExpenditureResponseFromJson(
    Map<String, dynamic> json) {
  return _BattleExpenditureResponse.fromJson(json);
}

/// @nodoc
mixin _$BattleExpenditureResponse {
  int get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get imageCount => throw _privateConstructorUsedError;
  bool get own => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BattleExpenditureResponseCopyWith<BattleExpenditureResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleExpenditureResponseCopyWith<$Res> {
  factory $BattleExpenditureResponseCopyWith(BattleExpenditureResponse value,
          $Res Function(BattleExpenditureResponse) then) =
      _$BattleExpenditureResponseCopyWithImpl<$Res, BattleExpenditureResponse>;
  @useResult
  $Res call({int id, String imageUrl, int imageCount, bool own});
}

/// @nodoc
class _$BattleExpenditureResponseCopyWithImpl<$Res,
        $Val extends BattleExpenditureResponse>
    implements $BattleExpenditureResponseCopyWith<$Res> {
  _$BattleExpenditureResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? imageCount = null,
    Object? own = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageCount: null == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int,
      own: null == own
          ? _value.own
          : own // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BattleExpenditureResponseImplCopyWith<$Res>
    implements $BattleExpenditureResponseCopyWith<$Res> {
  factory _$$BattleExpenditureResponseImplCopyWith(
          _$BattleExpenditureResponseImpl value,
          $Res Function(_$BattleExpenditureResponseImpl) then) =
      __$$BattleExpenditureResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String imageUrl, int imageCount, bool own});
}

/// @nodoc
class __$$BattleExpenditureResponseImplCopyWithImpl<$Res>
    extends _$BattleExpenditureResponseCopyWithImpl<$Res,
        _$BattleExpenditureResponseImpl>
    implements _$$BattleExpenditureResponseImplCopyWith<$Res> {
  __$$BattleExpenditureResponseImplCopyWithImpl(
      _$BattleExpenditureResponseImpl _value,
      $Res Function(_$BattleExpenditureResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? imageCount = null,
    Object? own = null,
  }) {
    return _then(_$BattleExpenditureResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageCount: null == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int,
      own: null == own
          ? _value.own
          : own // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BattleExpenditureResponseImpl implements _BattleExpenditureResponse {
  const _$BattleExpenditureResponseImpl(
      {required this.id,
      required this.imageUrl,
      required this.imageCount,
      required this.own});

  factory _$BattleExpenditureResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BattleExpenditureResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String imageUrl;
  @override
  final int imageCount;
  @override
  final bool own;

  @override
  String toString() {
    return 'BattleExpenditureResponse(id: $id, imageUrl: $imageUrl, imageCount: $imageCount, own: $own)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleExpenditureResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount) &&
            (identical(other.own, own) || other.own == own));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl, imageCount, own);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleExpenditureResponseImplCopyWith<_$BattleExpenditureResponseImpl>
      get copyWith => __$$BattleExpenditureResponseImplCopyWithImpl<
          _$BattleExpenditureResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BattleExpenditureResponseImplToJson(
      this,
    );
  }
}

abstract class _BattleExpenditureResponse implements BattleExpenditureResponse {
  const factory _BattleExpenditureResponse(
      {required final int id,
      required final String imageUrl,
      required final int imageCount,
      required final bool own}) = _$BattleExpenditureResponseImpl;

  factory _BattleExpenditureResponse.fromJson(Map<String, dynamic> json) =
      _$BattleExpenditureResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get imageUrl;
  @override
  int get imageCount;
  @override
  bool get own;
  @override
  @JsonKey(ignore: true)
  _$$BattleExpenditureResponseImplCopyWith<_$BattleExpenditureResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
