import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:poorlex/Controller/Layout.dart';
import 'package:poorlex/Controller/User.dart';
import 'package:poorlex/Models/User.dart';

import 'package:poorlex/Widget/Layout.dart';

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
      Get.offAndToNamed('/my');
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
