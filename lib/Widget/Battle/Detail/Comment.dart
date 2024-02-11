import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';

import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Common/Modal.dart';

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
                    icon: CustomIcon(icon: 'arrow-left', color: CustomColors.whiteStr)
                ),
                SizedBox(height: 26),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            isAgree ? '칭찬하기 사유' : '혼내기 사유',
                            style: CustomTextStyles.Body3(CustomColors.gray40)
                        ),
                        TextField(
                          style: CustomTextStyles.Title2(CustomColors.white),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CustomColors.yellow, width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CustomColors.yellow, width: 2),
                            ),
                            hintStyle: CustomTextStyles.Title2(CustomColors.gray30),
                            hintText: '코멘트 입력 (30자)',
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                TextButton(style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0, left: 0, right: 0, bottom: 0,
                            child: Container(color: CustomColors.yellowLight)
                        ),
                        Positioned(
                            top: 6, left: 0, right: 0, bottom: 0,
                            child: Container(color: CustomColors.yellow)
                        ),
                        Container(
                          height: 56,
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('완료', style: CustomTextStyles.Title3(CustomColors.black))
                            ],
                          ),
                        )
                      ],
                    ),
                    onPressed: () {},
                )
              ]
          )
      );
  }
}