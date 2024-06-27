import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';

class MoneyBar extends StatelessWidget {
  /// money bar Color

  ///  15 ~20
  static final Color lightGoldText = Color.fromRGBO(63, 48, 0, 1);

  ///  9 ~ 14
  static final Color silverText = Color.fromRGBO(54, 54, 54, 1);

  ///  1 ~ 8
  static final Color goldText = Color.fromRGBO(115, 41, 0, 1);

  final int money;
  final double width;

  const MoneyBar({
    super.key,
    required this.money,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final moneyToString = (money / 10000).toStringAsFixed(0);
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: _getBorderColor(money),
          width: 2,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: _getBackgroundColor(money),
          borderRadius: BorderRadius.circular(2),
          border: Border(
            top: BorderSide(
              color: _getInnerBorderColor(money),
              width: 2,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              moneyToString,
              style: width > 40
                  ? TextStyle(
                      fontSize: 28,
                      color: _getTextColor(money),
                      height: 1.0,
                      wordSpacing: -0.25,
                    )
                  : CTextStyles.Headline(
                      color: _getTextColor(money),
                    ),
            ),
            Text(
              '만원',
              style: width > 40
                  ? CTextStyles.Body3(
                      color: _getTextColor(money),
                    )
                  : CTextStyles.Caption2(
                      color: _getTextColor(money),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(int money) {
    switch (money) {
      case <= 80000:
        return Color(0xFFFFD80C);
      case <= 140000:
        return Color(0xFFCACACA);
      default:
        return Color(0xFFD7C53B);
    }
  }

  Color _getBorderColor(int money) {
    switch (money) {
      case <= 80000:
        return Color(0xFFD07309);
      case <= 140000:
        return Color(0xFF9D9995);
      default:
        return Color(0xFF8F6E00);
    }
  }

  Color _getInnerBorderColor(int money) {
    switch (money) {
      case <= 80000:
        return Color(0xFFFEFF73);
      case <= 140000:
        return Color(0xFFFCFCFC);
      default:
        return Color(0xFFFEFF73);
    }
  }

  // String _getAssetImageName(int money) {
  //   switch (money) {
  //     case <= 80000:
  //       return "assets/money_bar/gold_bg.png";
  //     case <= 140000:
  //       return "assets/money_bar/silver_bg.png";
  //     default:
  //       return "assets/money_bar/light_gold_bg.png";
  //   }
  // }

  Color _getTextColor(int money) {
    switch (money) {
      case <= 80000:
        return goldText;
      case <= 140000:
        return silverText;
      default:
        return lightGoldText;
    }
  }
}
