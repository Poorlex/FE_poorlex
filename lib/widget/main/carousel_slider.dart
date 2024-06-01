import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:poorlex/Libs/Theme.dart';

import 'package:poorlex/widget/main/battle_box.dart';
import 'package:poorlex/widget/main/empty_battle.dart';

class MainCarouselSlider extends StatefulWidget {
  const MainCarouselSlider({super.key});

  @override
  State<MainCarouselSlider> createState() => _MainCarouselSliderState();
}

class _MainCarouselSliderState extends State<MainCarouselSlider> {
  final List<List<String>> samples = [
    ['7', '빚갚고 돈모으는 절약방', '21000', '13'],
    ['4', '월급때까지 돈 모으는 방', '35000', '7'],
    ['0'],
  ];
  @override
  Widget build(BuildContext context) {
    late int idx = 0;

    void changeIndex(int number) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        idx = number;
      });
    }

    return Column(
      children: [
        // 참여 중인 배틀 텍스트
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 9,
            horizontal: 23,
          ),
          child: Text(
            '참여 중인 배틀 (${idx + 1}/3)',
            style: CTextStyles.Body3(color: CColors.black),
          ),
        ),

        // 슬라이더
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.9,
            scrollDirection: Axis.horizontal,
          ),
          items: samples.map((sample) {
            return Builder(
              builder: (BuildContext context) {
                changeIndex(samples.indexOf(sample));
                return Column(
                  children: [
                    if (sample[0] != '0') ...[
                      BattleBox(sample: sample)
                    ] else ...[
                      EmptyBattle()
                    ]
                  ],
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
