import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';

class CustomModal extends ModalRoute<void> {
  int duration = 80;
  double opacity = 1;
  Widget Function(BuildContext c) child = (BuildContext context) => Text('11111');

  CustomModal({
    duration, opacity
  }) {
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
  Color get barrierColor => CustomColors.black.withOpacity(this.opacity);

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
