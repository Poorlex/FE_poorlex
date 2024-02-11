import 'package:flutter/material.dart';

import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Common/Modal.dart';

import 'package:poorlex/Libs/Theme.dart';

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
              IconButton(onPressed: () => Navigator.pop(context), icon: CustomIcon(icon: 'arrow-left', color: CustomColors.whiteStr)),
              Text('공지 등록', style: CustomTextStyles.Headline()),
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
                    Text('고민되는 지출\n투표를 해볼까요?', style: CustomTextStyles.Title2()),
                    SizedBox(height: 27),
                    Text('투표 내용', style: CustomTextStyles.Body3(color: CustomColors.gray40)),
                    SizedBox(height: 17),
                    TextField(
                      style: CustomTextStyles.Title2(),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: CustomColors.yellow, width: 2),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: CustomColors.yellow, width: 2),
                        ),
                        hintStyle: CustomTextStyles.Title2(color: CustomColors.gray30),
                        hintText: '투표제목 입력 (최대 12자)',
                      ),
                    ),
                    TextField(
                      style: CustomTextStyles.Title2(),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: CustomColors.yellow, width: 2),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: CustomColors.yellow, width: 2),
                        ),
                        hintStyle: CustomTextStyles.Title2(color: CustomColors.gray30),
                        hintText: '금액입력',
                      ),
                    ),
                    SizedBox(height: 27),
                    Text('투표 시간', style: CustomTextStyles.Body3(color: CustomColors.gray40)),
                    SizedBox(height: 17),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('5분', style: CustomTextStyles.Body3(color: CustomColors.gray41)),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: CustomColors.gray41, width: 1.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
                            ),
                          ),
                          SizedBox(width: 16,),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('10분', style: CustomTextStyles.Body3(color: CustomColors.gray41)),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: CustomColors.gray41, width: 1.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
                            ),
                          ),
                          SizedBox(width: 16,),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('20분', style: CustomTextStyles.Body3(color: CustomColors.gray41)),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: CustomColors.gray41, width: 1.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
                            ),
                          ),
                          SizedBox(width: 16,),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('30분', style: CustomTextStyles.Body3(color: CustomColors.gray41)),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: CustomColors.gray41, width: 1.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
                            ),
                          ),
                          SizedBox(width: 16,),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('1시간', style: CustomTextStyles.Body3(color: CustomColors.gray41)),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: CustomColors.gray41, width: 1.0),
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
                        Text('투표생성', style: CustomTextStyles.Title3(color: CustomColors.black))
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
