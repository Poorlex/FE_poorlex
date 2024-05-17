import 'package:flutter/material.dart';

import 'package:poorlex/libs/theme.dart';

class CustomBar extends StatelessWidget {
  final int total;
  final int current;
  final int? height;
  final Color? primary;
  final Color? background;

  CustomBar({
    super.key,
    this.height = 8,
    required this.total,
    required this.current,
    Color? background,
    Color? primary,
  })  : this.primary = primary ?? CColors.purpleLight,
        this.background = background ?? CColors.gray40;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            Flexible(
                flex: current,
                fit: FlexFit.tight,
                child: Container(color: primary, height: height!.toDouble())),
            Flexible(
                flex: total - current,
                fit: FlexFit.tight,
                child:
                    Container(color: background, height: height!.toDouble())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${current}명',
              style: CTextStyles.Body3(color: primary!),
            )
          ],
        )
      ],
    ));
  }
}
