import 'package:flutter/material.dart';

class BudgetTooltip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 242,
          height: 38,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 8,
                child: Container(
                  width: 242,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: Color(0xFFA030FA),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1)),
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 10,
                child: Container(
                  width: 214,
                  height: 26,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.90,
                        child: Text(
                          '예산을 설정해야 배틀이 가능해요!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'NeoDunggeunmo Pro',
                            fontWeight: FontWeight.w400,
                            height: 1.86,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
