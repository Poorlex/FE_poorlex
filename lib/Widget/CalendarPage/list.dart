import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class List extends StatefulWidget {
  const List({super.key});

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return (
          Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(16, 14, 16, 16),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('총 지출액', style: TextStyle(color: Colors.white, fontSize: 14)),
                    Text('275,000원', style: TextStyle(color: Color(0xFFB265FF), fontSize: 18)),
                  ],
                ),
              ),
              Flexible(flex: 1, child:
                SingleChildScrollView(scrollDirection: Axis.vertical, child:
                  Column(children: [
                    WeekItem(),
                    DayItems(),
                    SizedBox(height: 1,),
                    WeekItem(),
                    DayItems(),
                    SizedBox(height: 1,),
                    WeekItem(),
                    DayItems(),
                  ]),
                ),
              )
          ])
      );
  }
}

class WeekItem extends StatelessWidget {
  const WeekItem({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 16, 10, 10), color: Color(0xFF1A1A1A),
          child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(fit: FlexFit.tight, flex: 1, child: (
                    Container(child: (
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('1주차', style: TextStyle(color: Colors.white, fontSize: 14),),
                            Text('07.03 ~ 07.09', style: TextStyle(color: Color(0xFF666666), fontSize: 14),),
                          ],)
                    ),)
                )),
                Flexible(fit: FlexFit.tight, flex: 1, child: (
                    Container(child: (
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              SvgPicture.string(
                                '''<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                                    <path d="M3.7998 8.3501H5.16347V12.8386H3.7998V8.3501Z" fill="#E8E8E8"/>
                                    <path d="M3.7998 2.5166H4.70892V7.90275H3.7998V2.5166Z" fill="#E8E8E8"/>
                                    <rect x="4.70898" y="2.5166" width="4.091" height="5.38615" fill="#E8E8E8"/>
                                    <path d="M8.7998 3.41309H12.8908L11.2999 6.10616L12.8908 8.79924H8.7998V3.41309Z" fill="#E8E8E8"/>
                                   </svg>''',
                                width: 15,
                                height: 15,
                              ),
                              SizedBox(width: 8,),
                              Text('70,000원', style: TextStyle(color: Colors.white, fontSize: 14),)
                            ],),
                            Text('-2000', style: TextStyle(color: Color(0xFFE05D65), fontSize: 14),),
                          ],)
                    ),)
                )),
                Container(
                  width: 100,
                  alignment: Alignment.topRight,
                  child: Text('-72,000원', style: TextStyle(color: Color(0xFFB265FF), fontSize: 14),),
                )
              ],
            ),
        ),
        onPressed: () => print(111),
      );
  }
}

class DayItems extends StatelessWidget {
  const DayItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DayItem(),
      Container(color: Colors.grey, child: SizedBox(height: 1)),
      DayItem(),
      Container(color: Colors.grey, child: SizedBox(height: 1)),
      DayItem(),
      Container(color: Colors.grey, child: SizedBox(height: 1)),
    ]);
  }
}

class DayItem extends StatelessWidget {
  const DayItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('월', style: TextStyle(color: Colors.white, fontSize: 15),),
                    Text('07.31', style: TextStyle(color: Colors.white, fontSize: 14),),
                  ],
                ),
              ),
              Text('-12,000원', style: TextStyle(color: Colors.white, fontSize: 15),),
            ],
          ),
    );
  }
}


