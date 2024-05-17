import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/libs/theme.dart';

import 'package:poorlex/controller/layout.dart';
import 'package:poorlex/models/common.dart';
import 'package:poorlex/widget/common/buttons.dart';

class CAlert extends StatelessWidget {
  final layout = Get.find<LayoutController>();

  CAlert({super.key});

  Future alertClose(Function? callback) async {
    if (callback != null) {
      if (await callback()) layout.setAlert(Alert(isOpen: false));
    } else
      layout.setAlert(Alert(isOpen: false));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (layout.alert.value.isOpen) {
        return Positioned.fill(
            child: Container(
                color: CColors.black.withOpacity(0.5),
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.loose,
                  children: [
                    Positioned(
                      width: 343,
                      height: 200,
                      child: Container(
                          color: CColors.gray10,
                          child: Column(children: [
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: layout.alert.value.body!))
                              ],
                            )),
                            Row(children: [
                              layout.alert.value.type == AlertType.confirm
                                  ? Expanded(
                                      flex: 1,
                                      child: CButton(
                                          onPressed: () => alertClose(
                                              layout.alert.value.cancel),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20),
                                          type: ButtonTypes.elevated,
                                          color: CColors.yellow,
                                          child: Text(
                                            layout.alert.value.cancelText!,
                                            style: CTextStyles.Headline(
                                                color: CColors.black),
                                          )))
                                  : SizedBox.shrink(),
                              Expanded(
                                  flex: 1,
                                  child: CButton(
                                      onPressed: () =>
                                          alertClose(layout.alert.value.submit),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      type: ButtonTypes.elevated,
                                      color: CColors.gray20,
                                      child: Text(
                                        layout.alert.value.submitText!,
                                        style: CTextStyles.Headline(
                                            color: CColors.gray50),
                                      ))),
                            ])
                          ])),
                    )
                  ],
                )));
      } else
        return SizedBox.shrink();
    });
  }
}
