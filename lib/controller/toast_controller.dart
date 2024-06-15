import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/main.dart';
import 'package:poorlex/widget/common/image/image_asset.dart';

enum ToastType {
  complete,
}

/// [MEMO] 싱글톤 생성 참고
class ToastController {
  // private 생성자
  ToastController._internal();
  // factory 생성자
  factory ToastController() {
    return _instance;
  }
  // 싱글톤 인스턴스를 저장할 정적 변수
  static final ToastController _instance = ToastController._internal();

  static final FToast _fToast = FToast();

  static void init() {
    _fToast.init(navigatorKey.currentContext!);
  }

  /// context가 존재하지 않는 toast (커스텀 불가)
  static Future<bool?> showToast({
    required String msg,
  }) async {
    return Fluttertoast.showToast(
      msg: msg,
    );
  }

  void showCustomToast({
    required String msg,
    ToastType toastType = ToastType.complete,
  }) {
    _fToast.showToast(
      child: _toast(msg: msg, toastType: toastType),
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(milliseconds: 1500),
    );
  }

  Widget _toast({
    required String msg,
    required ToastType toastType,
  }) {
    final String iconAsset;
    switch (toastType) {
      case ToastType.complete:
        iconAsset = "assets/toast/complete.png";
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 61,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: CColors.black.withOpacity(0.7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CImageAsset(
            name: iconAsset,
            width: 26,
            height: 26,
          ),
          SizedBox(width: 4.0),
          Text(
            msg,
            style: CTextStyles.Body2(
              height: 26 / 16,
            ),
          ),
        ],
      ),
    );
  }
}
