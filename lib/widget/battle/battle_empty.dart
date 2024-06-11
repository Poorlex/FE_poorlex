import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/image/image_asset.dart';

class BattleEmpty extends StatelessWidget {
  final String text;
  const BattleEmpty({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          CImageAsset(
            name: 'assets/battle_page/empty.png',
            width: 160,
            height: 160,
          ),
          SizedBox(height: 30),
          Text(
            text,
            style: CTextStyles.Title3(
              color: CColors.gray50,
            ),
          )
        ],
      ),
    );
  }
}
