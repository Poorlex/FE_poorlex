import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Widget/Common/Buttons.dart';
import 'package:poorlex/Widget/Common/Icon.dart';

class BackgroundImageWithBlack extends StatelessWidget {
  double height;
  Widget child;
  String image;

  BackgroundImageWithBlack(
      {super.key,
      required this.height,
      required this.child,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 0,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    color: Color(0xff000000).withOpacity(0.6),
                  ),
                  child: this.child),
            )
          ],
        )
      ],
    );
  }
}

class BackgroundImageWithRemove extends StatelessWidget {
  double width;
  double height;
  FileImage image;
  void Function() onRemove;

  BackgroundImageWithRemove(
      {super.key,
      required this.width,
      required this.height,
      required this.image,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero, minimumSize: Size.zero),
        child: Stack(children: [
          Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: image, fit: BoxFit.cover))),
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                  color: CColors.black.withOpacity(0.7),
                  width: 22,
                  height: 22,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CIcon(
                            icon: 'close',
                            width: 9,
                            height: 9,
                            color: CColors.whiteStr)
                      ])))
        ]),
        onPressed: onRemove);
  }
}

class AddImageButton extends StatelessWidget {
  double width;
  double height;
  void Function() onAdd;

  AddImageButton(
      {super.key,
      required this.width,
      required this.height,
      required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return CButton(
      onPressed: () => onAdd(),
      child: Container(
        width: width,
        height: height,
        color: CColors.gray20,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CIcon(
                  icon: 'plus', width: 20, height: 20, color: CColors.whiteStr)
            ]),
      ));
  }
}

class GameBox extends StatelessWidget {
  Color? color;
  EdgeInsets? padding;
  Widget child;

  GameBox({super.key, color, padding, required this.child}) {
    this.color = color ?? CColors.white;
    this.padding = padding ?? EdgeInsets.fromLTRB(19, 14, 19, 14);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 4,
            left: 0,
            right: 0,
            bottom: 4,
            child: Container(color: color)),
        Positioned(
            top: 0,
            left: 4,
            right: 4,
            bottom: 0,
            child: Container(color: color)),
        Container(
          padding: padding,
          child: child,
        ),
      ],
    );
  }
}
