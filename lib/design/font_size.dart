import 'dart:ui';

class FontColor {
  /** Primary Color */
  static final Color yellow = Color(0xFFD600);

  /** Sub Primary Color */
  static final Color purple1 = Color(0xA030FB);
  static final Color purple2 = Color(0xB265FF);

  /** Gray Scale Color */
  static final Color white = Color(0xFFFFFF);
  static final Color gray5 = Color(0xCCCCCC);
  static final Color gary4 = Color(0x808080);
  static final Color gray3 = Color(0x666666);
  static final Color gary2 = Color(0x333333);
  static final Color gray1 = Color(0x1A1A1A);
  static final Color black = Color(0x0A0A0A);
}

class FontStyle {
  static TextStyle largeTitle(Color color) {
    return TextStyle(
      fontSize: 32,
      height: 1.0,
      letterSpacing: 2.0,
      color: color,
    );
  }

  static TextStyle title1(Color color) {
    return TextStyle(
      fontSize: 24,
      height: 1.0,
      letterSpacing: -0.25,
      color: color,
    );
  }

  static TextStyle title2(Color color) {
    return TextStyle(
      fontSize: 22,
      height: 1.0,
      letterSpacing: -0.25,
      color: color,
    );
  }

  static TextStyle title3(Color color) {
    return TextStyle(
      fontSize: 20,
      height: 1.0,
      letterSpacing: -0.25,
      color: color,
    );
  }

  static TextStyle headline(Color color) {
    return TextStyle(
      fontSize: 18,
      height: 1.0,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle body1(Color color) {
    return TextStyle(
      fontSize: 18,
      height: 1.0,
      letterSpacing: -0.25,
      color: color,
    );
  }

  static TextStyle body2(Color color) {
    return TextStyle(
      fontSize: 16,
      height: 1.0,
      letterSpacing: -0.25,
      color: color,
    );
  }

  static TextStyle body3(Color color) {
    return TextStyle(
      fontSize: 14,
      height: 1.0,
      letterSpacing: -0.25,
      color: color,
    );
  }

  static TextStyle caption1(Color color) {
    return TextStyle(
      fontSize: 13,
      height: 1.0,
      letterSpacing: -0.25,
      color: color,
    );
  }

  static TextStyle caption2(Color color) {
    return TextStyle(
      fontSize: 12,
      height: 1.0,
      letterSpacing: -0.25,
      color: color,
    );
  }
}
