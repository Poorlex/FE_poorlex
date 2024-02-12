import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:poorlex/Libs/Theme.dart';

class UserItem extends StatelessWidget {
  Image image;
  Image icon;
  String name;

  UserItem({
    super.key,
    required this.image,
    required this.icon,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(width: 40, height: 40, decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: CColors.brownLight), child:
          image,
        ),
        SizedBox(width: 6,),
        SizedBox(width: 16, height: 16, child: icon),
        SizedBox(width: 6,),
        Text(name, style: CTextStyles.Body3())
      ]
    );
  }
}

class UserItemNameIcon extends StatelessWidget {
  Image icon;
  String name;

  UserItemNameIcon({
    super.key,
    required this.icon,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(width: 16, height: 16, child: icon),
      SizedBox(width: 6,),
      Text(name, style: CTextStyles.Body3(color: CColors.purpleLight))
    ]
    );
  }
}

class Level {
  String image;
  String label;
  Level({
    required this.image,
    required this.label
  });
}

class LevelProfile extends StatelessWidget {
  int level;
  int size = 120;
  bool isText = true;
  var levels = [
    Level(image: 'assets/level/profile/lv1.png', label: '거린이'),
    Level(image: 'assets/level/profile/lv2.png', label: '거저씨'),
    Level(image: 'assets/level/profile/lv3.png', label: '고수거지'),
    Level(image: 'assets/level/profile/lv4.png', label: '낭비킬러'),
    Level(image: 'assets/level/profile/lv5.png', label: '거지왕')
  ];

  LevelProfile({
    super.key,
    size,
    isText,
    required this.level
  }) {
    this.size = size ?? 120;
    this.isText = isText == null ? true : isText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: size.toDouble(), height: size.toDouble(),
      child:
        Stack(
          children: [
            Positioned(top: 4, left: 0, right: 0, bottom: 4, child:
              Container(color: CColors.brownLight)
            ),
            Positioned(top: 0, left: 4, right: 4, bottom: 0, child:
              Container(color: CColors.brownLight)
            ),
            Positioned(left: -37, top: 8, child:
              Transform.rotate(angle: -45 * math.pi / 180, child:
                Container(width: size.toDouble(), decoration: BoxDecoration(border: Border.all(color: CColors.yellowDark, width: 4)), child:
                  Container(padding: EdgeInsets.all(4), color: CColors.yellow, child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(levels[level - 1].label, style: CTextStyles.Body3(color: CColors.black))
                    ]),
                  )),
              )
            ),
            Container(child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Image.asset(levels[level - 1].image, height: 95)
                ])
              ])
            )
          ]
        )
    );
  }
}
