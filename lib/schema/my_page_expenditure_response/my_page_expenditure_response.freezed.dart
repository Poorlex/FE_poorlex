// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_page_expenditure_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyPageExpenditureResponse _$MyPageExpenditureResponseFromJson(
    Map<String, dynamic> json) {
  return _MyPageExpenditureResponse.fromJson(json);
}

/// @nodoc
mixin _$MyPageExpenditureResponse {
  int get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyPageExpenditureResponseCopyWith<MyPageExpenditureResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageExpenditureResponseCopyWith<$Res> {
  factory $MyPageExpenditureResponseCopyWith(MyPageExpenditureResponse value,
          $Res Function(MyPageExpenditureResponse) then) =
      _$MyPageExpenditureResponseCopyWithImpl<$Res, MyPageExpenditureResponse>;
  @useResult
  $Res call({int id, String date, int amount, String imageUrl});
}

/// @nodoc
class _$MyPageExpenditureResponseCopyWithImpl<$Res,
        $Val extends MyPageExpenditureResponse>
    implements $MyPageExpenditureResponseCopyWith<$Res> {
  _$MyPageExpenditureResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? amount = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyPageExpenditureResponseImplCopyWith<$Res>
    implements $MyPageExpenditureResponseCopyWith<$Res> {
  factory _$$MyPageExpenditureResponseImplCopyWith(
          _$MyPageExpenditureResponseImpl value,
          $Res Function(_$MyPageExpenditureResponseImpl) then) =
      __$$MyPageExpenditureResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String date, int amount, String imageUrl});
}

/// @nodoc
class __$$MyPageExpenditureResponseImplCopyWithImpl<$Res>
    extends _$MyPageExpenditureResponseCopyWithImpl<$Res,
        _$MyPageExpenditureResponseImpl>
    implements _$$MyPageExpenditureResponseImplCopyWith<$Res> {
  __$$MyPageExpenditureResponseImplCopyWithImpl(
      _$MyPageExpenditureResponseImpl _value,
      $Res Function(_$MyPageExpenditureResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? amount = null,
    Object? imageUrl = null,
  }) {
    return _then(_$MyPageExpenditureResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyPageExpenditureResponseImpl implements _MyPageExpenditureResponse {
  const _$MyPageExpenditureResponseImpl(
      {required this.id,
      required this.date,
      required this.amount,
      required this.imageUrl});

  factory _$MyPageExpenditureResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyPageExpenditureResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String date;
  @override
  final int amount;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'MyPageExpenditureResponse(id: $id, date: $date, amount: $amount, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPageExpenditureResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, amount, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPageExpenditureResponseImplCopyWith<_$MyPageExpenditureResponseImpl>
      get copyWith => __$$MyPageExpenditureResponseImplCopyWithImpl<
          _$MyPageExpenditureResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyPageExpenditureResponseImplToJson(
      this,
    );
  }
}

abstract class _MyPageExpenditureResponse implements MyPageExpenditureResponse {
  const factory _MyPageExpenditureResponse(
      {required final int id,
      required final String date,
      required final int amount,
      required final String imageUrl}) = _$MyPageExpenditureResponseImpl;

  factory _MyPageExpenditureResponse.fromJson(Map<String, dynamic> json) =
      _$MyPageExpenditureResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get date;
  @override
  int get amount;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$MyPageExpenditureResponseImplCopyWith<_$MyPageExpenditureResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
