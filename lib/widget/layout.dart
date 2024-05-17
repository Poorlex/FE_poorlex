import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/controller/layout.dart';

import 'package:poorlex/widget/common/alert.dart';
import 'package:poorlex/widget/common/loading.dart';
import 'package:poorlex/widget/common/toast.dart';

class Layout extends StatefulWidget {
  final Widget child;

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
        child: Stack(
            alignment: Alignment.center,
            children: [widget.child, CAlert(), CToast(), CLoading()]));
  }
}
