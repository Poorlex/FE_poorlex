// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SocialLoginModel _$SocialLoginModelFromJson(Map<String, dynamic> json) {
  return _SocialLoginModel.fromJson(json);
}

/// @nodoc
mixin _$SocialLoginModel {
  String get code => throw _privateConstructorUsedError;
  SocialType get socialType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialLoginModelCopyWith<SocialLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialLoginModelCopyWith<$Res> {
  factory $SocialLoginModelCopyWith(
          SocialLoginModel value, $Res Function(SocialLoginModel) then) =
      _$SocialLoginModelCopyWithImpl<$Res, SocialLoginModel>;
  @useResult
  $Res call({String code, SocialType socialType});
}

/// @nodoc
class _$SocialLoginModelCopyWithImpl<$Res, $Val extends SocialLoginModel>
    implements $SocialLoginModelCopyWith<$Res> {
  _$SocialLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? socialType = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      socialType: null == socialType
          ? _value.socialType
          : socialType // ignore: cast_nullable_to_non_nullable
              as SocialType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialLoginModelImplCopyWith<$Res>
    implements $SocialLoginModelCopyWith<$Res> {
  factory _$$SocialLoginModelImplCopyWith(_$SocialLoginModelImpl value,
          $Res Function(_$SocialLoginModelImpl) then) =
      __$$SocialLoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, SocialType socialType});
}

/// @nodoc
class __$$SocialLoginModelImplCopyWithImpl<$Res>
    extends _$SocialLoginModelCopyWithImpl<$Res, _$SocialLoginModelImpl>
    implements _$$SocialLoginModelImplCopyWith<$Res> {
  __$$SocialLoginModelImplCopyWithImpl(_$SocialLoginModelImpl _value,
      $Res Function(_$SocialLoginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? socialType = null,
  }) {
    return _then(_$SocialLoginModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      socialType: null == socialType
          ? _value.socialType
          : socialType // ignore: cast_nullable_to_non_nullable
              as SocialType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialLoginModelImpl implements _SocialLoginModel {
  _$SocialLoginModelImpl({required this.code, required this.socialType});

  factory _$SocialLoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialLoginModelImplFromJson(json);

  @override
  final String code;
  @override
  final SocialType socialType;

  @override
  String toString() {
    return 'SocialLoginModel(code: $code, socialType: $socialType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialLoginModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.socialType, socialType) ||
                other.socialType == socialType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, socialType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialLoginModelImplCopyWith<_$SocialLoginModelImpl> get copyWith =>
      __$$SocialLoginModelImplCopyWithImpl<_$SocialLoginModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialLoginModelImplToJson(
      this,
    );
  }
}

abstract class _SocialLoginModel implements SocialLoginModel {
  factory _SocialLoginModel(
      {required final String code,
      required final SocialType socialType}) = _$SocialLoginModelImpl;

  factory _SocialLoginModel.fromJson(Map<String, dynamic> json) =
      _$SocialLoginModelImpl.fromJson;

  @override
  String get code;
  @override
  SocialType get socialType;
  @override
  @JsonKey(ignore: true)
  _$$SocialLoginModelImplCopyWith<_$SocialLoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
