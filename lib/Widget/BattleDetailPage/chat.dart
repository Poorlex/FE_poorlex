import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        SingleChildScrollView(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40, height: 40, decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Color(0xffe4d4be), ),
                              child: Image.asset('assets/sample/user.png'),
                            ),
                            SizedBox(width: 6,),
                            SizedBox(width: 16, height: 16, child: Image.asset('assets/sample/sample.png')),
                            SizedBox(width: 6,),
                            Text('김굴비', style: TextStyle(color: Colors.white))
                          ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('오후 2:00', style: TextStyle(color: Colors.white))
                          ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('오후 2:00', style: TextStyle(color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
          /*
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
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

              Container(

              )
            ],
          ),
           */
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
          child: Container(
            color: color,
          )
        ),
        Positioned(
            top: 0, left: 4, right: 4, bottom: 0,
            child: Container(
              color: color,
            )
        ),
        Container(
          padding: padding,
          child: child,
        ),
      ],
    );
  }
}

