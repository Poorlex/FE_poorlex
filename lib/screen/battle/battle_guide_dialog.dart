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
          _bulletPointText(text: "원하는 예산의 방을 탐색하여 배틀에 참여할 수 있습니다."),
          _bulletPointText(text: "원하는 예산의 방이 없다면 방만들기를 통해 직접 만들 수 있습니다. "),
          _bulletPointText(text: "배틀은 최대 3개까지 참여 가능합니다. "),
          SizedBox(height: 20),
          Text(
            "3. 배틀 규칙",
            style: CTextStyles.Title3(
              color: CColors.yellow,
            ),
          ),
          SizedBox(height: 12),
          _bulletPointText(text: "인증 사진은 각 배틀 방의 방장이 체크합니다. "),
          _bulletPointText(text: "배틀 완료 직전, 하루라도 누락된 지출이 있을 경우 중도 탈락하게 됩니다."),
          _bulletPointText(text: "중도 탈락하게 되면 포인트를 얻지 못합니다."),
        ],
      ),
    );
  }

  Widget _bulletPointText({required String text}) {
    return Row(
      children: [
        SizedBox(width: 46),
        Row(
          children: [
            Text(
              "• ",
              style: CTextStyles.Body3(height: 20 / 14),
            ),
            SizedBox(
              width: 260,
              child: Text(
                text,
                style: CTextStyles.Body3(height: 20 / 14),
              ),
            ),
          ],
        )
      ],
    );
  }
}

// • 배틀은 최대 3개까지 참여 가능합니다. 