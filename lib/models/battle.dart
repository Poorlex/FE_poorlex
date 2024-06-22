import 'package:flutter/material.dart';
import 'package:poorlex/controller/image_picker.dart';

enum EBattleDifficulty { easy, normal, hard }

final hardBudget = [1, 2, 3, 4, 5, 6, 7, 8];
final normalBudget = [9, 10, 11, 12, 13, 14];
final easyBudget = [15, 16, 17, 18, 19, 20];

final hardImage = Image.asset(width: 22.4, 'assets/my_page/icon_gold.png');
final normalImage = Image.asset(width: 22.4, 'assets/my_page/icon_silver.png');
final easyImage = Image.asset(width: 22.4, 'assets/my_page/icon_cooper.png');

class BattleCreateModel {
  late int current;
  late EBattleDifficulty difficulty;
  late int budget;
  late String title;
  late String content;
  late int count;
  late FileWithName? image;

  List<int> getBudgetList() {
    if (difficulty == EBattleDifficulty.easy)
      return easyBudget;
    else if (difficulty == EBattleDifficulty.normal)
      return normalBudget;
    else
      return hardBudget;
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
