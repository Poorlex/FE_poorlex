import 'package:flutter/material.dart';

class CColors {
  static final Color kakaoYellow = Color(0xFFFDE500);
  static final Color yellowLight = Color(0xFFFFE352);
  static final Color yellow = Color(0xFFFFD600);
  static final Color yellowDark = Color(0xFFE2BE00);

  static final Color purpleLighter = Color(0xFFC58BFF);
  static final Color purpleLight = Color(0xFFB265FF);
  static final Color purple = Color(0xFFA030FB);

  static final Color white = Color(0xFFFFFFFF);
  static final Color gray70 = Color(0xFFE8E8E8);
  static final Color gray60 = Color(0xFFD9D9D9);
  static final Color gray50 = Color(0xFFCCCCCC);
  static final Color gray41 = Color(0xFF999999);
  static final Color gray40 = Color(0xFF808080);
  static final Color gray30 = Color(0xFF666666);
  static final Color gray20 = Color(0xFF333333);

  /// figma greyScale90 > 10으로 쓰고있음 확인필요
  static final Color gray10 = Color(0xFF1A1A1A);
  static final Color black = Color(0xFF0A0A0A);

  static final Color brownLight = Color(0xFFE4D4BE);
  static final Color brown = Color(0xFFB59767);

  static final Color orange = Color(0xFFD07309);
  static final Color orangeDark = Color(0xFF732900);
  static final Color red = Color(0xFFE05D65);
  static final Color green = Color(0xFF55E460);
  static final Color gray30Str = Color.fromRGBO(102, 102, 102, 1);

  static final String blackStr = '#0A0A0A';
  static final String yellowLightStr = '#FFE352';
  static final String yellowStr = '#FFD600';
  static final String purpleLightStr = '#B265FF';
  static final String whiteStr = '#FFFFFF';
  static final String gray10Str = '#1A1A1A';
  static final String gray40Str = '#808080';
  static final String gray70Str = '#E8E8E8';
  static final String redStr = '#E05D65';
}

class CTextStyles {
  static Color defaultColor = CColors.white;
  static TextStyle LargeTitle({Color? color, fontFamily, fontWeight, height}) =>
      TextStyle(
        fontSize: 32,
        height: height ?? 1.0,
        letterSpacing: 2.0,
        color: color ?? defaultColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      );
  static TextStyle Title1({
    Color? color,
    fontFamily,
    fontWeight,
    height,
  }) =>
      TextStyle(
        fontSize: 24,
        height: height ?? 1.0,
        letterSpacing: -0.25,
        color: color ?? defaultColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      );
  static TextStyle Title2({
    Color? color,
    fontFamily,
    fontWeight,
    height,
  }) =>
      TextStyle(
        fontSize: 22,
        height: height ?? 1.0,
        letterSpacing: -0.25,
        color: color ?? defaultColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      );
  static TextStyle Title3({
    Color? color,
    fontFamily,
    fontWeight,
    height,
  }) =>
      TextStyle(
        fontSize: 20,
        height: height ?? 1.0,
        letterSpacing: -0.25,
        color: color ?? defaultColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      );
  static TextStyle Headline({
    Color? color,
    fontFamily,
    fontWeight,
    height,
  }) =>
      TextStyle(
        fontSize: 18,
        height: height ?? 1.0,
        letterSpacing: 0,
        color: color ?? defaultColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      );
  static TextStyle Body1({
    Color? color,
    fontFamily,
    fontWeight,
    height,
  }) =>
      TextStyle(
        fontSize: 17,
        height: height ?? 1.0,
        letterSpacing: -0.25,
        color: color ?? defaultColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      );
  static TextStyle Body2({
    Color? color,
    fontFamily,
    fontWeight,
    height,
  }) =>
      TextStyle(
        fontSize: 16,
        height: height ?? 1.0,
        letterSpacing: -0.25,
        color: color ?? defaultColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      );
  static TextStyle Body3({
    Color? color,
    fontFamily,
    fontWeight,
    height,
  }) =>
      TextStyle(
        fontSize: 14,
        height: height ?? 1.0,
        letterSpacing: -0.25,
        color: color ?? defaultColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      );
  static TextStyle Caption1({
    Color? color,
    fontFamily,
    fontWeight,
    height,
  }) =>
      TextStyle(
        fontSize: 13,
        height: height ?? 1.0,
        letterSpacing: -0.25,
        color: color ?? defaultColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      );
  static TextStyle Caption2({
    Color? color,
    fontFamily,
    fontWeight,
    height,
  }) =>
      TextStyle(
        fontSize: 12,
        height: height ?? 1.0,
        letterSpacing: -0.25,
        color: color ?? defaultColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      );
}

class AppBarDesign {
  static const double height = 50;
}
