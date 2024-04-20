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
