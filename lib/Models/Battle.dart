enum EBattleDifficulty { easy, normal, hard }
enum EBattleBudget { fifteen, sixteen, seventeen, eighteen, nineteen, twelve }

class BattleCreateModel {
  late int current;
  late EBattleDifficulty difficulty;
  late EBattleBudget budget;
  late String name;
  late String description;
  late int count;

  BattleCreateModel({
    this.current = 0,
    this.difficulty = EBattleDifficulty.easy,
    this.budget = EBattleBudget.fifteen,
    this.name = '',
    this.description = '',
    this.count = 0
  });
}
