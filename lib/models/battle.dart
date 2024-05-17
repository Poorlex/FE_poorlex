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

// {battleId: 3, name: snssjs, imageUrl: https://poorlex-images.s3.ap-northeast-2.amazonaws.com/battles/f793119a-ce64-48ad-8af5-bb8c03ded44f, difficulty: NORMAL, budget: 110000, currentParticipant: 1, maxParticipantCount: 10}
class BattleList {
  int battleId;
  String name;
  String? imageUrl;
  String difficulty;
  int budget;
  int currentParticipant;
  int maxParticipantCount;

  BattleList({
    required this.battleId,
    required this.name,
    this.imageUrl,
    required this.difficulty,
    this.budget = 0,
    this.currentParticipant = 0,
    this.maxParticipantCount = 0,
  });

  factory BattleList.fromJson(Map<String, dynamic> data) {
    return BattleList(
        battleId: data['battleId'],
        name: data['name'],
        imageUrl: data['imageUrl'],
        difficulty: data['difficulty'],
        budget: data['budget'],
        currentParticipant: data['currentParticipant'],
        maxParticipantCount: data['maxParticipantCount']);
  }
}
