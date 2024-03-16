import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Controller/Layout.dart';

import 'package:poorlex/Widget/Common/Alert.dart';
import 'package:poorlex/Widget/Common/Loading.dart';
import 'package:poorlex/Widget/Common/Toast.dart';

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
      CToast(),
      CLoading()
    ]));
  }
}
