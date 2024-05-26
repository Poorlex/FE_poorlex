import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/buttons.dart';

/// 페이지 pop 동작은 내부에 포함되어있습니다.
Future<bool?> confirmDialog({
  required BuildContext context,
  required String bodyText,
  required String cancelText,
  required String confirmText,
  void Function()? cancelFn,
  required void Function() confirmFn,
}) async {
  return await showDialog<bool>(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(
                  minHeight: 182,
                ),
                color: CColors.black,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  bodyText,
                  style: CTextStyles.Headline(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (cancelFn != null) {
                          cancelFn();
                        }
                      },
                      padding: EdgeInsets.symmetric(vertical: 20),
                      type: ButtonTypes.elevated,
                      color: CColors.yellow,
                      child: Text(
                        cancelText,
                        style: CTextStyles.Headline(color: CColors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        confirmFn();
                      },
                      padding: EdgeInsets.symmetric(vertical: 20),
                      type: ButtonTypes.elevated,
                      color: CColors.gray20,
                      child: Text(
                        confirmText,
                        style: CTextStyles.Headline(color: CColors.gray50),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
