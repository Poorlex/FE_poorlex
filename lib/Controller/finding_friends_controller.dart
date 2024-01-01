import 'package:get/get.dart';

class FindingFriendsController extends GetxController {
  RxList<bool> selectedItems = <bool>[].obs;
  RxList<List<String>> selectedFriends = <List<String>>[].obs;

  void toggleSelection(int index) {
    selectedItems[index] = !selectedItems[index];
    update();
  }

  void updateSelectedItems(List data) {
    selectedItems.value = List<bool>.filled(data.length, false);
  }

  void findingSelectedFrieds(List data) {
    for (int idx = 0; idx < selectedItems.length; idx++) {
      if (selectedItems[idx] == true) {
        selectedFriends.value.add(data[idx]);
      }
    }
  }
}
