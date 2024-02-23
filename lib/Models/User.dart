import 'package:poorlex/Models/Abstract.dart';

/*
{
  "nickname":"ê¹íì¤",
  "description":null,
  "levelInfo":{"level":1,"point":0,"pointLeftForLevelUp":70},
  "battleSuccessInfo":{"totalBattleSuccessCount":0,"hardBattleSuccessCount":0,"normalBattleSuccessCount":0,"easyBattleSuccessCount":0},
  "friendTotalCount":0,
  "friends":[],
  "expenditureTotalCount":0,
  "expenditures":[]
}
 */

class LevelInfo {
  int level = 0;
  int point = 0;
  int pointLeftForLevelUp = 0;

  LevelInfo({
    this.level = 0,
    this.point = 0,
    this.pointLeftForLevelUp = 0
  });
}

class BattleSuccessInfo {
  int totalBattleSuccessCount = 0;
  int hardBattleSuccessCount = 0;
  int normalBattleSuccessCount = 0;
  int easyBattleSuccessCount = 0;

  BattleSuccessInfo({
    this.totalBattleSuccessCount = 0,
    this.hardBattleSuccessCount = 0,
    this.normalBattleSuccessCount = 0,
    this.easyBattleSuccessCount = 0
  });
}

class UserInfo extends Model {
  String? nickname;
  String? description;
  LevelInfo? levelInfo;
  BattleSuccessInfo? battleSuccessInfo;
  int? friendTotalCount = 0;
  List<dynamic>? friends = [];
  int? expenditureTotalCount = 0;
  List<dynamic>? expenditures = [];

  UserInfo({
    this.nickname,
    this.description,
    this.levelInfo,
    this.battleSuccessInfo,
    this.friendTotalCount = 0,
    this.friends,
    this.expenditureTotalCount = 0,
    this.expenditures
  });

  @override
  factory UserInfo.fromJson(Map<String, dynamic> data)  => UserInfo(
        nickname: data['nickname'],
        description: data['description'],
        levelInfo: LevelInfo(
          level: data['levelInfo']['level'],
          point: data['levelInfo']['point'],
          pointLeftForLevelUp: data['levelInfo']['pointLeftForLevelUp'],
        ),
        battleSuccessInfo: BattleSuccessInfo(
          totalBattleSuccessCount: data['battleSuccessInfo']['totalBattleSuccessCount'],
          hardBattleSuccessCount: data['battleSuccessInfo']['hardBattleSuccessCount'],
          normalBattleSuccessCount: data['battleSuccessInfo']['normalBattleSuccessCount'],
          easyBattleSuccessCount: data['battleSuccessInfo']['easyBattleSuccessCount'],
        ),
        friendTotalCount: data['friendTotalCount'],
        friends: data['friends'],
        expenditureTotalCount: data['expenditureTotalCount'],
        expenditures: data['expenditures']
    );
}

class UserToken {
  String? token;
  String? refreshToken;

  UserToken({ this.token = null, this.refreshToken = null });
}