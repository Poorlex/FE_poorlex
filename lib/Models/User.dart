enum AlarmTypes { EXPENDITURE_REQUEST, BATTLE_STATUS, BATTLE_CHAT, FRIEND, BATTLE_INVITE }

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

class Expenditure {
  /*
  {
    "id": 0,
    "date": "2024-02-24",
    "amount": 0,
    "description": "string",
    "mainImageUrl": "string",
    "subImageUrl": "string"
  }
   */
  late int? id;
  late String? date;
  late num? amount = 0;
  late String? description;
  late String? imageUrl;
  late String? mainImageUrl;
  late String? subImageUrl;

  Expenditure({
    this.id,
    this.date,
    this.amount,
    this.description,
    this.imageUrl,
    this.mainImageUrl,
    this.subImageUrl
  });
  factory Expenditure.fromJson(Map<String, dynamic> j) => Expenditure(
    id: j['id'],
    date: j['date'],
    amount: j['amount'],
    description: j['description'],
    imageUrl: j['imageUrl'],
    mainImageUrl: j['mainImageUrl'],
    subImageUrl: j['subImageUrl'],
  );
}

class AlarmAllows {
  /*
{
  "allowExpenditureRequestAlarm": true,
  "allowBattleStatusAlarm": true,
  "allowBattleChatAlarm": true,
  "allowFriendAlarm": true,
  "allowBattleInvitationAlarm": true
}
  */
  bool? allowExpenditureRequestAlarm = false;
  bool? allowBattleStatusAlarm = false;
  bool? allowBattleChatAlarm = false;
  bool? allowFriendAlarm = false;
  bool? allowBattleInvitationAlarm = false;

  AlarmAllows({
    this.allowExpenditureRequestAlarm = false,
    this.allowBattleStatusAlarm = false,
    this.allowBattleChatAlarm = false,
    this.allowFriendAlarm = false,
    this.allowBattleInvitationAlarm = false
  });

  factory AlarmAllows.fromJson(Map<String, dynamic> data) => AlarmAllows(
    allowExpenditureRequestAlarm: data['allowExpenditureRequestAlarm'],
    allowBattleStatusAlarm: data['allowBattleStatusAlarm'],
    allowBattleChatAlarm: data['allowBattleChatAlarm'],
    allowFriendAlarm: data['allowFriendAlarm'],
    allowBattleInvitationAlarm: data['allowBattleInvitationAlarm'],
  );
}

class Friend {
  /*
  {
    "level": 0,
    "nickname": "string",
    "weeklyExpenditure": 0
  }
  */
  int? level = 0;
  String? nickname = null;
  int? weeklyExpenditure = 0;

  Friend({
    this.level = 0,
    this.nickname,
    this.weeklyExpenditure = 0
  });

  factory Friend.fromJson(Map<String, dynamic> data) => Friend(
      level: data['level'],
      nickname: data['nickname'],
      weeklyExpenditure: data['weeklyExpenditure']
  );
}

class UserInfo {
  /*
  {
    "nickname":"닉네임",
    "description":null,
    "levelInfo":{"level":1,"point":0,"pointLeftForLevelUp":70},
    "battleSuccessInfo":{"totalBattleSuccessCount":0,"hardBattleSuccessCount":0,"normalBattleSuccessCount":0,"easyBattleSuccessCount":0},
    "friendTotalCount":0,
    "friends":[],
    "expenditureTotalCount":0,
    "expenditures":[]
  }
 */
  String? nickname;
  String? description;
  LevelInfo? levelInfo;
  BattleSuccessInfo? battleSuccessInfo;
  int? friendTotalCount = 0;
  List<Friend>? friends = [];
  int? expenditureTotalCount = 0;
  List<Expenditure>? expenditures = [];

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

  factory UserInfo.fromJson(Map<String, dynamic> data) => UserInfo(
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
        friends: (data['friends'] ?? []).map<Friend>((f) => Friend.fromJson(f)).toList(),
        expenditureTotalCount: data['expenditureTotalCount'],
        expenditures: (data['expenditures'] ?? []).map<Expenditure>((f) => Expenditure.fromJson(f)).toList()
    );
}

class UserToken {
  String? token;
  String? refreshToken;

  UserToken({ this.token = null, this.refreshToken = null });
}