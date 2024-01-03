import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  String icon;
  String? color;
  num? w;
  num? h;

  CustomIcon({
    super.key,
    color,
    width, height,
    required this.icon
  }) {
    this.color = color ?? '#000000';
    this.w = width ?? 25;
    this.h = height ?? 25;
  }

  @override
  Widget build(BuildContext context) {
    if (icon == 'thumb-up') {
      return SvgPicture.string(
        '''
        <svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect y="8" width="1" height="1" fill="${color}"/>
          <rect x="1" y="8" width="1" height="1" fill="${color}"/>
          <rect x="2" y="8" width="1" height="1" fill="${color}"/>
          <rect x="3" y="8" width="1" height="1" fill="${color}"/>
          <rect x="4" y="8" width="1" height="1" fill="${color}"/>
          <rect x="5" y="7" width="1" height="1" fill="${color}"/>
          <rect x="8" y="6" width="1" height="1" fill="${color}"/>
          <rect x="6" y="7" width="1" height="1" fill="${color}"/>
          <rect x="9" y="6" width="1" height="1" fill="${color}"/>
          <rect x="15" y="7" width="1" height="1" fill="${color}"/>
          <rect x="7" y="7" width="1" height="1" fill="${color}"/>
          <rect x="10" y="6" width="1" height="1" fill="${color}"/>
          <rect x="11" y="5" width="1" height="1" fill="${color}"/>
          <rect x="12" y="2" width="1" height="1" fill="${color}"/>
          <rect x="11" y="4" width="1" height="1" fill="${color}"/>
          <rect x="12" y="1" width="1" height="1" fill="${color}"/>
          <rect x="11" y="3" width="1" height="1" fill="${color}"/>
          <rect x="23" y="8" width="1" height="1" fill="${color}"/>
          <rect y="9" width="1" height="1" fill="${color}"/>
          <rect x="13" width="1" height="1" fill="${color}"/>
          <rect x="14" y="8" width="1" height="1" fill="${color}"/>
          <rect x="15" y="8" width="1" height="1" fill="${color}"/>
          <rect x="16" y="8" width="1" height="1" fill="${color}"/>
          <rect x="17" y="8" width="1" height="1" fill="${color}"/>
          <rect x="18" y="8" width="1" height="1" fill="${color}"/>
          <rect x="19" y="8" width="1" height="1" fill="${color}"/>
          <rect x="20" y="8" width="1" height="1" fill="${color}"/>
          <rect x="21" y="8" width="1" height="1" fill="${color}"/>
          <rect x="22" y="8" width="1" height="1" fill="${color}"/>
          <rect x="14" width="1" height="1" fill="${color}"/>
          <rect x="15" width="1" height="1" fill="${color}"/>
          <rect x="23" y="13" width="1" height="1" fill="${color}"/>
          <rect y="14" width="1" height="1" fill="${color}"/>
          <rect x="23" y="18" width="1" height="1" fill="${color}"/>
          <rect y="19" width="1" height="1" fill="${color}"/>
          <rect x="16" width="1" height="1" fill="${color}"/>
          <rect x="23" y="9" width="1" height="1" fill="${color}"/>
          <rect y="10" width="1" height="1" fill="${color}"/>
          <rect x="23" y="14" width="1" height="1" fill="${color}"/>
          <rect y="15" width="1" height="1" fill="${color}"/>
          <rect x="23" y="19" width="1" height="1" fill="${color}"/>
          <rect y="20" width="1" height="1" fill="${color}"/>
          <rect x="16" y="1" width="1" height="1" fill="${color}"/>
          <rect x="23" y="10" width="1" height="1" fill="${color}"/>
          <rect y="11" width="1" height="1" fill="${color}"/>
          <rect x="23" y="15" width="1" height="1" fill="${color}"/>
          <rect y="16" width="1" height="1" fill="${color}"/>
          <rect x="23" y="20" width="1" height="1" fill="${color}"/>
          <rect y="21" width="1" height="1" fill="${color}"/>
          <rect x="16" y="2" width="1" height="1" fill="${color}"/>
          <rect x="23" y="11" width="1" height="1" fill="${color}"/>
          <rect y="12" width="1" height="1" fill="${color}"/>
          <rect x="23" y="16" width="1" height="1" fill="${color}"/>
          <rect y="17" width="1" height="1" fill="${color}"/>
          <rect x="23" y="21" width="1" height="1" fill="${color}"/>
          <rect y="22" width="1" height="1" fill="${color}"/>
          <rect x="16" y="3" width="1" height="1" fill="${color}"/>
          <rect x="16" y="4" width="1" height="1" fill="${color}"/>
          <rect x="23" y="12" width="1" height="1" fill="${color}"/>
          <rect x="19" y="12" width="1" height="1" fill="${color}"/>
          <rect x="19" y="16" width="1" height="1" fill="${color}"/>
          <rect x="19" y="20" width="1" height="1" fill="${color}"/>
          <rect x="20" y="12" width="1" height="1" fill="${color}"/>
          <rect x="20" y="16" width="1" height="1" fill="${color}"/>
          <rect x="20" y="20" width="1" height="1" fill="${color}"/>
          <rect x="21" y="12" width="1" height="1" fill="${color}"/>
          <rect x="21" y="16" width="1" height="1" fill="${color}"/>
          <rect x="21" y="20" width="1" height="1" fill="${color}"/>
          <rect x="22" y="12" width="1" height="1" fill="${color}"/>
          <rect x="22" y="16" width="1" height="1" fill="${color}"/>
          <rect x="22" y="20" width="1" height="1" fill="${color}"/>
          <rect y="13" width="1" height="1" fill="${color}"/>
          <rect x="23" y="17" width="1" height="1" fill="${color}"/>
          <rect y="18" width="1" height="1" fill="${color}"/>
          <rect x="23" y="22" width="1" height="1" fill="${color}"/>
          <rect x="23" y="23" width="1" height="1" fill="${color}"/>
          <rect x="22" y="24" width="1" height="1" fill="${color}"/>
          <rect x="16" y="24" width="1" height="1" fill="${color}"/>
          <rect x="10" y="24" width="1" height="1" fill="${color}"/>
          <rect x="21" y="24" width="1" height="1" fill="${color}"/>
          <rect x="15" y="24" width="1" height="1" fill="${color}"/>
          <rect x="9" y="24" width="1" height="1" fill="${color}"/>
          <rect x="20" y="24" width="1" height="1" fill="${color}"/>
          <rect x="14" y="24" width="1" height="1" fill="${color}"/>
          <rect x="8" y="24" width="1" height="1" fill="${color}"/>
          <rect x="19" y="24" width="1" height="1" fill="${color}"/>
          <rect x="13" y="24" width="1" height="1" fill="${color}"/>
          <rect x="7" y="24" width="1" height="1" fill="${color}"/>
          <rect x="18" y="24" width="1" height="1" fill="${color}"/>
          <rect x="12" y="24" width="1" height="1" fill="${color}"/>
          <rect x="6" y="24" width="1" height="1" fill="${color}"/>
          <rect x="17" y="24" width="1" height="1" fill="${color}"/>
          <rect x="11" y="24" width="1" height="1" fill="${color}"/>
          <rect x="5" y="24" width="1" height="1" fill="${color}"/>
          <rect x="4" y="24" width="1" height="1" fill="${color}"/>
          <rect x="3" y="23" width="1" height="1" fill="${color}"/>
          <rect x="2" y="23" width="1" height="1" fill="${color}"/>
          <rect x="1" y="23" width="1" height="1" fill="${color}"/>
          <rect y="23" width="1" height="1" fill="${color}"/>
          <rect x="15" y="5" width="1" height="1" fill="${color}"/>
          <rect x="15" y="6" width="1" height="1" fill="${color}"/>
          </svg>
        ''', width: w?.toDouble(), height: h?.toDouble(),
      );
    } else if (icon == 'thumb-down') {
      return SvgPicture.string('''
        <svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="24" y="17" width="1" height="1" transform="rotate(-180 24 17)" fill="${color}"/>
          <rect x="23" y="17" width="1" height="1" transform="rotate(-180 23 17)" fill="${color}"/>
          <rect x="22" y="17" width="1" height="1" transform="rotate(-180 22 17)" fill="${color}"/>
          <rect x="21" y="17" width="1" height="1" transform="rotate(-180 21 17)" fill="${color}"/>
          <rect x="20" y="17" width="1" height="1" transform="rotate(-180 20 17)" fill="${color}"/>
          <rect x="19" y="18" width="1" height="1" transform="rotate(-180 19 18)" fill="${color}"/>
          <rect x="16" y="19" width="1" height="1" transform="rotate(-180 16 19)" fill="${color}"/>
          <rect x="18" y="18" width="1" height="1" transform="rotate(-180 18 18)" fill="${color}"/>
          <rect x="15" y="19" width="1" height="1" transform="rotate(-180 15 19)" fill="${color}"/>
          <rect x="9" y="18" width="1" height="1" transform="rotate(-180 9 18)" fill="${color}"/>
          <rect x="17" y="18" width="1" height="1" transform="rotate(-180 17 18)" fill="${color}"/>
          <rect x="14" y="19" width="1" height="1" transform="rotate(-180 14 19)" fill="${color}"/>
          <rect x="13" y="20" width="1" height="1" transform="rotate(-180 13 20)" fill="${color}"/>
          <rect x="12" y="23" width="1" height="1" transform="rotate(-180 12 23)" fill="${color}"/>
          <rect x="13" y="21" width="1" height="1" transform="rotate(-180 13 21)" fill="${color}"/>
          <rect x="12" y="24" width="1" height="1" transform="rotate(-180 12 24)" fill="${color}"/>
          <rect x="13" y="22" width="1" height="1" transform="rotate(-180 13 22)" fill="${color}"/>
          <rect x="1" y="17" width="1" height="1" transform="rotate(-180 1 17)" fill="${color}"/>
          <rect x="24" y="16" width="1" height="1" transform="rotate(-180 24 16)" fill="${color}"/>
          <rect x="11" y="25" width="1" height="1" transform="rotate(-180 11 25)" fill="${color}"/>
          <rect x="10" y="17" width="1" height="1" transform="rotate(-180 10 17)" fill="${color}"/>
          <rect x="9" y="17" width="1" height="1" transform="rotate(-180 9 17)" fill="${color}"/>
          <rect x="8" y="17" width="1" height="1" transform="rotate(-180 8 17)" fill="${color}"/>
          <rect x="7" y="17" width="1" height="1" transform="rotate(-180 7 17)" fill="${color}"/>
          <rect x="6" y="17" width="1" height="1" transform="rotate(-180 6 17)" fill="${color}"/>
          <rect x="5" y="17" width="1" height="1" transform="rotate(-180 5 17)" fill="${color}"/>
          <rect x="4" y="17" width="1" height="1" transform="rotate(-180 4 17)" fill="${color}"/>
          <rect x="3" y="17" width="1" height="1" transform="rotate(-180 3 17)" fill="${color}"/>
          <rect x="2" y="17" width="1" height="1" transform="rotate(-180 2 17)" fill="${color}"/>
          <rect x="10" y="25" width="1" height="1" transform="rotate(-180 10 25)" fill="${color}"/>
          <rect x="9" y="25" width="1" height="1" transform="rotate(-180 9 25)" fill="${color}"/>
          <rect x="1" y="12" width="1" height="1" transform="rotate(-180 1 12)" fill="${color}"/>
          <rect x="24" y="11" width="1" height="1" transform="rotate(-180 24 11)" fill="${color}"/>
          <rect x="1" y="7" width="1" height="1" transform="rotate(-180 1 7)" fill="${color}"/>
          <rect x="24" y="6" width="1" height="1" transform="rotate(-180 24 6)" fill="${color}"/>
          <rect x="8" y="25" width="1" height="1" transform="rotate(-180 8 25)" fill="${color}"/>
          <rect x="1" y="16" width="1" height="1" transform="rotate(-180 1 16)" fill="${color}"/>
          <rect x="24" y="15" width="1" height="1" transform="rotate(-180 24 15)" fill="${color}"/>
          <rect x="1" y="11" width="1" height="1" transform="rotate(-180 1 11)" fill="${color}"/>
          <rect x="24" y="10" width="1" height="1" transform="rotate(-180 24 10)" fill="${color}"/>
          <rect x="1" y="6" width="1" height="1" transform="rotate(-180 1 6)" fill="${color}"/>
          <rect x="24" y="5" width="1" height="1" transform="rotate(-180 24 5)" fill="${color}"/>
          <rect x="8" y="24" width="1" height="1" transform="rotate(-180 8 24)" fill="${color}"/>
          <rect x="1" y="15" width="1" height="1" transform="rotate(-180 1 15)" fill="${color}"/>
          <rect x="24" y="14" width="1" height="1" transform="rotate(-180 24 14)" fill="${color}"/>
          <rect x="1" y="10" width="1" height="1" transform="rotate(-180 1 10)" fill="${color}"/>
          <rect x="24" y="9" width="1" height="1" transform="rotate(-180 24 9)" fill="${color}"/>
          <rect x="1" y="5" width="1" height="1" transform="rotate(-180 1 5)" fill="${color}"/>
          <rect x="24" y="4" width="1" height="1" transform="rotate(-180 24 4)" fill="${color}"/>
          <rect x="8" y="23" width="1" height="1" transform="rotate(-180 8 23)" fill="${color}"/>
          <rect x="1" y="14" width="1" height="1" transform="rotate(-180 1 14)" fill="${color}"/>
          <rect x="24" y="13" width="1" height="1" transform="rotate(-180 24 13)" fill="${color}"/>
          <rect x="1" y="9" width="1" height="1" transform="rotate(-180 1 9)" fill="${color}"/>
          <rect x="24" y="8" width="1" height="1" transform="rotate(-180 24 8)" fill="${color}"/>
          <rect x="1" y="4" width="1" height="1" transform="rotate(-180 1 4)" fill="${color}"/>
          <rect x="24" y="3" width="1" height="1" transform="rotate(-180 24 3)" fill="${color}"/>
          <rect x="8" y="22" width="1" height="1" transform="rotate(-180 8 22)" fill="${color}"/>
          <rect x="8" y="21" width="1" height="1" transform="rotate(-180 8 21)" fill="${color}"/>
          <rect x="1" y="13" width="1" height="1" transform="rotate(-180 1 13)" fill="${color}"/>
          <rect x="5" y="13" width="1" height="1" transform="rotate(-180 5 13)" fill="${color}"/>
          <rect x="5" y="9" width="1" height="1" transform="rotate(-180 5 9)" fill="${color}"/>
          <rect x="5" y="5" width="1" height="1" transform="rotate(-180 5 5)" fill="${color}"/>
          <rect x="4" y="13" width="1" height="1" transform="rotate(-180 4 13)" fill="${color}"/>
          <rect x="4" y="9" width="1" height="1" transform="rotate(-180 4 9)" fill="${color}"/>
          <rect x="4" y="5" width="1" height="1" transform="rotate(-180 4 5)" fill="${color}"/>
          <rect x="3" y="13" width="1" height="1" transform="rotate(-180 3 13)" fill="${color}"/>
          <rect x="3" y="9" width="1" height="1" transform="rotate(-180 3 9)" fill="${color}"/>
          <rect x="3" y="5" width="1" height="1" transform="rotate(-180 3 5)" fill="${color}"/>
          <rect x="2" y="13" width="1" height="1" transform="rotate(-180 2 13)" fill="${color}"/>
          <rect x="2" y="9" width="1" height="1" transform="rotate(-180 2 9)" fill="${color}"/>
          <rect x="2" y="5" width="1" height="1" transform="rotate(-180 2 5)" fill="${color}"/>
          <rect x="24" y="12" width="1" height="1" transform="rotate(-180 24 12)" fill="${color}"/>
          <rect x="1" y="8" width="1" height="1" transform="rotate(-180 1 8)" fill="${color}"/>
          <rect x="24" y="7" width="1" height="1" transform="rotate(-180 24 7)" fill="${color}"/>
          <rect x="1" y="3" width="1" height="1" transform="rotate(-180 1 3)" fill="${color}"/>
          <rect x="1" y="2" width="1" height="1" transform="rotate(-180 1 2)" fill="${color}"/>
          <rect x="2" y="1" width="1" height="1" transform="rotate(-180 2 1)" fill="${color}"/>
          <rect x="8" y="1" width="1" height="1" transform="rotate(-180 8 1)" fill="${color}"/>
          <rect x="14" y="1" width="1" height="1" transform="rotate(-180 14 1)" fill="${color}"/>
          <rect x="3" y="1" width="1" height="1" transform="rotate(-180 3 1)" fill="${color}"/>
          <rect x="9" y="1" width="1" height="1" transform="rotate(-180 9 1)" fill="${color}"/>
          <rect x="15" y="1" width="1" height="1" transform="rotate(-180 15 1)" fill="${color}"/>
          <rect x="4" y="1" width="1" height="1" transform="rotate(-180 4 1)" fill="${color}"/>
          <rect x="10" y="1" width="1" height="1" transform="rotate(-180 10 1)" fill="${color}"/>
          <rect x="16" y="1" width="1" height="1" transform="rotate(-180 16 1)" fill="${color}"/>
          <rect x="5" y="1" width="1" height="1" transform="rotate(-180 5 1)" fill="${color}"/>
          <rect x="11" y="1" width="1" height="1" transform="rotate(-180 11 1)" fill="${color}"/>
          <rect x="17" y="1" width="1" height="1" transform="rotate(-180 17 1)" fill="${color}"/>
          <rect x="6" y="1" width="1" height="1" transform="rotate(-180 6 1)" fill="${color}"/>
          <rect x="12" y="1" width="1" height="1" transform="rotate(-180 12 1)" fill="${color}"/>
          <rect x="18" y="1" width="1" height="1" transform="rotate(-180 18 1)" fill="${color}"/>
          <rect x="7" y="1" width="1" height="1" transform="rotate(-180 7 1)" fill="${color}"/>
          <rect x="13" y="1" width="1" height="1" transform="rotate(-180 13 1)" fill="${color}"/>
          <rect x="19" y="1" width="1" height="1" transform="rotate(-180 19 1)" fill="${color}"/>
          <rect x="20" y="1" width="1" height="1" transform="rotate(-180 20 1)" fill="${color}"/>
          <rect x="21" y="2" width="1" height="1" transform="rotate(-180 21 2)" fill="${color}"/>
          <rect x="22" y="2" width="1" height="1" transform="rotate(-180 22 2)" fill="${color}"/>
          <rect x="23" y="2" width="1" height="1" transform="rotate(-180 23 2)" fill="${color}"/>
          <rect x="24" y="2" width="1" height="1" transform="rotate(-180 24 2)" fill="${color}"/>
          <rect x="9" y="20" width="1" height="1" transform="rotate(-180 9 20)" fill="${color}"/>
          <rect x="9" y="19" width="1" height="1" transform="rotate(-180 9 19)" fill="${color}"/>
        </svg>
      ''', width: w?.toDouble(), height: h?.toDouble());
    }
    return Container();
  }
}
