import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/icon.dart';

class BattleGuideDialog extends StatelessWidget {
  const BattleGuideDialog({super.key});

  /// [참고용] Widget 내부에 showDialog 추가하는 방법
  static Future<void> show({
    required BuildContext context,
  }) async {
    return await showDialog<void>(
      context: context,
      builder: (context) => BattleGuideDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 47, horizontal: 11),
      padding: EdgeInsets.only(
        left: 10,
        right: 7,
        bottom: 45,
        top: 14,
      ),
      decoration: BoxDecoration(
        color: CColors.gray10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: CIcon(
                  color: CColors.whiteStr,
                  icon: 'close',
                  width: 32,
                  height: 32,
                ),
              ),
            ],
          ),
          SizedBox(height: 13),
          Text(
            "규칙",
            style: CTextStyles.Title1(),
          ),
          SizedBox(height: 52),
          Text(
            "1. 배틀시간",
            style: CTextStyles.Title3(
              color: CColors.yellow,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: 46),
              Text(
                "매주 월 AM12:10 ~ 월요일 AM24:00 입니다.",
                style: CTextStyles.Body3(),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "2. 배틀 참여 방법",
            style: CTextStyles.Title3(
              color: CColors.yellow,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: 46),
              SizedBox(
                width: 249,
                child: Text(
                  """• 원하는 예산의 방을 탐색하여 배틀에 참여할 수 있습니다. 
• 원하는 예산의 방이 없다면 방만들기를 통해 직접 만들 수 있습니다. 
• 배틀은 최대 3개까지 참여 가능합니다. """,
                  style: CTextStyles.Body3(height: 20 / 14),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
