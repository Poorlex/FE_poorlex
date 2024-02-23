import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:poorlex/Libs/Theme.dart';

import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Common/Bar.dart';
import 'package:poorlex/Widget/Common/User.dart';
import 'package:poorlex/Widget/Common/Other.dart';

import 'package:poorlex/Widget/Battle/Detail/Notice.dart';
import 'package:poorlex/Widget/Battle/Detail/Comment.dart';
import 'package:poorlex/Widget/Battle/Detail/Vote.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.push(context, NoticeDetailModal()),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: GameBox(
                      color: CColors.gray20,
                      child: Row(
                        children: [
                          SizedBox(height: 22, width: 22, child: Image.asset('assets/battle_page/icon_notice.png')),
                          SizedBox(width: 6,),
                          Text('공지', style: CTextStyles.Body3(color: CColors.yellow)),
                          SizedBox(width: 6,),
                          Text('드디어 시작!!!...', style: CTextStyles.Body3()),
                        ]
                      )
                  )
                )
              )
            ],
          ),
          SizedBox(height: 20,),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GameBox(
                          color: CColors.gray41, padding: EdgeInsets.fromLTRB(17, 1, 17, 1),
                          child: Text('D-7 월', style: CTextStyles.Body2()),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    ChatItem(
                      align: MainAxisAlignment.start,
                      user: UserItem(
                          image: Image.asset('assets/sample/user.png'),
                          icon: Image.asset('assets/sample/sample.png'),
                          name: '김굴비'
                      ),
                      child: GameBox(
                        child: Text('김굴비 님이 입장했습니다.', style: CTextStyles.Body3(color: CColors.black)),
                      ),
                      time: TimeItem(
                        time: DateTime.now().microsecondsSinceEpoch,
                        align: MainAxisAlignment.end,
                      ),
                    ),
                    SizedBox(height: 10),
                    ChatItem(
                      align: MainAxisAlignment.end,
                      child: GameBox(
                          color: CColors.gray20,
                          child: Text('최지출 님이 입장했습니다.', style: CTextStyles.Body3(color: CColors.gray50))
                      ),
                      time: TimeItem(
                        time: DateTime.now().microsecondsSinceEpoch,
                        align: MainAxisAlignment.start,
                      ),
                    ),
                    SizedBox(height: 10),
                    ChatItem(
                      align: MainAxisAlignment.start,
                      user: UserItem(
                          image: Image.asset('assets/sample/user.png'),
                          icon: Image.asset('assets/sample/sample.png'),
                          name: '김굴비'
                      ),
                      child: GameBox(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: VoteItem(name: '버블티', money: 5000,)
                      ),
                      time: TimeItem(
                        time: DateTime.now().microsecondsSinceEpoch,
                        align: MainAxisAlignment.end,
                      ),
                    ),
                    SizedBox(height: 10),
                    ChatItem(
                        align: MainAxisAlignment.end,
                        child: GameBox(
                            color: CColors.gray20,
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: VoteResultItem(name: '버블티', money: 5000, isUp: true)
                        ),
                        time: TimeItem(
                          time: DateTime.now().microsecondsSinceEpoch,
                          align: MainAxisAlignment.start,
                        )
                    ),
                    SizedBox(height: 10),
                    ChatItem(
                      align: MainAxisAlignment.start,
                      user: UserItem(
                          image: Image.asset('assets/sample/user.png'),
                          icon: Image.asset('assets/sample/sample.png'),
                          name: '김굴비'
                      ),
                      child: GameBox(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: VoteResultItem(name: '버블티', money: 5000, isUp: false)
                      ),
                      time: TimeItem(
                        time: DateTime.now().microsecondsSinceEpoch,
                        align: MainAxisAlignment.end,
                      )
                    ),
                    SizedBox(height: 10),
                    ChatItem(
                        align: MainAxisAlignment.start,
                        user: UserItem(
                            image: Image.asset('assets/sample/user.png'),
                            icon: Image.asset('assets/sample/sample.png'),
                            name: '김굴비'
                        ),
                        child: GameBox(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: VoteAllResultItem(name: '버블티', money: 5000, upCount: 1, downCount: 2,)
                        ),
                        time: TimeItem(
                          time: DateTime.now().microsecondsSinceEpoch,
                          align: MainAxisAlignment.end,
                        )
                    ),
                    SizedBox(height: 10),
                    ChatItem(
                        align: MainAxisAlignment.start,
                        child: GameBox(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: BuyItem(
                              id: 1,
                              image: Image.asset('assets/sample/sample.png'),
                              money: 27000,
                            )
                        ),
                        time: TimeItem(
                          time: DateTime.now().microsecondsSinceEpoch,
                          align: MainAxisAlignment.end,
                        )
                    ),
                    SizedBox(height: 10),
                    ChatItem(
                        align: MainAxisAlignment.end,
                        child: GameBox(
                          color: CColors.gray20,
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: OpinionItem(
                              isAgree: false,
                              comment: Text('아픈건 어쩔수 없지만 기왕이면 소금양치하시죠', textAlign: TextAlign.center, style: CTextStyles.Title3())
                          ),
                        ),
                        time: TimeItem(
                          time: DateTime.now().microsecondsSinceEpoch,
                          align: MainAxisAlignment.start,
                        )
                    ),
                    SizedBox(height: 10),
                    ChatItem(
                        align: MainAxisAlignment.start,
                        user: UserItem(
                            image: Image.asset('assets/sample/user.png'),
                            icon: Image.asset('assets/sample/sample.png'),
                            name: '김굴비'
                        ),
                        child: GameBox(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: OpinionItem(
                              isAgree: true,
                              comment: Text('약은... 봐드릴게요.......', textAlign: TextAlign.center, style: CTextStyles.Title3(color: CColors.black))
                          ),
                        ),
                        time: TimeItem(
                          time: DateTime.now().microsecondsSinceEpoch,
                          align: MainAxisAlignment.end,
                        )
                    )
                  ]
                )
            ),
          ),
          VoteButton(isManager: true)
        ],
      ),
    );
  }
}

