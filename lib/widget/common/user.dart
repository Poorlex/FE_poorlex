import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:poorlex/libs/theme.dart';

final imageAssetsByLevels = [
  'assets/level/profile/lv1.png',
  'assets/level/profile/lv2.png',
  'assets/level/profile/lv3.png',
  'assets/level/profile/lv4.png',
  'assets/level/profile/lv5.png',
];

/// [DELETE] 제거 대상
class UserItem extends StatelessWidget {
  final Image image;
  final Image icon;
  final String name;
  final String? description;
  final double? spaceWith;

  UserItem({
    super.key,
    required this.image,
    required this.icon,
    required this.name,
    this.description,
    this.spaceWith,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: CColors.brownLight),
          child: image,
        ),
        SizedBox(width: spaceWith ?? 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 16, height: 16, child: icon),
                SizedBox(width: 6),
                Text(name, style: CTextStyles.Body3()),
              ],
            ),
            if (description != null) ...[
              SizedBox(height: 6),
              Text(
                description!,
                style: CTextStyles.Body3(),
              )
            ]
          ],
        ),
      ],
    );
  }
}

class UserItemNameIcon extends StatelessWidget {
  final Image icon;
  final String name;

  UserItemNameIcon({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 16, height: 16, child: icon),
          SizedBox(
            width: 6,
          ),
          Text(name, style: CTextStyles.Body3(color: CColors.purpleLight))
        ]);
  }
}

class Level {
  String image;
  String label;
  Level({required this.image, required this.label});
}

class LevelProfile extends StatelessWidget {
  final int level;
  final int size;
  final bool isText;
  final levels = [
    Level(image: 'assets/level/profile/lv1.png', label: '거린이'),
    Level(image: 'assets/level/profile/lv2.png', label: '거저씨'),
    Level(image: 'assets/level/profile/lv3.png', label: '고수거지'),
    Level(image: 'assets/level/profile/lv4.png', label: '낭비킬러'),
    Level(image: 'assets/level/profile/lv5.png', label: '거지왕')
  ];

  LevelProfile({
    super.key,
    this.size = 120,
    this.isText = true,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.toDouble(),
        height: size.toDouble(),
        child: Stack(children: [
          Positioned(
              top: 4,
              left: 0,
              right: 0,
              bottom: 4,
              child: Container(color: CColors.brownLight)),
          Positioned(
              top: 0,
              left: 4,
              right: 4,
              bottom: 0,
              child: Container(color: CColors.brownLight)),
          Positioned(
              left: -37,
              top: 8,
              child: Transform.rotate(
                angle: -45 * math.pi / 180,
                child: Container(
                    width: size.toDouble(),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: CColors.yellowDark, width: 4)),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      color: CColors.yellow,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(levels[level - 1].label,
                                style: CTextStyles.Body3(color: CColors.black))
                          ]),
                    )),
              )),
          Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Image.asset(
                levels[level - 1].image,
                height: 110,
              )
            ])
          ]))
        ]));
  }
}
