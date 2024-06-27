// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenditure_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenditureResponse _$ExpenditureResponseFromJson(Map<String, dynamic> json) {
  return _ExpenditureResponse.fromJson(json);
}

/// @nodoc
mixin _$ExpenditureResponse {
  int get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  int get memberId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get mainImageUrl => throw _privateConstructorUsedError;
  String? get subImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenditureResponseCopyWith<ExpenditureResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenditureResponseCopyWith<$Res> {
  factory $ExpenditureResponseCopyWith(
          ExpenditureResponse value, $Res Function(ExpenditureResponse) then) =
      _$ExpenditureResponseCopyWithImpl<$Res, ExpenditureResponse>;
  @useResult
  $Res call(
      {int id,
      String date,
      int memberId,
      int amount,
      String description,
      String mainImageUrl,
      String? subImageUrl});
}

/// @nodoc
class _$ExpenditureResponseCopyWithImpl<$Res, $Val extends ExpenditureResponse>
    implements $ExpenditureResponseCopyWith<$Res> {
  _$ExpenditureResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? memberId = null,
    Object? amount = null,
    Object? description = null,
    Object? mainImageUrl = null,
    Object? subImageUrl = freezed,
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
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      mainImageUrl: null == mainImageUrl
          ? _value.mainImageUrl
          : mainImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      subImageUrl: freezed == subImageUrl
          ? _value.subImageUrl
          : subImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenditureResponseImplCopyWith<$Res>
    implements $ExpenditureResponseCopyWith<$Res> {
  factory _$$ExpenditureResponseImplCopyWith(_$ExpenditureResponseImpl value,
          $Res Function(_$ExpenditureResponseImpl) then) =
      __$$ExpenditureResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String date,
      int memberId,
      int amount,
      String description,
      String mainImageUrl,
      String? subImageUrl});
}

/// @nodoc
class __$$ExpenditureResponseImplCopyWithImpl<$Res>
    extends _$ExpenditureResponseCopyWithImpl<$Res, _$ExpenditureResponseImpl>
    implements _$$ExpenditureResponseImplCopyWith<$Res> {
  __$$ExpenditureResponseImplCopyWithImpl(_$ExpenditureResponseImpl _value,
      $Res Function(_$ExpenditureResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? memberId = null,
    Object? amount = null,
    Object? description = null,
    Object? mainImageUrl = null,
    Object? subImageUrl = freezed,
  }) {
    return _then(_$ExpenditureResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      mainImageUrl: null == mainImageUrl
          ? _value.mainImageUrl
          : mainImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      subImageUrl: freezed == subImageUrl
          ? _value.subImageUrl
          : subImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenditureResponseImpl implements _ExpenditureResponse {
  const _$ExpenditureResponseImpl(
      {required this.id,
      required this.date,
      required this.memberId,
      required this.amount,
      required this.description,
      required this.mainImageUrl,
      this.subImageUrl});

  factory _$ExpenditureResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenditureResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String date;
  @override
  final int memberId;
  @override
  final int amount;
  @override
  final String description;
  @override
  final String mainImageUrl;
  @override
  final String? subImageUrl;

  @override
  String toString() {
    return 'ExpenditureResponse(id: $id, date: $date, memberId: $memberId, amount: $amount, description: $description, mainImageUrl: $mainImageUrl, subImageUrl: $subImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenditureResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mainImageUrl, mainImageUrl) ||
                other.mainImageUrl == mainImageUrl) &&
            (identical(other.subImageUrl, subImageUrl) ||
                other.subImageUrl == subImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, memberId, amount,
      description, mainImageUrl, subImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenditureResponseImplCopyWith<_$ExpenditureResponseImpl> get copyWith =>
      __$$ExpenditureResponseImplCopyWithImpl<_$ExpenditureResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenditureResponseImplToJson(
      this,
    );
  }
}

abstract class _ExpenditureResponse implements ExpenditureResponse {
  const factory _ExpenditureResponse(
      {required final int id,
      required final String date,
      required final int memberId,
      required final int amount,
      required final String description,
      required final String mainImageUrl,
      final String? subImageUrl}) = _$ExpenditureResponseImpl;

  factory _ExpenditureResponse.fromJson(Map<String, dynamic> json) =
      _$ExpenditureResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get date;
  @override
  int get memberId;
  @override
  int get amount;
  @override
  String get description;
  @override
  String get mainImageUrl;
  @override
  String? get subImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$ExpenditureResponseImplCopyWith<_$ExpenditureResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
