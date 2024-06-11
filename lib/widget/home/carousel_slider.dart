import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/controller/battle.dart';

import 'package:poorlex/widget/home/battle_box.dart';
import 'package:poorlex/widget/home/empty_battle.dart';

class MainCarouselSlider extends StatefulWidget {
  const MainCarouselSlider({super.key});

  @override
  State<MainCarouselSlider> createState() => _MainCarouselSliderState();
}

class _MainCarouselSliderState extends State<MainCarouselSlider> {
  BattleController battle = Get.find<BattleController>();

  final List<List<String>> samples = [
    ['7', '빚갚고 돈모으는 절약방', '21000', '13'],
    ['4', '월급때까지 돈 모으는 방', '35000', '7'],
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    battle.getBattle();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double itemWidth = deviceWidth * 0.88;
    final double carouselHeight = 150;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 참여 중인 배틀 텍스트
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 9,
            horizontal: 23,
          ),
          child: Text(
            '참여 중인 배틀 (${_currentIndex + 1}/${samples.length})',
            style: CTextStyles.Body3(color: CColors.black),
          ),
        ),

        // 슬라이더
        Container(
          width: double.infinity,
          height: carouselHeight,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 0.9, // 화면 너비의 80%를 차지하도록 설정
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            itemCount: samples.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final sample = samples[index];
              return Container(
                width: itemWidth,
                child: Wrap(
                  children: [
                    if (sample[0] != '0') ...[
                      BattleBox(sample: sample)
                    ] else ...[
                      EmptyBattle()
                    ]
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
