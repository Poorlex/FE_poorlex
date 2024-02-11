import 'package:flutter/material.dart';
import 'package:poorlex/Libs/Theme.dart';

class MainCarousel extends StatefulWidget {
  const MainCarousel({super.key});

  @override
  State<MainCarousel> createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  final List<List<String>> samples = [
    ['7', '빚갚고 돈모으는 절약방', '21000', '13'],
    ['4', '월급때까지 돈 모으는 방', '35000', '7'],
    ['2', '절약하자 절약하자', '100000', '19'],
  ];

  String nowRoom = '1';

  void changeRoom(int idx) {
    setState(() {
      idx = idx + 1;
      nowRoom = '$idx';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0), child:
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('참여 중인 배틀', style: CustomTextStyles.Body3(color: CustomColors.black)),
        Expanded(child:
          ListView.separated(scrollDirection: Axis.horizontal, physics: BouncingScrollPhysics(),
              itemBuilder: (context, idx) {
                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(height: 10),
                  Row(children: [
                    Column(children: [
                      Container(
                        decoration: BoxDecoration(color: CustomColors.black, borderRadius: BorderRadius.circular(10)),
                        width: 350, height: 170, child:
                        Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20), child:
                          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                              Column(children: [
                                Container(
                                  decoration: BoxDecoration(color: CustomColors.yellow, borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: CustomColors.orange, width: 2)
                                  ),
                                  width: 60, height: 70, child:
                                  Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                    Text(samples[idx][0], style: CustomTextStyles.LargeTitle(color: CustomColors.black)),
                                    Text('만원', style: CustomTextStyles.Title3(color: CustomColors.black))
                                  ]),
                                )
                              ]),
                              SizedBox(width: 20),
                              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(samples[idx][1], style: CustomTextStyles.Title3()),
                                  SizedBox(height: 13),
                                  Text('존버 금액 : ${samples[idx][2]} 원', style: CustomTextStyles.Caption1(color: CustomColors.white.withOpacity(0.7))),
                                ]),
                              ]),
                            ]),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Row(children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                  Text('${samples[idx][3]}위 / 20명', style: CustomTextStyles.Title1()),
                                  SizedBox(width: 20),
                                  Icon(Icons.chat_outlined, color: CustomColors.white, size: 18),
                                  Text(samples[idx][3], style: CustomTextStyles.Headline()),
                                ]),
                              ]),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(side: BorderSide(width: 1.0, color: CustomColors.yellow)), child:
                                  Text('입장', style: CustomTextStyles.Title3(color: CustomColors.yellow)),
                                  onPressed: () {},
                                )
                              )
                            ])
                          ]),
                        )
                      ),
                      SizedBox(height: 10),
                    ]),
                  ]),
                ]);
              },
              separatorBuilder: (context, index) => SizedBox(width: 5),
              itemCount: samples.length
            )
          ),
        ],
      ),
    );
  }
}
