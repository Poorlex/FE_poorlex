// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyPageResponse _$MyPageResponseFromJson(Map<String, dynamic> json) {
  return _MyPageResponse.fromJson(json);
}

/// @nodoc
mixin _$MyPageResponse {
  String get nickname => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  MyPageLevelInfoResponse get levelInfo => throw _privateConstructorUsedError;
  BattleSuccessCountResponse get battleSuccessInfo =>
      throw _privateConstructorUsedError;
  int get friendTotalCount => throw _privateConstructorUsedError;
  List<FriendResponse> get friends => throw _privateConstructorUsedError;
  int get expenditureTotalCount => throw _privateConstructorUsedError;
  List<MyPageExpenditureResponse> get expenditures =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyPageResponseCopyWith<MyPageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageResponseCopyWith<$Res> {
  factory $MyPageResponseCopyWith(
          MyPageResponse value, $Res Function(MyPageResponse) then) =
      _$MyPageResponseCopyWithImpl<$Res, MyPageResponse>;
  @useResult
  $Res call(
      {String nickname,
      String description,
      MyPageLevelInfoResponse levelInfo,
      BattleSuccessCountResponse battleSuccessInfo,
      int friendTotalCount,
      List<FriendResponse> friends,
      int expenditureTotalCount,
      List<MyPageExpenditureResponse> expenditures});

  $MyPageLevelInfoResponseCopyWith<$Res> get levelInfo;
  $BattleSuccessCountResponseCopyWith<$Res> get battleSuccessInfo;
}

/// @nodoc
class _$MyPageResponseCopyWithImpl<$Res, $Val extends MyPageResponse>
    implements $MyPageResponseCopyWith<$Res> {
  _$MyPageResponseCopyWithImpl(this._value, this._then);

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
    Object? battleSuccessInfo = null,
    Object? friendTotalCount = null,
    Object? friends = null,
    Object? expenditureTotalCount = null,
    Object? expenditures = null,
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
      battleSuccessInfo: null == battleSuccessInfo
          ? _value.battleSuccessInfo
          : battleSuccessInfo // ignore: cast_nullable_to_non_nullable
              as BattleSuccessCountResponse,
      friendTotalCount: null == friendTotalCount
          ? _value.friendTotalCount
          : friendTotalCount // ignore: cast_nullable_to_non_nullable
              as int,
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FriendResponse>,
      expenditureTotalCount: null == expenditureTotalCount
          ? _value.expenditureTotalCount
          : expenditureTotalCount // ignore: cast_nullable_to_non_nullable
              as int,
      expenditures: null == expenditures
          ? _value.expenditures
          : expenditures // ignore: cast_nullable_to_non_nullable
              as List<MyPageExpenditureResponse>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MyPageLevelInfoResponseCopyWith<$Res> get levelInfo {
    return $MyPageLevelInfoResponseCopyWith<$Res>(_value.levelInfo, (value) {
      return _then(_value.copyWith(levelInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BattleSuccessCountResponseCopyWith<$Res> get battleSuccessInfo {
    return $BattleSuccessCountResponseCopyWith<$Res>(_value.battleSuccessInfo,
        (value) {
      return _then(_value.copyWith(battleSuccessInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyPageResponseImplCopyWith<$Res>
    implements $MyPageResponseCopyWith<$Res> {
  factory _$$MyPageResponseImplCopyWith(_$MyPageResponseImpl value,
          $Res Function(_$MyPageResponseImpl) then) =
      __$$MyPageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nickname,
      String description,
      MyPageLevelInfoResponse levelInfo,
      BattleSuccessCountResponse battleSuccessInfo,
      int friendTotalCount,
      List<FriendResponse> friends,
      int expenditureTotalCount,
      List<MyPageExpenditureResponse> expenditures});

  @override
  $MyPageLevelInfoResponseCopyWith<$Res> get levelInfo;
  @override
  $BattleSuccessCountResponseCopyWith<$Res> get battleSuccessInfo;
}

/// @nodoc
class __$$MyPageResponseImplCopyWithImpl<$Res>
    extends _$MyPageResponseCopyWithImpl<$Res, _$MyPageResponseImpl>
    implements _$$MyPageResponseImplCopyWith<$Res> {
  __$$MyPageResponseImplCopyWithImpl(
      _$MyPageResponseImpl _value, $Res Function(_$MyPageResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? description = null,
    Object? levelInfo = null,
    Object? battleSuccessInfo = null,
    Object? friendTotalCount = null,
    Object? friends = null,
    Object? expenditureTotalCount = null,
    Object? expenditures = null,
  }) {
    return _then(_$MyPageResponseImpl(
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
      battleSuccessInfo: null == battleSuccessInfo
          ? _value.battleSuccessInfo
          : battleSuccessInfo // ignore: cast_nullable_to_non_nullable
              as BattleSuccessCountResponse,
      friendTotalCount: null == friendTotalCount
          ? _value.friendTotalCount
          : friendTotalCount // ignore: cast_nullable_to_non_nullable
              as int,
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FriendResponse>,
      expenditureTotalCount: null == expenditureTotalCount
          ? _value.expenditureTotalCount
          : expenditureTotalCount // ignore: cast_nullable_to_non_nullable
              as int,
      expenditures: null == expenditures
          ? _value._expenditures
          : expenditures // ignore: cast_nullable_to_non_nullable
              as List<MyPageExpenditureResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyPageResponseImpl implements _MyPageResponse {
  const _$MyPageResponseImpl(
      {required this.nickname,
      required this.description,
      required this.levelInfo,
      required this.battleSuccessInfo,
      required this.friendTotalCount,
      required final List<FriendResponse> friends,
      required this.expenditureTotalCount,
      required final List<MyPageExpenditureResponse> expenditures})
      : _friends = friends,
        _expenditures = expenditures;

  factory _$MyPageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyPageResponseImplFromJson(json);

  @override
  final String nickname;
  @override
  final String description;
  @override
  final MyPageLevelInfoResponse levelInfo;
  @override
  final BattleSuccessCountResponse battleSuccessInfo;
  @override
  final int friendTotalCount;
  final List<FriendResponse> _friends;
  @override
  List<FriendResponse> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  @override
  final int expenditureTotalCount;
  final List<MyPageExpenditureResponse> _expenditures;
  @override
  List<MyPageExpenditureResponse> get expenditures {
    if (_expenditures is EqualUnmodifiableListView) return _expenditures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenditures);
  }

  @override
  String toString() {
    return 'MyPageResponse(nickname: $nickname, description: $description, levelInfo: $levelInfo, battleSuccessInfo: $battleSuccessInfo, friendTotalCount: $friendTotalCount, friends: $friends, expenditureTotalCount: $expenditureTotalCount, expenditures: $expenditures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPageResponseImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.levelInfo, levelInfo) ||
                other.levelInfo == levelInfo) &&
            (identical(other.battleSuccessInfo, battleSuccessInfo) ||
                other.battleSuccessInfo == battleSuccessInfo) &&
            (identical(other.friendTotalCount, friendTotalCount) ||
                other.friendTotalCount == friendTotalCount) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            (identical(other.expenditureTotalCount, expenditureTotalCount) ||
                other.expenditureTotalCount == expenditureTotalCount) &&
            const DeepCollectionEquality()
                .equals(other._expenditures, _expenditures));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nickname,
      description,
      levelInfo,
      battleSuccessInfo,
      friendTotalCount,
      const DeepCollectionEquality().hash(_friends),
      expenditureTotalCount,
      const DeepCollectionEquality().hash(_expenditures));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPageResponseImplCopyWith<_$MyPageResponseImpl> get copyWith =>
      __$$MyPageResponseImplCopyWithImpl<_$MyPageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyPageResponseImplToJson(
      this,
    );
  }
}

abstract class _MyPageResponse implements MyPageResponse {
  const factory _MyPageResponse(
          {required final String nickname,
          required final String description,
          required final MyPageLevelInfoResponse levelInfo,
          required final BattleSuccessCountResponse battleSuccessInfo,
          required final int friendTotalCount,
          required final List<FriendResponse> friends,
          required final int expenditureTotalCount,
          required final List<MyPageExpenditureResponse> expenditures}) =
      _$MyPageResponseImpl;

  factory _MyPageResponse.fromJson(Map<String, dynamic> json) =
      _$MyPageResponseImpl.fromJson;

  @override
  String get nickname;
  @override
  String get description;
  @override
  MyPageLevelInfoResponse get levelInfo;
  @override
  BattleSuccessCountResponse get battleSuccessInfo;
  @override
  int get friendTotalCount;
  @override
  List<FriendResponse> get friends;
  @override
  int get expenditureTotalCount;
  @override
  List<MyPageExpenditureResponse> get expenditures;
  @override
  @JsonKey(ignore: true)
  _$$MyPageResponseImplCopyWith<_$MyPageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
