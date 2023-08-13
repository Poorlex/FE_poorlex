import 'package:get/get.dart';

import '../Models/modal_model.dart';

class ModalController extends GetxController {
  final modalCount = Modal().obs;

  void increase() {
    modalCount.update((val) {
      val?.modalCount++;
    });
  }
}
