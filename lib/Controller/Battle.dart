import 'dart:ui';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/Controller/Layout.dart';
import 'package:poorlex/Controller/Api.dart';

import 'package:poorlex/Models/Battle.dart';

class BattleController extends GetxController {
  LayoutController layout = Get.find<LayoutController>();
  ApiController api = Get.find<ApiController>();
  final battleCreate = BattleCreateModel().obs;
  final ImagePicker _picker = ImagePicker();
  List<int> BudgetList = [15, 16, 17, 18, 19, 20].obs;
  List<int> oneToFive = [1, 2, 3, 4, 5].obs;
  List<int> sixToTen = [6, 7, 8, 9, 10].obs;

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
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      battleCreate.update((val) {
        val?.image = image;
      });
    }
  }

  Future<bool> saveBattle() async {
    Map<String, List<XFile>> files = {};
    if (battleCreate.value.image != null) {
      files['image'] = [battleCreate.value.image!];
    }
    layout.setIsLoading(true);
    print({
      'name': battleCreate.value.title,
      'introduction': battleCreate.value.content,
      'budget': battleCreate.value.budget,
      'maxParticipantSize': battleCreate.value.count
    });
    var ui = await api.requestMultipart(method: Methods.post, url: '/battles', body: {
      'name': battleCreate.value.title,
      'introduction': battleCreate.value.content,
      'budget': battleCreate.value.budget,
      'maxParticipantSize': battleCreate.value.count
    }, files: files);
    layout.setIsLoading(false);
    return ui.success;
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
