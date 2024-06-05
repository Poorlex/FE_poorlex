import 'package:get/get.dart';

import 'package:poorlex/models/common.dart';

/// [MEMO] 필요없으면 제거해주세요.
class ModalController extends GetxController {
  final modalCount = Modal().obs;

  void increase() {
    modalCount.update((val) {
      val?.modalCount++;
    });
  }
}
