import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:poorlex/Widget/Main/BattleBox.dart';
import 'package:poorlex/Widget/Main/EmptyBattle.dart';

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
        // Add Your Code here.
        idx = number;
      });
    }

    return Column(children: [
      Padding(padding: EdgeInsets.symmetric(vertical: 9, horizontal: 23), child:
        Row(children: [
          Text('참여 중인 배틀 (${idx + 1}/3)', style: TextStyle(fontSize: 14))
        ]),
      ),
      CarouselSlider(
        options: CarouselOptions(height: MediaQuery.of(context).size.height / 4, scrollDirection: Axis.horizontal, viewportFraction: 1),
        items: samples.map((sample) {
          return Builder(
            builder: (BuildContext context) {
              changeIndex(samples.indexOf(sample));
              return Column(children: [
                if (sample[0] != '0') ...[BattleBox(sample: sample)]
                else ...[EmptyBattle()]
              ]);
            },
          );
        }).toList(),
      ),
    ]);
  }
}
