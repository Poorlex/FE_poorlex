import 'package:flutter/material.dart';

import 'package:poorlex/Models/Battle.dart';
import 'package:poorlex/libs/theme.dart';

class BattleMoneyBar extends StatelessWidget {
  late final int budget;
  late final Image image;
  BattleMoneyBar({super.key, required this.budget}) {
    if (hardBudget.indexOf((budget / 10000).round()) > -1) {
      image = hardImage;
    } else if (normalBudget.indexOf((budget / 10000).round()) > -1) {
      image = normalImage;
    } else if (easyBudget.indexOf((budget / 10000).round()) > -1) {
      image = easyImage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        image,
        SizedBox(width: 8),
        Text(
          '${budget ~/ 10000}만원',
          style: CTextStyles.Body3(
            color: CColors.yellow,
            height: 22 / 14,
          ),
        ),
      ],
    );
  }
}
