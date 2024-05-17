import 'package:flutter/material.dart';

import 'package:poorlex/libs/theme.dart';

class Toast {
  Widget? message = null;
  late Color? color;
  Toast({this.message, Color? color}) {
    this.color = color ?? CColors.white.withOpacity(0.2);
  }
}

enum AlertType { alert, confirm }

class Alert {
  late bool isOpen = false;
  late AlertType? type;
  late String? title;
  late Widget? body;
  late Future<bool> Function()? submit;
  late bool Function()? cancel;
  late String? submitText;
  late String? cancelText;

  Alert({
    this.isOpen = false,
    this.type,
    this.title,
    this.body,
    this.submit,
    this.cancel,
    this.submitText = '확인',
    this.cancelText = '닫기',
  });
}

class Modal {
  int modalCount = 0;
  Modal({this.modalCount = 0});
}
