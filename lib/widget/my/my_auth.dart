import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/audio_controller.dart';
import 'package:poorlex/libs/string.dart';
import 'package:poorlex/widget/common/icon.dart';
import 'package:poorlex/widget/common/other.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/libs/time.dart';
import 'package:poorlex/controller/user.dart';

class MyPageMyAuth extends StatefulWidget {
  const MyPageMyAuth({super.key});

  @override
  State<MyPageMyAuth> createState() => _MyPageMyAuthState();
}

class _MyPageMyAuthState extends State<MyPageMyAuth> {
  final user = Get.find<UserController>();
  final GlobalKey containerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('내 지출', style: CTextStyles.Headline()),
                  SizedBox(width: 10),
                  Obx(
                    () => Text(
                      user.userInfo?.expenditureTotalCount.toString() ?? '',
                      style: CTextStyles.Headline(color: CColors.purpleLight),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 17,
                mainAxisSpacing: 17,
                children:
                    (user.userInfo?.expenditures.take(4) ?? []).map((item) {
                  return Container(
                    child: BackgroundImageWithBlack(
                      image: NetworkImage(item.imageUrl),
                      height: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              cTimeFormat(
                                  DateTime.parse('${item.date} 00:00:00')
                                      .millisecondsSinceEpoch,
                                  'yyyy.MM.dd (E)'),
                              style:
                                  CTextStyles.Caption1(color: CColors.gray50)),
                          SizedBox(height: 13),
                          Text(
                            '${makeComma(item.amount)}원',
                            style: CTextStyles.Headline(),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Wrap(
              //         spacing: 18,
              //         runSpacing: 18,
              //         direction: Axis.horizontal,
              //         alignment: WrapAlignment.start,
              //         children: (user.userInfo?.expenditures ?? []).map<Widget>(
              //           (item) {
              //             final index =
              //                 user.userInfo?.expenditures.indexOf(item) ?? 0;
              //             return index < 4
              //                 ? CButton(
              //                     onPressed: () => Get.toNamed(
              //                       '/my/expense-detail/${item.id}',
              //                     ),
              //                     child: Container(
              //                       child: BackgroundImageWithBlack(
              //                         image: NetworkImage(item.imageUrl),
              //                         height: 153,
              //                         child: Column(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.center,
              //                           children: [
              //                             Text(
              //                                 cTimeFormat(
              //                                     DateTime.parse(
              //                                             '${item.date} 00:00:00')
              //                                         .millisecondsSinceEpoch,
              //                                     'yyyy.MM.dd (E)'),
              //                                 style: CTextStyles.Caption1(
              //                                     color: CColors.gray50)),
              //                             SizedBox(height: 13),
              //                             Text(
              //                               '${makeComma(item.amount)}원',
              //                               style: CTextStyles.Headline(),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   )
              //                 : SizedBox.shrink();
              //           },
              //         ).toList(),
              //       ),
              //     )
              //   ],
              // ),
              SizedBox(height: 17),
              GestureDetector(
                onTap: () {
                  AudioController().play(audioType: AudioType.complete);
                  Get.toNamed('/my/expenditure');
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CColors.yellow,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '지출 전체 보기',
                        style: CTextStyles.Body3(
                          color: CColors.yellow,
                          height: 20 / 14,
                        ),
                      ),
                      SizedBox(width: 6),
                      CIcon(
                        icon: 'arrow-game-right',
                        width: 15,
                        height: 15,
                        color: CColors.yellowStr,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
