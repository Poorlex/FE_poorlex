import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/schema/member_progress_battle_response/member_progress_battle_response.dart';

import 'package:poorlex/widget/home/battle_box.dart';
import 'package:poorlex/widget/home/empty_battle.dart';

class MainCarouselSlider extends StatefulWidget {
  final List<MemberProgressBattleResponse> battleListInProgress;

  const MainCarouselSlider({
    super.key,
    required this.battleListInProgress,
  });

  @override
  State<MainCarouselSlider> createState() => _MainCarouselSliderState();
}

class _MainCarouselSliderState extends State<MainCarouselSlider> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
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
            _currentIndex == widget.battleListInProgress.length
                ? '배틀 방 만들기'
                : '참여 중인 배틀 (${_currentIndex + 1}/${widget.battleListInProgress.length})',
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
            itemCount: widget.battleListInProgress.length + 1,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              if (index == widget.battleListInProgress.length) {
                // 마지막 인덱스인 경우
                return Container(
                  width: itemWidth,
                  child: EmptyBattle(),
                );
              } else {
                // 일반 샘플 인덱스인 경우
                final battle = widget.battleListInProgress[index];
                return Container(
                  width: itemWidth,
                  child: Wrap(
                    children: [BattleBox(battle: battle)],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
