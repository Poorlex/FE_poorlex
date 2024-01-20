import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  int total;
  int current;
  int? height;
  Color? primary;
  Color? background;

  CustomBar({
    super.key,
    height,
    background,
    primary,
    required this.total,
    required this.current
  }){
    this.height = height ?? 8;
    this.background = background ?? Color(0xff808080);
    this.primary = primary ?? Color(0xffB265FF);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                  flex: current, fit: FlexFit.tight,
                  child: Container(color: primary, height: height!.toDouble())
              ),
              Flexible(
                  flex: total - current, fit: FlexFit.tight,
                  child: Container(color: background, height: height!.toDouble())
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${current}명', style: TextStyle(color: primary),)
            ],
          )
        ],
      )
    );
  }
}
