import 'package:flutter/material.dart';

class CCharacter extends StatelessWidget {
  final int level;
  final double width;
  final double height;
  const CCharacter({
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
    final characterAsset = 'assets/level/character/lv$level.png';
    return Image.asset(
      characterAsset,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}