import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Models/Common.dart';

class LayoutController extends GetxController {
  var isLoading = false.obs;
  var toast = Toast().obs;
  var alert = Alert().obs;

  void setIsLoading (bool loading) {
    isLoading.value = loading;
    update();
  }

  void setToast (Toast t) {
    toast.update((val) {
      val?.message = t.message;
      val?.color = t.color;
    });
    Timer(Duration(seconds: 3), () {
      toast.update((val) {
        val?.message = null;
      });
    });
  }

  void setAlert (Alert a) {
    alert.update((val) {
      val?.isOpen = a.isOpen;
      val?.type = a.type;
      val?.title = a.title;
      val?.body = a.body;
      val?.submit = a.submit;
      val?.cancel = a.cancel;
      val?.submitText = a.submitText;
      val?.cancelText = a.cancelText;
    });
  }
}