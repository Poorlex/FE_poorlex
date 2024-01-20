import 'package:get/get.dart';
import 'package:poorlex/Models/goal_model.dart';

class GoalController extends GetxController {
  List<bool> isSelectedList = List.generate(4, (index) => false).obs;
  Rx<CreateGoalModel> goalIndexModel = CreateGoalModel().obs;

  void toggleSelection(int index) {
    isSelectedList[index] = !isSelectedList[index];
  }

  void addBattleMakingIndex() {
    // goalIndexModel.update((val) {
    //   val?.goalIndex += 1;
    // });
    goalIndexModel.value.goalIndex += 1;
  }
}
