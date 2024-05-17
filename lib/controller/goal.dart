import 'package:get/get.dart';
import 'package:poorlex/models/goal.dart';

class GoalController extends GetxController {
  List<bool> isSelectedList = List.generate(4, (index) => false).obs;
  Rx<CreateGoalModel> goalIndexModel = CreateGoalModel().obs;

  void toggleSelection(int index) {
    isSelectedList[index] = !isSelectedList[index];
  }

  void addBattleMakingIndex() {
    goalIndexModel.value.goalIndex += 1;
  }
}
