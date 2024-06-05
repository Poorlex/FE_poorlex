// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyPageResponseImpl _$$MyPageResponseImplFromJson(Map<String, dynamic> json) =>
    _$MyPageResponseImpl(
      nickname: json['nickname'] as String,
      description: json['description'] as String?,
      levelInfo: MyPageLevelInfoResponse.fromJson(
          json['levelInfo'] as Map<String, dynamic>),
      battleSuccessInfo: BattleSuccessCountResponse.fromJson(
          json['battleSuccessInfo'] as Map<String, dynamic>),
      friendTotalCount: (json['friendTotalCount'] as num).toInt(),
      friends: (json['friends'] as List<dynamic>)
          .map((e) => FriendResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      expenditureTotalCount: (json['expenditureTotalCount'] as num).toInt(),
      expenditures: (json['expenditures'] as List<dynamic>)
          .map((e) =>
              MyPageExpenditureResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyPageResponseImplToJson(
        _$MyPageResponseImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'description': instance.description,
      'levelInfo': instance.levelInfo,
      'battleSuccessInfo': instance.battleSuccessInfo,
      'friendTotalCount': instance.friendTotalCount,
      'friends': instance.friends,
      'expenditureTotalCount': instance.expenditureTotalCount,
      'expenditures': instance.expenditures,
    };
