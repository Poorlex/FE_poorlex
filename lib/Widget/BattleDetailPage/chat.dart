import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ChatItem(
                color: Color(0xff333333),
                child: Row(
                  children: [
                    SizedBox(
                      height: 22, width: 22,
                      child: Image.asset('assets/battle_page/icon_notice.png')
                    ),
                    SizedBox(width: 6,),
                    Text('공지', style: TextStyle(color: Color(0xffFFD600))),
                    SizedBox(width: 6,),
                    Text('드디어 시작!!!...', style: TextStyle(color: Colors.white)),
                  ],
                )
              ),
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
                      ChatItem(
                        color: Color(0xff999999), padding: EdgeInsets.fromLTRB(17, 1, 17, 1),
                        child: Text('D-7 월', style: TextStyle(color: Colors.white, fontSize: 16)),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Container(
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            UserItem(
                                image: Image.asset('assets/sample/user.png'),
                                icon: Image.asset('assets/sample/sample.png'),
                                name: '김굴비'
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: ChatItem(
                                      child: Text('김굴비 님이 입장했습니다.', style: TextStyle(color: Colors.black)),
                                    )
                                )
                              ],
                            ),
                            TimeItem(
                              time: DateTime.now().microsecondsSinceEpoch,
                              align: MainAxisAlignment.end,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: ChatItem(
                                        color: Color(0xff333333),
                                        child: Text('최지출 님이 입장했습니다.', style: TextStyle(color: Color(0xffcccccc)))
                                    )
                                )
                              ],
                            ),
                            TimeItem(
                              time: DateTime.now().microsecondsSinceEpoch,
                              align: MainAxisAlignment.start,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                      children: [
                        Container(
                            width: width,
                            child: Column(
                              children: [
                                UserItem(
                                    image: Image.asset('assets/sample/user.png'),
                                    icon: Image.asset('assets/sample/sample.png'),
                                    name: '김굴비'
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ChatItem(
                                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                          child: VoteItem(name: '버블티', money: 5000,)
                                      ),
                                    )
                                  ],
                                ),
                                TimeItem(
                                  time: DateTime.now().microsecondsSinceEpoch,
                                  align: MainAxisAlignment.end,
                                )
                              ],
                            )
                        )
                      ]
                  )
                ],
              )
          ),
        )
      ],
    );
  }
}

class UserItem extends StatelessWidget {
  Image image;
  Image icon;
  String name;

  UserItem({
    super.key,
    required this.image,
    required this.icon,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40, height: 40, decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Color(0xffe4d4be), ),
          child: image,
        ),
        SizedBox(width: 6,),
        SizedBox(width: 16, height: 16, child: icon),
        SizedBox(width: 6,),
        Text(name, style: TextStyle(color: Colors.white))
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
              color: Color(0xffFFD600),
              width: 240,
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('살까말까?', style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 100, height: 100,
                    child: Image.asset('assets/battle_page/vote.png'),
                  ),
                  SizedBox(height: 20,),
                  Text(name, style: TextStyle(fontSize: 20),),
                  SizedBox(height: 10,),
                  Text(money.toString() + '원', style: TextStyle(fontSize: 20),),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
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
                            child: Container(color: Color(0xffc58bff))
                        ),
                        Positioned(
                            top: 6, left: 0, right: 0, bottom: 0,
                            child: Container(color: Color(0xffB265FF))
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 26, height: 26, child: Image.asset('assets/battle_page/thumb_up.png'),),
                              SizedBox(width: 2,),
                              Text('찬성', style: TextStyle(color: Colors.white, fontSize: 20),)
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
                  onPressed: () {}, style: TextButton.styleFrom(padding: EdgeInsets.zero,),
                  child: Stack(
                      children: [
                        Positioned(
                            top: 0, left: 0, right: 0, bottom: 0,
                            child: Container(color: Color(0xffc58bff))
                        ),
                        Positioned(
                            top: 6, left: 0, right: 0, bottom: 0,
                            child: Container(color: Color(0xffB265FF))
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 26, height: 26, child: Image.asset('assets/battle_page/thumb_down.png'),),
                              SizedBox(width: 2,),
                              Text('반대', style: TextStyle(color: Colors.white, fontSize: 20),)
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



class ChatItem extends StatelessWidget {
  Color? color;
  EdgeInsets? padding;
  Widget child;

  ChatItem({
    super.key,
    color,
    padding,
    required this.child
  }) {
    this.color = color ?? Color(0xffffffff);
    this.padding = padding ?? EdgeInsets.fromLTRB(19, 14, 19, 14);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 4, left: 0, right: 0, bottom: 4,
          child: Container(color: color)
        ),
        Positioned(
            top: 0, left: 4, right: 4, bottom: 0,
            child: Container(color: color)
        ),
        Container(
          padding: padding,
          child: child,
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
        Text(DateFormat('a H:mm').format(DateTime.fromMicrosecondsSinceEpoch(time)), style: TextStyle(color: Colors.white))
      ],
    );
  }
}