class VoteButton extends StatelessWidget {
  bool isManager;
  VoteButton({
    super.key,
    required this.isManager
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> w = [
      Expanded(
        child: TextButton(
            onPressed: () => Navigator.push(context, VoteModal()),
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Stack(
                children: [
                  Positioned(
                      top: 0, left: 0, right: 0, bottom: 0,
                      child: Container(color: CColors.yellowLight)
                  ),
                  Positioned(
                      top: 6, left: 0, right: 0, bottom: 0,
                      child: Container(color: CColors.yellow)
                  ),
                  Container(
                    height: 56,
                    padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 21, height: 22, child: Image.asset('assets/icons/vote.png')),
                        SizedBox(width: 8),
                        Text('투표하기', style: CTextStyles.Title3(color: CColors.black))
                      ],
                    ),
                  )
                ]
            )
        )
      )
    ];

    if (isManager) {
      w.add(TextButton(
          onPressed: () => Navigator.push(context, NoticeWriteModal()),
          style: TextButton.styleFrom(padding: EdgeInsets.zero,),
          child: Stack(
              children: [
                Positioned(
                    top: 0, left: 0, right: 0, bottom: 0,
                    child: Container(color: CColors.gray60)
                ),
                Positioned(
                    top: 6, left: 0, right: 0, bottom: 0,
                    child: Container(color: CColors.gray50)
                ),
                Container(
                  height: 56,
                  width: 70,
                  padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 21, height: 22, child: Image.asset('assets/icons/speaker.png')),
                      SizedBox(height: 2),
                      Text('공지', style: CTextStyles.Caption2(color: CColors.black))
                    ],
                  ),
                )
              ]
          )
      ));
    }

    return Row(
      children: w
    );
  }
}



class ChatItem extends StatelessWidget {
  MainAxisAlignment align;
  Widget child;
  UserItem? user;
  TimeItem time;

