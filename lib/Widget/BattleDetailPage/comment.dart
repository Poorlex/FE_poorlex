import 'dart:async';
import 'package:flutter/material.dart';

import 'package:poorlex/Widget/Common/icon.dart';
import 'package:poorlex/Widget/Common/modal.dart';

class CommentModal extends CustomModal {
  int id;
  bool isAgree;
  CommentModal({
    required this.id,
    required this.isAgree
  }) {
    getData();
  }

  getData() {
      child = (BuildContext context) => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: () => Navigator.pop(context),
                    icon: CustomIcon(
                        icon: 'arrow-left', color: '#ffffff')
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            isAgree ? '칭찬하기 사유' : '혼내기 사유',
                            style: TextStyle(fontSize: 14, color: Color(0xff808080))
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
                            hintText: '코멘트 입력 (30자)',
                          ),
                        ),
                      ],
                    ),
                  )
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
                              Text('완료', style: TextStyle(fontSize: 20, color: Colors.black))
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