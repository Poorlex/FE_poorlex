import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/buttons.dart';

/// buttonText 기본값은 "입력하기" 입니다.
Future<void> commonAlert({
  required BuildContext context,
  required String message,
  String? buttonText,
}) async {
  return await showDialog<void>(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Material(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                    minHeight: 182,
                  ),
                  color: CColors.gray20,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    message,
                    style: CTextStyles.Headline(color: CColors.gray60),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CButton(
                        onPressed: () => Navigator.of(context).pop(),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        type: ButtonTypes.elevated,
                        color: CColors.yellow,
                        child: Text(
                          "입력하기",
                          style: CTextStyles.Headline(color: CColors.gray10),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
