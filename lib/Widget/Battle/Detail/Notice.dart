import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:poorlex/Libs/Theme.dart';

import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Common/User.dart';
import 'package:poorlex/Widget/Common/Modal.dart';

class NoticeWriteModal extends CustomModal {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  NoticeWriteModal({
    int? id
  }) {
    if (id != null) getData(id);
    else setChild();
  }

  getData(int id) {
    Timer(Duration(seconds: 1), () {
      setChild();
      changedExternalState();
    });
  }

  Future<void> pickImage() async {
    final List<XFile> images = await picker.pickMultiImage();
    if (images != null) {
      setState(() {
        image = images[0];
      });
    }
  }

  setChild() {
    child = (BuildContext context) => Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () => Navigator.pop(context), icon: CustomIcon(icon: 'arrow-left', color: CustomColors.whiteStr)),
                Text('공지 등록', style: TextStyle(color: CustomColors.white, fontSize: 18)),
                SizedBox(width: 55)
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(19, 26, 19, 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('배틀 멤버에게\n알리고 싶은 내용이 있나요?', style: TextStyle(color: CustomColors.white, fontSize: 22)),
                      SizedBox(height: 27),
                      Text('공지 내용', style: TextStyle(color: CustomColors.gray40, fontSize: 14)),
                      SizedBox(height: 17),
                      Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)
                          ),
                          color: CustomColors.gray10,
                          child: Stack(
                            children: [
                              Positioned(
                                  right: 10, bottom: 4,
                                  child: Text('0/200', style: TextStyle(fontSize: 20.0, color: CustomColors.gray30))
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(14, 10, 14, 30),
                                child: TextField(
                                  maxLines: 8, //or null
                                  decoration: InputDecoration.collapsed(
                                    hintText: "내용을 입력해주세요",
                                    hintStyle: TextStyle(fontSize: 20.0, color: CustomColors.gray30),
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      SizedBox(height: 37),
                      Text('사진 추가', style: TextStyle(color: CustomColors.gray40, fontSize: 14)),
                      SizedBox(height: 17),
                      ElevatedButton(
                          onPressed: () => pickImage(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.gray10,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                          ),
                          child: Container(
                            width: 93, height: 93,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomIcon(icon: 'plus', width: 29, height: 29, color: CustomColors.gray40Str)
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                )
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
                        Text('공지생성', style: TextStyle(fontSize: 20, color: CustomColors.black))
                      ],
                    ),
                  )
                ],
              )
            )
          ],
        )
    );
  }
}

class NoticeDetailModal extends CustomModal {
  NoticeDetailModal() {
    getData();
  }

  Function onClickOption = (BuildContext context) {
    Function selectOption = (String mode, int id) {
      print(mode);
      print(id);
    };
    showModalBottomSheet(
      context: context,
      backgroundColor: CustomColors.black,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return OptionButtonModal(selectOption: selectOption);
      }
    );
  };

  getData() {
    Timer(Duration(seconds: 1), () {
        child = (BuildContext context) => Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () => Navigator.pop(context), icon: CustomIcon(icon: 'arrow-left', color: CustomColors.whiteStr)),
                    Text('공지상세', style: TextStyle(color: CustomColors.white, fontSize: 18)),
                    IconButton(onPressed: () => onClickOption(context), icon: CustomIcon(icon: 'option', color: CustomColors.whiteStr)),
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
                                  Text('09월 11일 오후 3:00', style: TextStyle(color: CustomColors.white)),
                                  SizedBox(width: 8),
                                  Text('•', style: TextStyle(color: CustomColors.white)),
                                  SizedBox(width: 8),
                                  CustomIcon(icon: 'eye', color: CustomColors.purpleLightStr, width: 12, height: 8),
                                  SizedBox(width: 4),
                                  Text('1명 읽음', style: TextStyle(color: CustomColors.purpleLight)),
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
                            color: CustomColors.gray10,
                            child: Text('''드디어 시작!!!
<<우리방규칙>>
✅ 채팅으로 출석 : 동기부여를 꼬옥 붙잡기위함
✅ 피드백 잊지않고 해주기 : 투표나 채팅시 서로 반응 꼭 해줘요..
                            ''', style: TextStyle(color: CustomColors.white)),
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
                                    child: Text('화이팅!!', style: TextStyle(color: CustomColors.white)),
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
                                    child: Text('화이팅!!', style: TextStyle(color: CustomColors.white)),
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
                                    child: Text('화이팅!!', style: TextStyle(color: CustomColors.white)),
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
                          style: TextStyle(fontSize: 16.0, color: CustomColors.gray50),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(fontSize: 16.0, color: CustomColors.gray50),
                            hintText: '댓글을 입력하세요',
                            fillColor: CustomColors.gray20
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

class OptionButtonModal extends StatelessWidget {
  Function selectOption;
  OptionButtonModal({
    super.key,
    required this.selectOption
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 164,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: TextButton(
                    onPressed: () => print(1111),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('수정', style: TextStyle(color: CustomColors.white, fontSize: 18))
                        ]
                    ),
                  )
              ),
              Expanded(
                  child: TextButton(
                    onPressed: () => print(1111),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('삭제', style: TextStyle(color: CustomColors.gray30, fontSize: 18))
                        ]
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }
}


