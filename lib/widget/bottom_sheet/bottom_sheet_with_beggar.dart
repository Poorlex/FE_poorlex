import 'package:flutter/material.dart';
import 'package:poorlex/controller/audio_controller.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/buttons.dart';

enum BeggarAction {
  withdrawal,
  suggestionBudget,
}

/// 거지가 포함한 바텀 시트입니다.
class BottomSheetWithBeggar extends StatefulWidget {
  final BeggarAction beggarAction;
  const BottomSheetWithBeggar({
    required this.beggarAction,
  });

  @override
  State<BottomSheetWithBeggar> createState() => _BottomSheetWithBeggarState();

  static Future<bool?> show({
    required BuildContext context,
    required BeggarAction beggarAction,
  }) async {
    return await showModalBottomSheet<bool>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return BottomSheetWithBeggar(beggarAction: beggarAction);
      },
    );
  }
}

class _BottomSheetWithBeggarState extends State<BottomSheetWithBeggar> {
  Widget _getBodyText() {
    switch (widget.beggarAction) {
      case BeggarAction.suggestionBudget:
        return _suggestionBudgetBodyText();
      case BeggarAction.withdrawal:
        return _withdrawalBodyText();
    }
  }

  List<String> _getActionText() {
    switch (widget.beggarAction) {
      case BeggarAction.suggestionBudget:
        return _suggestionBudgetActionText;
      case BeggarAction.withdrawal:
        return _withdrawalActionText;
    }
  }

  @override
  Widget build(BuildContext context) {
    final actionText = _getActionText();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            SizedBox(
              width: 140,
              height: 140,
              child: Image.asset(
                'assets/main_page/icon_profile_remove.png',
                width: 140,
                height: 140,
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          height: 397,
          decoration: BoxDecoration(color: CColors.black),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("고수거지:", style: CTextStyles.Body1()),
              SizedBox(height: 4),
              SizedBox(
                width: 300,
                child: _getBodyText(),
              ),
              SizedBox(height: 41),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CButton(
                      onPressed: () {
                        AudioController().play(audioType: AudioType.complete);
                        Navigator.of(context).pop(false);
                      },
                      padding: EdgeInsets.symmetric(vertical: 20),
                      type: ButtonTypes.elevated,
                      color: CColors.yellow,
                      child: Text(
                        actionText[0],
                        style: CTextStyles.Headline(color: CColors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    flex: 1,
                    child: CButton(
                      onPressed: () {
                        AudioController().play(audioType: AudioType.complete);
                        Navigator.of(context).pop(true);
                      },
                      padding: EdgeInsets.symmetric(vertical: 20),
                      type: ButtonTypes.elevated,
                      color: CColors.gray20,
                      child: Text(
                        actionText[1],
                        style: CTextStyles.Headline(color: CColors.gray60),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ====== BeggarAction에 따른 RichText와 ActionText를  아래에 구현합니다. ======
  // BodyText는 RichText로만 구현합니다.
  // ActionText는 길이가 2인 String입니다.

  static RichText _withdrawalBodyText() {
    return RichText(
      text: TextSpan(
        style: CTextStyles.Body1(),
        text: "회원 탈퇴 시 등록된 모든 지출내역이 삭제되고, 삭제된 데이터는 ",
        children: [
          TextSpan(
            style: CTextStyles.Body1(color: CColors.yellow),
            text: "복구할 수 없다네\n\n",
            children: [
              TextSpan(
                style: CTextStyles.Body1(),
                text: "정말 떠날텐가...?",
                children: [],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static List<String> _withdrawalActionText = ["아니요", "네 떠날게요"];

  static RichText _suggestionBudgetBodyText() {
    return RichText(
      text: TextSpan(
        style: CTextStyles.Body1(),
        text: "자네가",
        children: [
          TextSpan(
            style: CTextStyles.Body1(color: CColors.yellow),
            text: "일주일동안 쓸 돈",
            children: [
              TextSpan(
                style: CTextStyles.Body1(),
                text: "이 얼마인지 미리 정하지 않으면\n거지 배틀을 시작할 수 없다네!",
                children: [],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static List<String> _suggestionBudgetActionText = ["예산 설정하기", "다음에요"];
}