  ChatItem({
    super.key,
    this.user,
    required this.align,
    required this.child,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    return Row(
        mainAxisAlignment: align,
        children: [
          Container(
              width: width,
              child: Column(
                  children: [
                    user ?? Container(),
                    SizedBox(height: 10,),
                    Row(
                        children: [
                          Expanded(
                            child: child
                          )
                        ]
                    ),
                    time
                  ]
              )
          )
        ]
    );
  }
}

class OpinionItem extends StatelessWidget {
  bool isAgree;
  Text comment;

  OpinionItem({
    super.key,
    required this.isAgree,
    required this.comment
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 240,
          child: Row(
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(child:
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 40),
                              color: CColors.purpleLight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('혼나야겠어요', style: CTextStyles.Title3()),
                                  SizedBox(height: 25),
                                  SizedBox(
                                    width: 140, height: 140,
                                    child: Image.asset(isAgree ? 'assets/icons/agree.png' : 'assets/icons/disagree.png'),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      comment
                    ]
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}


class VoteResultItem extends StatelessWidget {
  String name;
  int money;
  bool isUp;

  VoteResultItem({
    super.key,
    required this.name,
    required this.money,
    required this.isUp
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: CColors.purpleLight, width: 240, padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('살까말까?', style: CTextStyles.Title3(color: CColors.black)),
                  SizedBox(height: 20),
                  SizedBox(width: 100, height: 100, child:
                    Image.asset(isUp ? 'assets/battle_page/thumb_up_big.png' : 'assets/battle_page/thumb_down_big.png'),
                  ),
                  SizedBox(height: 20),
                  Text(name, style: CTextStyles.Title3(color: CColors.black)),
                  SizedBox(height: 10),
                  Text(money.toString() + '원', style: CTextStyles.Title3(color: CColors.black)),
                ],
              ),
            )
          ],
        )
      ]
    );
  }
}

class VoteAllResultItem extends StatelessWidget {
  String name;
  int money;
  int upCount;
  int downCount;

  VoteAllResultItem({
    super.key,
    required this.name,
    required this.money,
    required this.upCount,
    required this.downCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: CColors.gray40, width: 240, padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                children: [
                  Text('살까말까?', style: CTextStyles.Title3(color: CColors.black)),
                  SizedBox(height: 20),
                  SizedBox(width: 100, height: 100, child:
                    Image.asset('assets/battle_page/vote.png'),
                  ),
                  SizedBox(height: 20),
                  Text(name, style: CTextStyles.Title3(color: CColors.black)),
                  SizedBox(height: 10),
                  Text(money.toString() + '원', style: CTextStyles.Title3(color: CColors.black)),
                ]
              )
            )
          ]
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomIcon(icon: 'thumb-up', color: '#B265FF', width: 36, height: 36),
                  SizedBox(width: 20),
                  Expanded(child: CustomBar(current: 3, total: 5))
                ],
              ),
            ),
          ]
        ),
        SizedBox(height: 20),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 240,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomIcon(icon: 'thumb-down', color: '#666666', width: 36, height: 36),
                    SizedBox(width: 20),
                    Expanded(child: CustomBar(current: 2, total: 5, primary: CColors.gray30))
                  ],
                ),
              ),
            ]
        )
      ]
    );
  }
}

class BuyItem extends StatelessWidget {
  int id;
  Image image;
  int money;

