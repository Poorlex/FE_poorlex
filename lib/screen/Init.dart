import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:poorlex/controller/layout.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/models/user.dart';

import 'package:poorlex/widget/layout.dart';

class Init extends StatefulWidget {
  Init({super.key});

  @override
  State<Init> createState() => _InitState();
}

class _InitState extends State<Init> {
  final layout = Get.find<LayoutController>();
  final user = Get.find<UserController>();

  checkAuth() async {
    layout.setIsLoading(true);
    var auth = await Hive.openBox('auth');
    if (auth.values.isEmpty) {
      Get.offAndToNamed('/login');
    } else {
      user.updateToken(UserToken(token: auth.get('token')));
      Get.offAndToNamed('/battle', id: 1);
    }
    layout.setIsLoading(false);
  }

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(child: SizedBox.shrink());
  }
}
