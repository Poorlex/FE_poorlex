import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/buttons.dart';

Future<bool?> withdrawalBottomSheetWithBeggar({
  required BuildContext context,
}) async {
  return await showModalBottomSheet<bool>(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useRootNavigator: true,
    context: context,
    builder: (context) {
      return _BottomSheetWithBeggar();
    },
  );
}

class _BottomSheetWithBeggar extends StatefulWidget {
  const _BottomSheetWithBeggar();

  @override
  State<_BottomSheetWithBeggar> createState() => __BottomSheetWithBeggarState();
}

class __BottomSheetWithBeggarState extends State<_BottomSheetWithBeggar> {
  @override
  Widget build(BuildContext context) {
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
                child: RichText(
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
                ),
              ),
              SizedBox(height: 41),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      padding: EdgeInsets.symmetric(vertical: 20),
                      type: ButtonTypes.elevated,
                      color: CColors.yellow,
                      child: Text(
                        "아니요",
                        style: CTextStyles.Headline(color: CColors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    flex: 1,
                    child: CButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      padding: EdgeInsets.symmetric(vertical: 20),
                      type: ButtonTypes.elevated,
                      color: CColors.gray20,
                      child: Text(
                        "네 떠날게요",
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
}
