import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';

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
    this.background = background ?? CustomColors.gray40;
    this.primary = primary ?? CustomColors.purpleLight;
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
              Text('${current}명', style: CustomTextStyles.Body3(color: primary!),)
            ],
          )
        ],
      )
    );
  }
}
