import 'package:flutter/material.dart';

import 'package:poorlex/Widget/Common/icon.dart';
import 'package:poorlex/Widget/Common/modal.dart';

class VoteModal extends CustomModal {
  VoteModal() {
    create();
  }

  create() {
    child = (BuildContext context) => Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () => Navigator.pop(context), icon: CustomIcon(icon: 'arrow-left', color: '#ffffff')),
              Text('공지 등록', style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(width: 55)
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(19, 26, 19, 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('고민되는 지출\n투표를 해볼까요?', style: TextStyle(color: Colors.white, fontSize: 22)),
                    SizedBox(height: 27),
                    Text('투표 내용', style: TextStyle(color: Color(0xff808080), fontSize: 14)),
                    SizedBox(height: 17),
                    TextField(
                      style: TextStyle(fontSize: 22, color: Color(0xffffffff)),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFD600), width: 2),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFD600), width: 2),
                        ),
                        hintStyle: TextStyle(fontSize: 22, color: Color(0xff666666)),
                        hintText: '투표제목 입력 (최대 12자)',
                      ),
                    ),
                    TextField(
                      style: TextStyle(fontSize: 22, color: Color(0xffffffff)),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFD600), width: 2),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFD600), width: 2),
                        ),
                        hintStyle: TextStyle(fontSize: 22, color: Color(0xff666666)),
                        hintText: '금액입력',
                      ),
                    ),
                    SizedBox(height: 27),
                    Text('투표 시간', style: TextStyle(color: Color(0xff808080), fontSize: 14)),
                    SizedBox(height: 17),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('5분', style: TextStyle(color: Color(0xff999999)),),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xff999999), width: 1.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
                            ),
                          ),
                          SizedBox(width: 16,),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('10분', style: TextStyle(color: Color(0xff999999)),),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xff999999), width: 1.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
                            ),
                          ),
                          SizedBox(width: 16,),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('20분', style: TextStyle(color: Color(0xff999999)),),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xff999999), width: 1.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
                            ),
                          ),
                          SizedBox(width: 16,),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('30분', style: TextStyle(color: Color(0xff999999)),),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xff999999), width: 1.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
                            ),
                          ),
                          SizedBox(width: 16,),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('1시간', style: TextStyle(color: Color(0xff999999)),),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xff999999), width: 1.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero
              ),
              onPressed: () {},
              child: Stack(
                children: [
                  Positioned(
                      top: 0, left: 0, right: 0, bottom: 0,
                      child: Container(color: Color(0xffFFE352))
                  ),
                  Positioned(
                      top: 6, left: 0, right: 0, bottom: 0,
                      child: Container(color: Color(0xffFFD600))
                  ),
                  Container(
                    height: 56,
                    padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('투표생성', style: TextStyle(fontSize: 20, color: Colors.black))
                      ],
                    ),
                  )
                ],
              )
          )
        ]
      )
    );
  }
}
