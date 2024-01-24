import 'package:flutter/material.dart';

class BackgroundImageWithBlack extends StatelessWidget {
  double height;
  Widget child;

  BackgroundImageWithBlack({
    super.key,
    required this.height,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0, right: 0, left: 0, bottom: 0,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/sample/sample2.png"), fit: BoxFit.cover),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(child:
            Container(
                height: height,
                decoration: BoxDecoration(
                  color: Color(0xff000000).withOpacity(0.6),
                ),
                child: this.child
            ),
            )
          ],
        )
      ],
    );
  }
}