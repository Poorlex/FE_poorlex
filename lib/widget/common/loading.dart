import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/controller/layout.dart';

import 'package:poorlex/libs/theme.dart';

class CLoading extends StatelessWidget {
  const CLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = Get.find<LayoutController>();
    return Obx(() {
      if (layout.isLoading == true) {
        return Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
              color: CColors.black.withOpacity(0.7),
              child: Center(
                child: CircularProgressIndicator(
                  color: CColors.yellow,
                ),
              )),
        );
      } else
        return SizedBox.shrink();
    });
  }
}
