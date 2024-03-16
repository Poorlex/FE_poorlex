import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Controller/Layout.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Widget/Common/Alert.dart';

class Layout extends StatefulWidget {
  Widget child;

  Layout({super.key, required this.child});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final layout = Get.find<LayoutController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(alignment: Alignment.center, children: [
      widget.child,
      CAlert(),
      Obx(() {
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
      }),
      Obx(() {
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
                    color: CColors.purple,
                  ),
                )),
          );
        } else
          return SizedBox.shrink();
      }),
    ]));
  }
}
