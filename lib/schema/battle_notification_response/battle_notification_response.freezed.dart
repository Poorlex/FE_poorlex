// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_notification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BattleNotificationResponse _$BattleNotificationResponseFromJson(
    Map<String, dynamic> json) {
  return _BattleNotificationResponse.fromJson(json);
}

/// @nodoc
mixin _$BattleNotificationResponse {
  String? get content => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BattleNotificationResponseCopyWith<BattleNotificationResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleNotificationResponseCopyWith<$Res> {
  factory $BattleNotificationResponseCopyWith(BattleNotificationResponse value,
          $Res Function(BattleNotificationResponse) then) =
      _$BattleNotificationResponseCopyWithImpl<$Res,
          BattleNotificationResponse>;
  @useResult
  $Res call({String? content, String? imageUrl});
}

/// @nodoc
class _$BattleNotificationResponseCopyWithImpl<$Res,
        $Val extends BattleNotificationResponse>
    implements $BattleNotificationResponseCopyWith<$Res> {
  _$BattleNotificationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BattleNotificationResponseImplCopyWith<$Res>
    implements $BattleNotificationResponseCopyWith<$Res> {
  factory _$$BattleNotificationResponseImplCopyWith(
          _$BattleNotificationResponseImpl value,
          $Res Function(_$BattleNotificationResponseImpl) then) =
      __$$BattleNotificationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? content, String? imageUrl});
}

/// @nodoc
class __$$BattleNotificationResponseImplCopyWithImpl<$Res>
    extends _$BattleNotificationResponseCopyWithImpl<$Res,
        _$BattleNotificationResponseImpl>
    implements _$$BattleNotificationResponseImplCopyWith<$Res> {
  __$$BattleNotificationResponseImplCopyWithImpl(
      _$BattleNotificationResponseImpl _value,
      $Res Function(_$BattleNotificationResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$BattleNotificationResponseImpl(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BattleNotificationResponseImpl implements _BattleNotificationResponse {
  _$BattleNotificationResponseImpl({this.content, this.imageUrl});

  factory _$BattleNotificationResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BattleNotificationResponseImplFromJson(json);

  @override
  final String? content;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'BattleNotificationResponse(content: $content, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleNotificationResponseImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleNotificationResponseImplCopyWith<_$BattleNotificationResponseImpl>
      get copyWith => __$$BattleNotificationResponseImplCopyWithImpl<
          _$BattleNotificationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BattleNotificationResponseImplToJson(
      this,
    );
  }
}

abstract class _BattleNotificationResponse
    implements BattleNotificationResponse {
  factory _BattleNotificationResponse(
      {final String? content,
      final String? imageUrl}) = _$BattleNotificationResponseImpl;

  factory _BattleNotificationResponse.fromJson(Map<String, dynamic> json) =
      _$BattleNotificationResponseImpl.fromJson;

  @override
  String? get content;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$BattleNotificationResponseImplCopyWith<_$BattleNotificationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
