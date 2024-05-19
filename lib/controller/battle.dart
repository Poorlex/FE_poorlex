import 'dart:ui';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/controller/image_picker.dart';
import 'package:poorlex/controller/layout.dart';

import 'package:poorlex/models/battle.dart';
import 'package:poorlex/provider/battles_provider.dart';
import 'package:poorlex/schema/finding_battle_response/finding_battle_response.dart';

class BattleController extends GetxController {
  final BattlesProvider battlesProvider;
  final LayoutController layout;
  final ImagePickerController imagePickerController;
  BattleController({
    required this.battlesProvider,
    required this.layout,
    required this.imagePickerController,
  });
  final battleCreate = BattleCreateModel().obs;

  final battleList = <FindingBattleResponse>[].obs;

  void changeCurrent(int c) {
    battleCreate.update((val) {
      val?.current = c;
    });
  }

  void changeDifficulty(EBattleDifficulty d) {
    battleCreate.update((val) {
      val?.difficulty = d;
    });
  }

  void changeBudget(int b) {
    battleCreate.update((val) {
      val?.budget = b;
    });
  }

  void changeCount(int c) {
    battleCreate.update((val) {
      val?.count = c;
    });
  }

  Future<void> getImage() async {
    final XFile? image = await imagePickerController.getImage();
    if (image != null) {
      battleCreate.update((val) {
        val?.image = image;
      });
    }
  }

  Future<bool> getBattle() async {
    final response = await battlesProvider.getAll();
    battleList.value = response ?? [];
    return false;
  }

  Future<bool> saveBattle() async {
    if (battleCreate.value.image == null) return false;
    layout.setIsLoading(true);
    final response = await battlesProvider.createBattles(
      name: battleCreate.value.title,
      introduction: battleCreate.value.content,
      budget: battleCreate.value.budget * 10000,
      maxParticipantSize: battleCreate.value.count,
      image: battleCreate.value.image!,
    );
    layout.setIsLoading(false);
    return response;
  }

  Rx<Color> budgetColor = Color(0xff999999).obs;

  // IndexTwo
  Rx<int> selectedIndexTwo = 0.obs;
  Rx<Color> indexTwoColor = Color(0xff999999).obs;

  // IndexThree
  Rx<int> selectedIndexThree = 0.obs;
  Rx<Color> indexThreeFirstColor = Color(0xff999999).obs;
  Rx<Color> indexThreeSecondColor = Color(0xff999999).obs;

  void changeBudgetColor(Color itemColor) {
    budgetColor.value = itemColor;
  }

  void indexTwoUpdate(int selected) {
    selectedIndexTwo.value = selected;
  }

  void changeIndexTwoColor(Color itemColor) {
    indexTwoColor.value = itemColor;
  }

  void changeIndexTwoColorToTen(Color itemColor) {
    indexTwoColor.value = itemColor;
  }

  void changeIndexThreeColor(int number) {
    selectedIndexThree.value = number;
    if (selectedIndexThree.value == 1) {
      indexThreeFirstColor.value = Color(0xffffd600);
      indexThreeSecondColor.value = Color(0xff999999);
    } else if (selectedIndexThree.value == 2) {
      indexThreeFirstColor.value = Color(0xff999999);
      indexThreeSecondColor.value = Color(0xffffd600);
    }
  }
}
