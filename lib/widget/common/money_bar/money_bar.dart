import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';

class MoneyBar extends StatelessWidget {
  /// money bar Color

  ///  15 ~20
  static final Color lightGoldText = Color.fromRGBO(63, 48, 0, 1);

  ///  8 ~ 14
  static final Color silverText = Color.fromRGBO(54, 54, 54, 1);

  ///  1 ~ 7
  static final Color goldText = Color.fromRGBO(115, 41, 0, 1);

  final int money;
  final double width;
  final double height;
  const MoneyBar({
    super.key,
    required this.money,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final moneyToString = (money / 10000).toStringAsFixed(0);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            _getAssetImageName(money),
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            moneyToString,
            style: CTextStyles.Headline(
              color: _getTextColor(money),
            ),
          ),
          Text(
            '만원',
            style: CTextStyles.Caption2(
              color: _getTextColor(money),
            ),
          )
        ],
      ),
    );
  }

  String _getAssetImageName(int money) {
    switch (money) {
      case <= 70000:
        return "assets/money_bar/gold_bg.png";
      case <= 140000:
        return "assets/money_bar/silver_bg.png";
      default:
        return "assets/money_bar/light_gold_bg.png";
    }
  }

  Color _getTextColor(int money) {
    switch (money) {
      case <= 70000:
        return goldText;
      case <= 140000:
        return silverText;
      default:
        return lightGoldText;
    }
  }
}
