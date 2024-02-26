import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/Modal.dart';
import 'package:poorlex/Models/Modal.dart';

class CustomModal extends ModalRoute<void> {
  int duration = 80;
  double opacity = 1;
  Widget Function(BuildContext c) child =
      (BuildContext context) => Text('11111');

  CustomModal({duration, opacity}) {
    this.duration = duration ?? 80;
    this.opacity = opacity ?? 1;
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: this.duration);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => CColors.black.withOpacity(this.opacity);

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: child(context),
      ),
    );
  }
}

enum AlertType { closed, alert, confirm }

class CustomAlert {
  late final AlertType type;
  late final String? title;
  late final String body;
  late final void Function() submit;
  late final void Function() cancel;
  late final String submitText;
  late final String cancelText;

  CustomAlert({
    this.type = AlertType.closed,
    this.title = null,
    required this.body,
    submit,
    cancel,
    this.submitText = '확인',
    this.cancelText = '닫기'
  }) {
    this.submit = submit ?? () => Get.close(0);
    this.cancel = cancel ?? () => Get.close(0);
  }

  Future<void> builder(BuildContext context) {
    List<Widget> actions = [];
    if (type == AlertType.confirm) {
      actions.add(
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(cancelText),
            onPressed: cancel,
          )
      );
    }
    actions.add(
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(submitText),
          onPressed: submit
        )
    );

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: this.title != null ? Text(this.title!) : null,
          content: Text(this.body!),
          actions: actions
        );
      },
    );
  }
}
