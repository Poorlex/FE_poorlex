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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double itemWidth = deviceWidth * 0.88;
    final double carouselHeight = 150;

    // 최근 3개의 슬라이더를 표현하기 위해 리스트를 슬라이싱
    List<MemberProgressBattleResponse> displayedBattles =
        widget.battleListInProgress.length > 3
            ? widget.battleListInProgress.sublist(0, 3)
            : widget.battleListInProgress;

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
            displayedBattles.length == 0
                ? '참여 중인 배틀 (0/3)'
                : '참여 중인 배틀 (${displayedBattles.length}/3)',
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
                setState(() {});
              },
              enableInfiniteScroll: false,
            ),
            itemCount: widget.battleListInProgress.isEmpty
                ? 1
                : (displayedBattles.length <= 2
                    ? displayedBattles.length + 1
                    : displayedBattles.length),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              if (index == widget.battleListInProgress.length &&
                  displayedBattles.length <= 2) {
                // 0~2개의 슬라이더인 경우 마지막에 '배틀 방 만들기'를 붙임
                return Container(
                  width: itemWidth,
                  child: EmptyBattle(),
                );
              } else if (index < displayedBattles.length) {
                // 일반 참여중 배틀 인덱스인 경우
                final battle = widget.battleListInProgress[index];
                return Container(
                  width: itemWidth,
                  child: Wrap(
                    children: [BattleBox(battle: battle)],
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
