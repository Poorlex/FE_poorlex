import 'package:image_picker/image_picker.dart';

enum EBattleDifficulty { easy, normal, hard }

class BattleCreateModel {
  late int current;
  late EBattleDifficulty difficulty;
  late int budget;
  late String title;
  late String content;
  late int count;
  late XFile? image;

  var hard = [1, 2, 3, 4, 5, 6, 7, 8];
  var normal = [9, 10, 11, 12, 13, 14];
  var easy = [15, 16, 17, 18, 19, 20];

  List<int> getBudgetList() {
    if (difficulty == EBattleDifficulty.easy) return easy;
    else if (difficulty == EBattleDifficulty.normal) return normal;
    else return hard;
  }

  BattleCreateModel({
    this.current = 0,
    this.difficulty = EBattleDifficulty.easy,
    this.budget = 15,
    this.title = '',
    this.content = '',
    this.count = 0,
    this.image = null,
  });
}