import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poorlex/Widget/Common/icon.dart';
import 'package:poorlex/Widget/Common/user.dart';

import 'package:poorlex/Widget/Common/modal.dart';

class NoticeDetailModal extends CustomModal {
  NoticeDetailModal() {
    getData();
  }

  getData() {
    Timer(Duration(seconds: 1), () {
        child = (BuildContext context) => Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () => Navigator.pop(context), icon: CustomIcon(icon: 'arrow-left', color: '#ffffff')),
                    Text('공지상세', style: TextStyle(color: Colors.white, fontSize: 18)),
                    IconButton(onPressed: () => Navigator.pop(context), icon: CustomIcon(icon: 'option', color: '#ffffff')),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                          child: Column(
                            children: [
                              UserItem(
                                  image: Image.asset('assets/sample/user.png'),
                                  icon: Image.asset('assets/sample/sample.png'),
                                  name: '김굴비'
                              ),
                              Row(
                                children: [
                                  Text('09월 11일 오후 3:00', style: TextStyle(color: Colors.white)),
                                  SizedBox(width: 8),
                                  Text('•', style: TextStyle(color: Colors.white)),
                                  SizedBox(width: 8),
                                  CustomIcon(icon: 'eye', color: '#B265FF', width: 12, height: 8),
                                  SizedBox(width: 4),
                                  Text('1명 읽음', style: TextStyle(color: Color(0xffB265FF))),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset('assets/sample/sample2.png', fit: BoxFit.fill)
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
                            color: Color(0xff1A1A1A),
                            child: Text('''드디어 시작!!!
<<우리방규칙>>
✅ 채팅으로 출석 : 동기부여를 꼬옥 붙잡기위함
✅ 피드백 잊지않고 해주기 : 투표나 채팅시 서로 반응 꼭 해줘요..
                            ''', style: TextStyle(color: Colors.white)),
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: UserItemNameIcon(
                                      name: '김굴비', icon: Image.asset('assets/sample/sample.png'),
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: Text('화이팅!!', style: TextStyle(color: Colors.white)),
                                  )
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    child: UserItemNameIcon(
                                      name: '김굴비', icon: Image.asset('assets/sample/sample.png'),
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: Text('화이팅!!', style: TextStyle(color: Colors.white)),
                                  )
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    child: UserItemNameIcon(
                                      name: '김굴비', icon: Image.asset('assets/sample/sample.png'),
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: Text('화이팅!!', style: TextStyle(color: Colors.white)),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 16, 24, 28),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(fontSize: 16.0, color: Color(0xffCCCCCC)),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(fontSize: 16.0, color: Color(0xffCCCCCC)),
                            hintText: '댓글을 입력하세요',
                            fillColor: Color(0xff333333)
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
        );
        changedExternalState();
      });
  }
}


/*
Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('백버튼', style: TextStyle(color: Colors.white)),
                        Expanded(
                            child: Text('공지상세', style: TextStyle(color: Colors.white))
                        ),
                        Text('설정', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('이미지', style: TextStyle(color: Colors.white)),
                                      Text('아이콘', style: TextStyle(color: Colors.white)),
                                      Expanded(
                                        child: Text('김절약', style: TextStyle(color: Colors.white)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
            )

 */
