import 'package:flutter/material.dart';
import 'package:poorlex/widget/common/image/image_asset.dart';

class LevelMedal extends StatelessWidget {
  static final assetsMedalList = [
    'assets/level/medal/lv1.png',
    'assets/level/medal/lv2.png',
    'assets/level/medal/lv3.png',
    'assets/level/medal/lv4.png',
    'assets/level/medal/lv5.png',
  ];

  final int level;
  final double size;
  const LevelMedal({super.key, required this.level, required this.size});

  @override
  Widget build(BuildContext context) {
    return CImageAsset(
      width: size,
      height: size,
      name: assetsMedalList[_getLevel(level)],
    );
  }

  int _getLevel(int value) {
    if (value >= 0 && value <= 69) {
      return 0;
    } else if (value >= 70 && value <= 189) {
      return 1;
    } else if (value >= 190 && value <= 599) {
      return 2;
    } else if (value >= 600 && value <= 1439) {
      return 3;
    } else if (value >= 1440) {
      return 4;
    } else {
      return 0;
    }
  }
}
