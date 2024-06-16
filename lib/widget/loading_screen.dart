import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poorlex/controller/%08toast_controller.dart';

class LoadingScreen extends StatefulWidget {
  /// 페치지 로딩 대기시간
  final int second;
  const LoadingScreen({super.key, this.second = 2});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: widget.second), () {
      if (mounted) {
        ToastController().showCustomToast(msg: "잠시 후 다시 시도해주세요.");
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    // 위젯이 파괴될 때 타이머 취소
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
