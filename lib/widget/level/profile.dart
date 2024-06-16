import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';

class CProfile extends StatelessWidget {
  final int level;
  final double width;
  final double height;
  const CProfile({
    super.key,
    required this.level,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (level < 1 && level > 5) {
      throw UnsupportedError('현재 레벨은 1~5까지만 정의되어있습니다.');
    }
    final characterAsset = 'assets/level/profile/lv$level.png';
    return Container(
      width: width,
      height: height,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: CColors.brownLight,
        borderRadius: BorderRadius.circular(1),
      ),
      child: Image.asset(
        characterAsset,
      ),
    );
  }
}
