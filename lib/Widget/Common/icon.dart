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
    if (icon == 'arrow-left') {
      return SvgPicture.string('''
        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 26 26" fill="none">
          <path d="M17 4L8 13L17 22" stroke="${color}" stroke-width="1.5"/>
        </svg>
      ''', width: w?.toDouble(), height: h?.toDouble());
    } else if (icon == 'arrow-game-left') {
      return SvgPicture.string('''
        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 25 25" fill="none">
          <path d="M8 12H9.5V10.5H11V9H12.5V7.5H14V6H17V7.5H15.5V9H14V10.5H12.5V12H11V13.5H12.5V15H14V16.5H15.5V18H17V19.5H14V18H12.5V16.5H11V15H9.5V13.5H8V12Z" fill="${color}"/>
        </svg>
      ''', width: w?.toDouble(), height: h?.toDouble());
    } else if (icon == 'arrow-game-right') {
      return SvgPicture.string('''
        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 25 25" fill="none">
          <path d="M17 12H15.5V10.5H14V9H12.5V7.5H11V6H8V7.5H9.5V9H11V10.5H12.5V12H14V13.5H12.5V15H11V16.5H9.5V18H8V19.5H11V18H12.5V16.5H14V15H15.5V13.5H17V12Z" fill="${color}"/>
        </svg>
      ''', width: w?.toDouble(), height: h?.toDouble());
    } else if (icon == 'option') {
      return SvgPicture.string('''
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
          <path fill-rule="evenodd" clip-rule="evenodd" d="M3.5 11H6V13.5H3.5V11ZM10.8 11H13.3V13.5H10.8V11ZM20.6001 11H18.1001V13.5H20.6001V11Z" fill="${color}"/>
        </svg>
      ''', width: w?.toDouble(), height: h?.toDouble());
    } else if (icon == 'plus') {
      return SvgPicture.string('''
        <svg width="30" height="29" viewBox="0 0 30 29" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" clip-rule="evenodd" d="M16 0H14V13.5H0.5V15.5H14V29H16V15.5H29.5V13.5H16V0Z" fill="${color}"/>
        </svg>
      ''');
    } else if (icon == 'setting') {
      return SvgPicture.string('''
        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 26 26" fill="none">
          <path d="M23.5908 9.37043L23.5867 9.36332L23.5826 9.3563L21.5304 5.90455C21.1932 5.31484 20.528 5.18092 20.0282 5.33561L20.0023 5.34364L19.977 5.35351L17.7936 6.20659C17.43 5.96116 17.047 5.73991 16.6374 5.54981L16.3123 3.31894L16.311 3.30966L16.3094 3.30042C16.2031 2.68009 15.668 2.25 15.0561 2.25H10.9439C10.3128 2.25 9.80438 2.69903 9.70134 3.30042L9.69975 3.30966L9.6984 3.31894L9.37327 5.55035C8.96247 5.74182 8.57745 5.96555 8.21825 6.20704L6.0337 5.35351L6.02235 5.34908L6.01086 5.34501C5.46601 5.15229 4.80482 5.33633 4.47988 5.90538L2.43798 9.35778L2.43686 9.35969C2.13573 9.87229 2.20987 10.5854 2.77125 10.982L4.58027 12.3516C4.5558 12.5621 4.53957 12.7822 4.53957 13C4.53957 13.2059 4.54746 13.424 4.56652 13.6426L2.73812 15.0269C2.73805 15.0269 2.73798 15.027 2.73791 15.027C2.23701 15.4062 2.11193 16.1037 2.40925 16.6296L2.41327 16.6367L2.41744 16.6437L4.46966 20.0955C4.80684 20.6852 5.47199 20.8191 5.9718 20.6644L5.99772 20.6564L6.02299 20.6465L8.2064 19.7934C8.56998 20.0388 8.95295 20.2601 9.36264 20.4502L9.68769 22.6811L9.69128 22.7057L9.69649 22.73C9.81866 23.3004 10.3078 23.75 10.9439 23.75H15.0561C15.6589 23.75 16.2151 23.3243 16.3023 22.6761L16.6266 20.4507C17.0357 20.2618 17.422 20.0411 17.7855 19.7944L19.9663 20.6465L19.9776 20.6509L19.9891 20.655C20.5337 20.8476 21.1945 20.6639 21.5196 20.0955L23.5718 16.6437L23.5767 16.6355L23.5813 16.6272C23.8824 16.0904 23.7712 15.4079 23.247 15.0237L21.4364 13.6393C21.4525 13.4311 21.4604 13.2187 21.4604 13C21.4604 12.7887 21.4526 12.5727 21.4337 12.3572L23.2619 10.9731C23.763 10.594 23.8881 9.89633 23.5908 9.37043ZM13 16C11.2741 16 9.89478 14.6289 9.89478 13C9.89478 11.3711 11.2741 10 13 10C14.7259 10 16.1052 11.3711 16.1052 13C16.1052 14.6289 14.7259 16 13 16Z" stroke="${color}" stroke-width="1.5"/>
        </svg>
      ''', width: w?.toDouble(), height: h?.toDouble());
    } else if (icon == 'ring') {
      return SvgPicture.string('''
        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 26 26" fill="none">
          <path fill-rule="evenodd" clip-rule="evenodd" d="M20.167 10.8337V18.9587H5.83366V10.8337C5.83366 6.87562 9.04229 3.66699 13.0003 3.66699C16.9584 3.66699 20.167 6.87562 20.167 10.8337ZM23.8337 20.5837L21.667 20.5837H20.167L15.167 20.5837V24.917H10.8337V20.5837L5.83366 20.5837H4.33366L2.16699 20.5837V18.9587H4.33366V10.8337C4.33366 6.04719 8.21386 2.16699 13.0003 2.16699C17.7868 2.16699 21.667 6.04719 21.667 10.8337V18.9587H23.8337V20.5837Z" fill="${color}"/>
        </svg>
      ''', width: w?.toDouble(), height: h?.toDouble());
    } else if (icon == 'ring-point') {
      return SvgPicture.string('''
        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 26 26" fill="none">
          <path fill-rule="evenodd" clip-rule="evenodd" d="M20.167 10.8337V18.9587H5.83366V10.8337C5.83366 6.87562 9.04229 3.66699 13.0003 3.66699C16.9584 3.66699 20.167 6.87562 20.167 10.8337ZM23.8337 20.5837L21.667 20.5837H20.167L15.167 20.5837V24.917H10.8337V20.5837L5.83366 20.5837H4.33366L2.16699 20.5837V18.9587H4.33366V10.8337C4.33366 6.04719 8.21386 2.16699 13.0003 2.16699C17.7868 2.16699 21.667 6.04719 21.667 10.8337V18.9587H23.8337V20.5837Z" fill="${color}"/>
          <path d="M9.83334 5.41667C9.83334 7.85592 7.85593 9.83333 5.41667 9.83333C2.97741 9.83333 1 7.85592 1 5.41667C1 2.97741 2.97741 1 5.41667 1C7.85593 1 9.83334 2.97741 9.83334 5.41667Z" fill="#E33741" stroke="black" stroke-width="2"/>
        </svg>
      ''', width: w?.toDouble(), height: h?.toDouble());
    } else if (icon == 'thumb-up') {
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
    } else if (icon == 'eye') {
      return SvgPicture.string('''
        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="8" viewBox="0 0 12 8" fill="none">
          <rect x="5" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 5 8)" fill="${color}"/>
          <rect x="7" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 7 8)" fill="${color}"/>
          <rect x="6" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 6 8)" fill="${color}"/>
          <rect x="4" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 4 8)" fill="${color}"/>
          <rect x="3" y="1" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 3 7)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 4 4)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 5 3)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 6 3)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 7 4)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 6 6)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 7 5)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 5 6)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 4 5)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 9 1)" fill="${color}"/>
          <rect x="9" y="7" width="1" height="1" transform="rotate(180 9 7)" fill="${color}"/>
          <rect x="2" y="1" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 2 7)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 10 1)" fill="${color}"/>
          <rect x="10" y="7" width="1" height="1" transform="rotate(180 10 7)" fill="${color}"/>
          <rect x="1" y="2" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(1 0 0 -1 1 6)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 11 2)" fill="${color}"/>
          <rect x="11" y="6" width="1" height="1" transform="rotate(180 11 6)" fill="${color}"/>
          <rect y="3" width="1" height="1" fill="${color}"/>
          <rect y="4" width="1" height="1" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 12 3)" fill="${color}"/>
          <rect width="1" height="1" transform="matrix(-1 0 0 1 12 4)" fill="${color}"/>
        </svg>
      ''', width: w?.toDouble(), height: h?.toDouble());
    }
    return Container();
  }
}
