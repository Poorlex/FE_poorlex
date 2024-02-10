class BattleModel {
  int PageNumber;
  int MoneyIndex;

  BattleModel({
    this.PageNumber = 0,
    this.MoneyIndex = 0,
  });
}

class BattleMakingModel {
  int BattleIndex;
  String BattleDifficulty;

  BattleMakingModel({
    this.BattleIndex = 0,
    this.BattleDifficulty = 'Easy',
  });
}
