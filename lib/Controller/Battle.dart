import 'dart:io';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:poorlex/Models/Battle.dart';

class BattleController extends GetxController {
  final battleCreate = BattleCreateModel().obs;

  void changeCurrent (int c) {
    battleCreate.update((val) {
      val?.current = c;
    });
  }




  RxList<int> BudgetList = <int>[15, 16, 17, 18, 19, 20].obs;
  Rx<int> selectedBudget = 0.obs;
  Rx<Color> budgetColor = Color(0xff999999).obs;
  // Image
  final ImagePicker _picker = ImagePicker();
  Rx<XFile?> selectedImage = Rx<XFile?>(null);

  // IndexTwo
  RxList<int> oneToFive = <int>[1, 2, 3, 4, 5].obs;
  RxList<int> sixToTen = <int>[6, 7, 8, 9, 10].obs;
  Rx<int> selectedIndexTwo = 0.obs;
  Rx<Color> indexTwoColor = Color(0xff999999).obs;

  // IndexThree
  Rx<int> selectedIndexThree = 0.obs;
  Rx<Color> indexThreeFirstColor = Color(0xff999999).obs;
  Rx<Color> indexThreeSecondColor = Color(0xff999999).obs;

  void budgetUpdate(int selected) {
    selectedBudget.value = selected;
  }

  void changeBudgetColor(Color itemColor) {
    budgetColor.value = itemColor;
  }

  Future<void> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    print(image.runtimeType);

    if (image != null) {
      selectedImage.value = image;
    } else {
      print('No image selected.');
    }
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
