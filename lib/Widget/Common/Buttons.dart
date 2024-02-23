import 'package:flutter/material.dart';
import 'package:poorlex/Libs/Theme.dart';

enum ButtonTypes { elevated, text, outlined }

class Button extends StatelessWidget {
  ButtonTypes type = ButtonTypes.text;
  Color color = CColors.yellow;
  double radius = 0;
  void Function() onPressed = () {};
  Widget child;

  Button({
    super.key,
    type,
    color,
    radius,
    onPressed,
    required this.child,
  }){
    this.type = type ?? ButtonTypes.text;
    this.color = color ?? CColors.yellow;
    this.radius = radius ?? 0;
    this.onPressed = onPressed ?? () {};
  }

  @override
  Widget build(BuildContext context) {
    if (this.type == ButtonTypes.elevated) {
      return ElevatedButton(
        child: child,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0.0,
          side: BorderSide(width: 1.0, color: color),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
        onPressed: onPressed,
      );
    } else {
      return const Placeholder();
    }
  }
}
