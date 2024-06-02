import 'package:flutter/material.dart';

import 'package:poorlex/libs/theme.dart';

class BattleBox extends StatelessWidget {
  final List<String> sample;
  const BattleBox({
    super.key,
    required this.sample,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(color: CColors.black),
              width: 347,
              height: 144,
            ),
            Container(
              width: 341,
              height: 150,
              decoration: BoxDecoration(color: CColors.black),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // 금액 메달
                        Container(
                          width: 48,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: const Color(0xFF8F6E00),
                              width: 2,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFD7C53B),
                              borderRadius: BorderRadius.circular(2),
                              border: Border(
                                top: BorderSide(
                                  color: const Color(0xFFFEFF73),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(sample[0],
                                    style: CTextStyles.LargeTitle(
                                        color: CColors.black)),
                                Text(
                                  '만원',
                                  style: CTextStyles.Body3(
                                    color: CColors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        SizedBox(width: 18),

                        // 배틀 제목, 존버 금액
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(sample[1], style: CTextStyles.Headline()),
                            SizedBox(height: 10),
                            Text(
                              '존버 금액 : ${sample[2]} 원',
                              style: CTextStyles.Body3(
                                color: CColors.gray40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // 참여자 수, 댓글 수, 입장 버튼
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Text('${sample[3]}위/20명',
                                    style: CTextStyles.Title1()),
                                SizedBox(width: 40),
                                Icon(Icons.chat_outlined,
                                    color: CColors.white, size: 16),
                                SizedBox(width: 1),
                                Text(sample[3], style: CTextStyles.Body3()),
                              ],
                            ),
                          ],
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 1,
                              color: CColors.yellow,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(2),
                              ),
                            ),
                          ),
                          child: Text(
                            '입장',
                            style: CTextStyles.Body2(
                              color: CColors.yellow,
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
