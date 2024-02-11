import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:poorlex/Libs/Theme.dart';

class GoalList extends StatefulWidget {
  const GoalList({super.key});

  @override
  State<GoalList> createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  Function onClickOption = (int id, BuildContext context) {
    Function selectOption = (String mode, int id) {
      print(mode);
      print(id);
    };
    showModalBottomSheet(
      context: context,
      backgroundColor: CustomColors.black,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return OptionButtonModal(selectOption: selectOption);
      },
    );
  };

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GoalListItem(onClickOption: onClickOption),
      GoalListItem(onClickOption: onClickOption),
      GoalListItem(onClickOption: onClickOption),
      GoalListItem(onClickOption: onClickOption),
      GoalListItem(onClickOption: onClickOption),
      GoalListItem(onClickOption: onClickOption),
      GoalListItem(onClickOption: onClickOption),
      GoalListItem(onClickOption: onClickOption),
      GoalListItem(onClickOption: onClickOption),
    ]);
  }
}

class GoalListItem extends StatelessWidget {
  Function onClickOption;

  GoalListItem({
    super.key,
    required this.onClickOption
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: CustomColors.gray10, width: 1))),
      padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('에어팟 맥스 사기 🎵 ', style: CustomTextStyles.Body3()),
              SizedBox(height: 14),
              Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: CustomColors.yellow)
                    ),
                    child: Text('단기', style: CustomTextStyles.Caption2(color: CustomColors.yellow))
                ),
                SizedBox(width: 10),
                Text('500,000원', style: CustomTextStyles.Title3(color: CustomColors.yellow)),
              ]),
              SizedBox(height: 11),
              Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.string(
                  '''<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                      <circle cx="7" cy="7.00024" r="6.25" fill="#F2E3C6" stroke="#E33741" stroke-width="1.5"/>
                      <path d="M7 4.00024V7.50024H10.5" stroke="black"/>
                    </svg>''', width: 14, height: 14,
                ),
                SizedBox(width: 6),
                Text('0개월 남음', style: CustomTextStyles.Caption1(color: CustomColors.purpleLight)),
                SizedBox(width: 17),
                Text('~ 2023.11.09', style: CustomTextStyles.Caption1(color: CustomColors.gray41)),
              ])
            ])
          ),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              backgroundColor: CustomColors.gray10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,)
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
              child: SvgPicture.string(
              '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                              <g opacity="0.8">
                                <rect x="11" y="5.80005" width="2.19995" height="2.19995" fill="white"/>
                                <rect x="11" y="10.9998" width="2.19995" height="2.19995" fill="white"/>
                                <rect x="11" y="16.1995" width="2.19995" height="2.19995" fill="white"/>
                              </g>
                </svg>''',
              width: 24, height: 24,
              ),
            ),
            onPressed: () => onClickOption(111, context),
          )
        ]
      )
    );
  }
}

class OptionButtonModal extends StatelessWidget {
  Function selectOption;
  OptionButtonModal({
    super.key,
    required this.selectOption
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => print(1111),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('수정', style: CustomTextStyles.Headline())
                    ]
                ),
              )
            ),
            Expanded(
                child: TextButton(
                  onPressed: () => print(1111),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('완료', style: CustomTextStyles.Headline(color: CustomColors.green))
                      ]
                  ),
                )
            ),
            Expanded(
                child: TextButton(
                  onPressed: () => print(1111),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('삭제', style: CustomTextStyles.Headline(color: CustomColors.gray30))
                      ]
                  )
                )
            )
          ]
        )
      )
    );
  }
}


