import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Controller/Layout.dart';

class CToast extends StatelessWidget {
  final layout = Get.find<LayoutController>();
  CToast({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (layout.toast.value.message != null) {
        return Positioned(
            width: 400,
            top: 100,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                color: layout.toast.value.color,
                child: Center(child: layout.toast.value.message)));
      } else
        return SizedBox.shrink();
    });
  }
}
