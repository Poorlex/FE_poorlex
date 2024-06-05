enum AlarmTypes {
  EXPENDITURE_REQUEST,
  BATTLE_STATUS,
  BATTLE_CHAT,
  FRIEND,
  BATTLE_INVITE
}

class LevelInfo {
  int level = 0;
  int point = 0;
  int pointLeftForLevelUp = 0;

  LevelInfo({
    this.level = 0,
    this.point = 0,
    this.pointLeftForLevelUp = 0,
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
    this.easyBattleSuccessCount = 0,
  });
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
    this.allowBattleInvitationAlarm = false,
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
    this.weeklyExpenditure = 0,
  });

  factory Friend.fromJson(Map<String, dynamic> data) => Friend(
      level: data['level'],
      nickname: data['nickname'],
      weeklyExpenditure: data['weeklyExpenditure']);
}
