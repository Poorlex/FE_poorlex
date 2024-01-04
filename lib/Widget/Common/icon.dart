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
    } else if (icon == 'flex') {
      return SvgPicture.string('''
        <svg xmlns="http://www.w3.org/2000/svg" width="122" height="30" viewBox="0 0 122 30" fill="none">
          <path d="M12.0521 18.4301H5.79463V24.9308H0V8.33333H2.94387V5H12.0521V18.4301ZM9.10819 14.7012V8.52974H5.91786V14.7012H9.10819Z" fill="${color}"/>
          <path d="M25.4817 24.9336H13.4297V8.33333H16.3736V5H25.4817V24.9336ZM22.5379 21.4011V8.52974H19.6871V21.4011H22.5379Z" fill="${color}"/>
          <path d="M39.0882 24.9336H27.0361V8.33333H29.98V5H39.0882V24.9336ZM36.1443 21.4011V8.52974H33.2936V21.4011H36.1443Z" fill="${color}"/>
          <path d="M56.0428 24.9336H53.0058V18.4329H46.8087V24.9336H40.6416V8.33333H43.9579V5H53.2523V14.834H56.0401V24.9336H56.0428ZM49.7525 14.7012V8.52974H46.9018V14.7012H49.7525Z" fill="${color}"/>
          <path d="M69.9264 24.9972H57.502V8.43287H60.8183V5.46191H63.8552V21.9626H69.9292V24.9972H69.9264Z" fill="${color}"/>
          <path d="M83.444 24.9972H71.0195V8.43293H74.3358V5.06641H83.444V8.69573H77.3701V15.296H80.5002V18.5297H77.3701V21.5643H83.444V24.9972Z" fill="${color}"/>
          <path d="M106.349 24.9972H97.2409V21.9626H93.9848V24.9999H84.6904V21.9626H87.4481V18.4301H90.8575V15.3623H87.6343V8.69566H84.6904V5.46191H90.8575V8.49926H93.8014V11.6666H97.0547V8.59608H99.9985V5.46191H106.349V8.49926H103.591V15.1659H100.152V18.2337H103.405V21.7634H106.349V24.9972Z" fill="${color}"/>
          <path fill-rule="evenodd" clip-rule="evenodd" d="M115.001 25H121.966V21.8761H115.001V25ZM121.97 16H120.001V17.4278H117.002V16H115.005L115.03 7H117.002V5H120.001V7H121.995L121.97 16ZM122.001 5.0855L122.001 5H122.001V5.0855ZM115.002 17.1931L115.001 17.4278H115.002V17.1931Z" fill="${color}"/>
        </svg>
      ''', width: w?.toDouble(), height: h?.toDouble());
    } else if (icon == 'angry-face') {
      return SvgPicture.string('''
        <svg width="24" height="22" viewBox="0 0 24 22" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="11" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 11 22)" fill="${color}"/>
          <rect x="15" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 15 22)" fill="${color}"/>
          <rect x="10" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 10 22)" fill="${color}"/>
          <rect x="8" width="1" height="1" fill="${color}"/>
          <rect x="6" y="6" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 18 6)" fill="${color}"/>
          <rect x="7" y="7" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 17 7)" fill="${color}"/>
          <rect x="8" y="7" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 16 7)" fill="${color}"/>
          <rect x="9" y="8" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 15 8)" fill="${color}"/>
          <rect x="7" y="11" width="1" height="1" fill="${color}"/>
          <rect x="7" y="12" width="1" height="1" fill="${color}"/>
          <rect x="15" y="11" width="1" height="1" fill="${color}"/>
          <rect x="15" y="12" width="1" height="1" fill="${color}"/>
          <rect x="8" y="11" width="1" height="1" fill="${color}"/>
          <rect x="8" y="12" width="1" height="1" fill="${color}"/>
          <rect x="16" y="11" width="1" height="1" fill="${color}"/>
          <rect x="16" y="12" width="1" height="1" fill="${color}"/>
          <rect x="11" y="14" width="1" height="1" fill="${color}"/>
          <rect x="12" y="14" width="1" height="1" fill="${color}"/>
          <rect x="13" y="14" width="1" height="1" fill="${color}"/>
          <rect x="10" y="16" width="1" height="1" fill="${color}"/>
          <rect x="10" y="15" width="1" height="1" fill="${color}"/>
          <rect x="14" y="16" width="1" height="1" fill="${color}"/>
          <rect x="14" y="15" width="1" height="1" fill="${color}"/>
          <rect x="14" y="17" width="1" height="1" fill="${color}"/>
          <rect x="14" y="18" width="1" height="1" fill="${color}"/>
          <rect x="12" y="19" width="1" height="1" fill="${color}"/>
          <rect x="13" y="19" width="1" height="1" fill="${color}"/>
          <rect x="11" y="19" width="1" height="1" fill="${color}"/>
          <rect x="10" y="18" width="1" height="1" fill="${color}"/>
          <rect x="10" y="17" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 8 22)" fill="${color}"/>
          <rect x="13" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 13 22)" fill="${color}"/>
          <rect x="7" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 7 22)" fill="${color}"/>
          <rect x="12" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 12 22)" fill="${color}"/>
          <rect x="16" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 16 22)" fill="${color}"/>
          <rect x="9" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 9 22)" fill="${color}"/>
          <rect x="14" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 14 22)" fill="${color}"/>
          <rect x="17" y="1" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 17 21)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 7 1)" fill="${color}"/>
          <rect x="7" y="21" width="1" height="1" transform="rotate(180 7 21)" fill="${color}"/>
          <rect x="18" y="1" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 18 21)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 6 1)" fill="${color}"/>
          <rect x="6" y="21" width="1" height="1" transform="rotate(180 6 21)" fill="${color}"/>
          <rect x="19" y="2" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 19 20)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 5 2)" fill="${color}"/>
          <rect x="5" y="20" width="1" height="1" transform="rotate(180 5 20)" fill="${color}"/>
          <rect x="20" y="3" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 20 19)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 4 3)" fill="${color}"/>
          <rect x="4" y="19" width="1" height="1" transform="rotate(180 4 19)" fill="${color}"/>
          <rect x="21" y="3" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 21 19)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 3 3)" fill="${color}"/>
          <rect x="3" y="19" width="1" height="1" transform="rotate(180 3 19)" fill="${color}"/>
          <rect x="22" y="4" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 22 18)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 2 4)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 1 7)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 24 7)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 1 10)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 24 10)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 1 13)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 24 13)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 2 5)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 23 5)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 1 8)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 24 8)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 1 11)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 24 11)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 1 14)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 24 14)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 1 6)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 24 6)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 1 9)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 24 9)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 1 12)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 24 12)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 2 15)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 23 15)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 2 16)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 23 16)" fill="${color}"/>
          <rect x="2" y="18" width="1" height="1" transform="rotate(180 2 18)" fill="${color}"/>
        </svg>
      ''', width: w?.toDouble(), height: h?.toDouble());
    } else if (icon == 'smile-face') {
      return SvgPicture.string('''
      <svg width="24" height="22" viewBox="0 0 24 22" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect x="11" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 11 22)" fill="${color}"/>
        <rect x="15" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 15 22)" fill="${color}"/>
        <rect x="10" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 10 22)" fill="${color}"/>
        <rect x="8" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 8 22)" fill="${color}"/>
        <rect x="13" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 13 22)" fill="${color}"/>
        <rect x="7" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 7 22)" fill="${color}"/>
        <rect x="12" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 12 22)" fill="${color}"/>
        <rect x="16" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 16 22)" fill="${color}"/>
        <rect x="9" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 9 22)" fill="${color}"/>
        <rect x="14" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 14 22)" fill="${color}"/>
        <rect x="17" y="1" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 17 21)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 7 1)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 8 5)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 18 5)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 6 6)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 6 8)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 16 8)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 6 12)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 16 12)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 6 13)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 16 13)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 8 8)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 18 8)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 8 12)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 18 12)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 8 13)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 18 13)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 19 15)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 7 15)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 18 15)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 6 15)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 17 16)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 5 16)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 18 17)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 6 17)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 19 17)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 7 17)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 20 16)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 8 16)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 16 6)" fill="${color}"/>
        <rect x="7" y="21" width="1" height="1" transform="rotate(180 7 21)" fill="${color}"/>
        <rect x="18" y="1" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 18 21)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 6 1)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 7 5)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 7 8)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 17 8)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 7 12)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 17 12)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 7 13)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 17 13)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 9 8)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 19 8)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 9 9)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 19 9)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 10 9)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 20 9)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 5 9)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 15 9)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 9 10)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 19 10)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 10 10)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 20 10)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 10 11)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 10 15)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 11 16)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 12 16)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 13 16)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 14 16)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 15 15)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 20 11)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 10 12)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 20 12)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 5 11)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 15 11)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 5 12)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 15 12)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 5 10)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 15 10)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 9 11)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 19 11)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 9 13)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 19 13)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 17 5)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 9 6)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 19 6)" fill="${color}"/>
        <rect x="6" y="21" width="1" height="1" transform="rotate(180 6 21)" fill="${color}"/>
        <rect x="19" y="2" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 19 20)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 5 2)" fill="${color}"/>
        <rect x="5" y="20" width="1" height="1" transform="rotate(180 5 20)" fill="${color}"/>
        <rect x="20" y="3" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 20 19)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 4 3)" fill="${color}"/>
        <rect x="4" y="19" width="1" height="1" transform="rotate(180 4 19)" fill="${color}"/>
        <rect x="21" y="3" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 21 19)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 3 3)" fill="${color}"/>
        <rect x="3" y="19" width="1" height="1" transform="rotate(180 3 19)" fill="${color}"/>
        <rect x="22" y="4" width="1" height="1" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(1 0 0 -1 22 18)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 2 4)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 1 7)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 24 7)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 1 10)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 24 10)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 1 13)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 24 13)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 2 5)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 23 5)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 1 8)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 24 8)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 1 11)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 24 11)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 1 14)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 24 14)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 1 6)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 24 6)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 1 9)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 24 9)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 1 12)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 24 12)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 2 15)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 23 15)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 2 16)" fill="${color}"/>
        <rect width="1" height="1" transform="matrix(-1 0 0 1 23 16)" fill="${color}"/>
        <rect x="2" y="18" width="1" height="1" transform="rotate(180 2 18)" fill="${color}"/>
      </svg>
       ''', width: w?.toDouble(), height: h?.toDouble());
    }
    return Container();
  }
}
