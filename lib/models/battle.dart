import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum EBattleDifficulty { easy, normal, hard }

var hardBudget = [1, 2, 3, 4, 5, 6, 7, 8];
var normalBudget = [9, 10, 11, 12, 13, 14];
var easyBudget = [15, 16, 17, 18, 19, 20];

var hardImage =
    Image.asset(width: 22, height: 14, 'assets/my_page/icon_gold.png');
var normalImage =
    Image.asset(width: 22, height: 14, 'assets/my_page/icon_silver.png');
var easyImage =
    Image.asset(width: 22, height: 14, 'assets/my_page/icon_cooper.png');

class BattleCreateModel {
  late int current;
  late EBattleDifficulty difficulty;
  late int budget;
  late String title;
  late String content;
  late int count;
  late XFile? image;

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