  BuyItem({
    super.key,
    required this.id,
    required this.image,
    required this.money
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 80, height: 80,
                      child: image
                  ),
                  SizedBox(height: 10),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(money.toString(), style: CTextStyles.Title3(color: CColors.black)),
                          SizedBox(height: 10),
                          CustomIcon(icon: 'flex', width: 122, height: 30, color: CColors.yellowStr)
                        ],
                      )
                  )
                ],
              )
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240,
              child: TextButton(
                  onPressed: () => Navigator.push(context, CommentModal(id: id, isAgree: false)),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero,),
                  child: Stack(
                      children: [
                        Positioned(
                            top: 0, left: 0, right: 0, bottom: 0,
                            child: Container(color: CColors.purpleLight)
                        ),
                        Positioned(
                            top: 6, left: 0, right: 0, bottom: 0,
                            child: Container(color: CColors.purpleLight)
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 26, height: 26, child: CustomIcon(icon: 'angry-face', width: 24, height: 22, color: '#ffffff')),
                              SizedBox(width: 4),
                              Text('혼내기', style: CTextStyles.Title3())
                            ],
                          ),
                        )
                      ]
                  )
              )
            )
          ]
        ),
        SizedBox(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 240,
                  child: TextButton(
                      onPressed: () {}, style: TextButton.styleFrom(padding: EdgeInsets.zero,),
                      child: Stack(
                          children: [
                            Positioned(
                                top: 0, left: 0, right: 0, bottom: 0,
                                child: Container(color: CColors.purpleLighter)
                            ),
                            Positioned(
                                top: 6, left: 0, right: 0, bottom: 0,
                                child: Container(color: CColors.purpleLight)
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 26, height: 26, child: CustomIcon(icon: 'smile-face', width: 24, height: 22, color: CColors.whiteStr)),
                                  SizedBox(width: 4),
                                  Text('칭찬하기', style: CTextStyles.Title3())
                                ],
                              ),
                            )
                          ]
                      )
                  )
              )
            ]
        ),
      ],
    );
  }
}


class VoteItem extends StatelessWidget {
  String name;
  int money;

  VoteItem({
    super.key,
    required this.name,
    required this.money
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240,
              child: Stack(children: [
                Positioned.fill(child: Container(color: CColors.yellow)),
                Positioned.fill(child: Image.asset('assets/pattern.png', repeat: ImageRepeat.repeat)),
                Container(
                  width: 240,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child:
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('살까말까?', style: CTextStyles.Title3(color: CColors.black)),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 100, height: 100,
                            child: Image.asset('assets/battle_page/vote.png'),
                          ),
                          SizedBox(height: 20),
                          Text(name, style: CTextStyles.Title3(color: CColors.black)),
                          SizedBox(height: 10),
                          Text(money.toString() + '원', style: CTextStyles.Title3(color: CColors.black)),
                        ]
                    ),
                )
              ])
            )
          ]
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240,
              child: TextButton(
                  onPressed: () {}, style: TextButton.styleFrom(padding: EdgeInsets.zero,),
                  child: Stack(
                      children: [
                        Positioned(
                            top: 0, left: 0, right: 0, bottom: 0,
                            child: Container(color: CColors.purpleLighter)
                        ),
                        Positioned(
                            top: 6, left: 0, right: 0, bottom: 0,
                            child: Container(color: CColors.purpleLight)
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 26, height: 26, child: Image.asset('assets/battle_page/thumb_up.png')),
                              SizedBox(width: 2),
                              Text('찬성', style: CTextStyles.Title3())
                            ],
                          ),
                        )
                      ]
                  )
              ),
            )
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240,
              child: TextButton(
                  onPressed: () {}, style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Stack(
                      children: [
                        Positioned(
                            top: 0, left: 0, right: 0, bottom: 0,
                            child: Container(color: CColors.purpleLighter)
                        ),
                        Positioned(
                            top: 6, left: 0, right: 0, bottom: 0,
                            child: Container(color: CColors.purpleLight)
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 26, height: 26, child: Image.asset('assets/battle_page/thumb_down.png'),),
                              SizedBox(width: 2,),
                              Text('반대', style: CTextStyles.Title3())
                            ],
                          ),
                        )
                      ]
                  )
              ),
            )
          ],
        ),
      ],
    );
  }
}


class TimeItem extends StatelessWidget {
  int time;
  MainAxisAlignment align = MainAxisAlignment.start;

  TimeItem({
    super.key,
    align,
    required this.time
  }) {
    this.align = align ?? MainAxisAlignment.start;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: align,
      children: [
        Text(DateFormat('a H:mm').format(DateTime.fromMicrosecondsSinceEpoch(time)), style: CTextStyles.Body3())
      ],
    );
  }
}


