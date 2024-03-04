import 'package:get/get.dart';

import 'package:poorlex/Models/Common.dart';

class ModalController extends GetxController {
  final modalCount = Modal().obs;

  void increase() {
    modalCount.update((val) {
      val?.modalCount++;
    });
  }
}
