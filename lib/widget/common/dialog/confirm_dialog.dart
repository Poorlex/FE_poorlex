import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/buttons.dart';

Future<bool?> confirmDialog({
  required BuildContext context,
  required String bodyText,
  required String cancelText,
  required String confirmText,
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
                color: CColors.gray20,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  bodyText,
                  style: CTextStyles.Headline(color: CColors.gray60),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
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
                        Navigator.of(context).pop(true);
                      },
                      padding: EdgeInsets.symmetric(vertical: 20),
                      type: ButtonTypes.elevated,
                      color: CColors.gray40,
                      child: Text(
                        confirmText,
                        style: CTextStyles.Headline(color: CColors.gray60),
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
