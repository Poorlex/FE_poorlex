import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';

class Toast {
  late final String message;
  late final Color color;
  Toast({
    required this.message,
    Color? color
  }) {
    this.color = color ?? CColors.purple;
  }
}

class Modal {
  int modalCount = 0;
  Modal({this.modalCount = 0});
}
