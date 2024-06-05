import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/controller/modal.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/libs/theme.dart';

class ShowModal extends StatefulWidget {
  const ShowModal({
    super.key,
  });

  @override
  State<ShowModal> createState() => _ShowModalState();
}

class _ShowModalState extends State<ShowModal> {
  final ModalController _modal = Get.put(ModalController());
  final UserController _user = Get.put(UserController());

  late int stageLevel = 0;

  @override
  Widget build(BuildContext context) {
    void addLevel() {
      setState(() {
        stageLevel += 1;
      });
    }

    return Column(
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
          padding: EdgeInsets.only(
            top: 16,
            left: 20,
            right: 20,
            bottom: 117,
          ),
          width: double.infinity,
          height: 397,
          decoration: BoxDecoration(color: CColors.black),

          // 텍스트, 버튼
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 고수거지
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '고수거지:',
                          style: CTextStyles.Body1(),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),

                    // 고수거지의 대사
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 첫 번째 모달
                        if (_modal.modalCount().modalCount == 0)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '반갑네 ',
                                    style: CTextStyles.Body1(),
                                  ),
                                  Text(
                                    '${_user.userInfo().nickname}!',
                                    style: CTextStyles.Title3(
                                      color: CColors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '신입 거지로 들어온 것을 환영하네.',
                                style: CTextStyles.Body1(),
                              ),
                            ],
                          ),

                        // 두 번째 모달
                        if (_modal.modalCount().modalCount == 1)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '이 동네 거지들은 모두',
                                style: CTextStyles.Body1(),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '각자 원하는 삶을 위해',
                                    style: CTextStyles.Body1(
                                      color: CColors.yellow,
                                    ),
                                  ),
                                  Text(
                                    ' 열심히 라네.',
                                    style: CTextStyles.Body1(),
                                  )
                                ],
                              ),
                              Text(
                                '힘들고 슬플 때도 있지만,',
                                style: CTextStyles.Body1(),
                              ),
                              Text(
                                '함께 웃고 웃으며 살아가고 있지.',
                                style: CTextStyles.Body1(),
                              )
                            ],
                          ),

                        // 세 번째 모달
                        if (_modal.modalCount().modalCount == 2)
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '자! 그럼 자네도 우선',
                                  style: CTextStyles.Body1(),
                                ),
                                Text(
                                  '열심히 돈을 모을 수 있도록',
                                  style:
                                      CTextStyles.Body1(color: CColors.yellow),
                                ),
                                Text(
                                  '진정 원하던 삶이 무엇인지',
                                  style: CTextStyles.Body1(),
                                ),
                                Text(
                                  '다시 돌이켜보는 시간을 가져보게나.',
                                  style: CTextStyles.Body1(),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              // 버튼
              Container(
                width: double.infinity,
                height: 52,
                child: (() {
                  // 첫 번째 버튼
                  if (_modal.modalCount().modalCount == 0) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CColors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      child: Text(
                        '안녕하세요!',
                        style: CTextStyles.Headline(
                          color: CColors.black,
                        ),
                      ),
                      onPressed: () {
                        addLevel();
                        _modal.increase();
                      },
                    );
                  }

                  // 두 번째 버튼
                  if (_modal.modalCount().modalCount == 1) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CColors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      child: Text(
                        '그렇군요!',
                        style: CTextStyles.Headline(
                          color: CColors.black,
                        ),
                      ),
                      onPressed: () {
                        addLevel();
                        _modal.increase();
                      },
                    );
                  }

                  // 세 번째 버튼
                  if (_modal.modalCount().modalCount == 2) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 알겠어요 버튼
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            height: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CColors.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                              child: Text(
                                '알겠어요',
                                style: CTextStyles.Headline(
                                  color: CColors.black,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),

                        SizedBox(width: 15),

                        // 다음에요 버튼
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            height: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CColors.gray20,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                              child: Text(
                                '다음에요',
                                style: CTextStyles.Headline(
                                  color: CColors.gray60,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                })(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
