import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';

enum ButtonTypes { elevated, text, outlined }

class CButton extends StatelessWidget {
  final ButtonTypes type;
  final Color color;
  final double radius;
  final void Function()? onPressed;
  final Widget child;
  final bool disabled;
  late final EdgeInsets padding;
  final double borderWidth = 1;

  CButton({
    super.key,
    this.type = ButtonTypes.text,
    Color? color,
    this.radius = 0,
    this.onPressed,
    this.padding = EdgeInsets.zero,
    this.disabled = false,
    required this.child,
  }) : this.color = color ?? CColors.yellow;

  @override
  Widget build(BuildContext context) {
    if (this.type == ButtonTypes.elevated) {
      return ElevatedButton(
        child: child,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: disabled ? color.withOpacity(0.5) : color,
          shadowColor: Colors.transparent,
          elevation: 0.0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // side: BorderSide(width: 1.0, color: disabled ? color.withOpacity(0.5) : color),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
        ),
        onPressed: onPressed,
      );
    } else if (this.type == ButtonTypes.text) {
      return TextButton(
          child: child,
          style: TextButton.styleFrom(
              elevation: 0.0,
              padding: padding,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          onPressed: onPressed);
    } else if (type == ButtonTypes.outlined) {
      return OutlinedButton(
          child: child,
          style: OutlinedButton.styleFrom(
            padding: padding,
            elevation: 0.0,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide(
                width: 1.0, color: disabled ? color.withOpacity(5) : color),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius)),
          ),
          onPressed: onPressed);
    } else {
      return const Placeholder();
    }
  }
}

class CButtonConfirm extends StatelessWidget {
  final Widget? child;
  final bool disabled;
  final void Function()? onPressed;

  CButtonConfirm({
    super.key,
    this.child,
    this.disabled = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CButton(
      onPressed: onPressed,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Container(color: CColors.yellowLight)),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 8,
              child: Container(color: CColors.yellow)),
          child ?? SizedBox.shrink(),
          disabled
              ? (Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Container(color: CColors.black.withOpacity(0.3)),
                ))
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
