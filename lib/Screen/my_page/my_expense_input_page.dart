import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:poorlex/Widget/Common/icon.dart';
import 'package:poorlex/Widget/Common/picker.dart';
import 'package:poorlex/Widget/Common/other.dart';

class MyExpenseInputPage extends StatefulWidget {
  const MyExpenseInputPage({super.key});

  @override
  State<MyExpenseInputPage> createState() => _MyExpenseInputPageState();
}

class _MyExpenseInputPageState extends State<MyExpenseInputPage> {
  XFile? _image;
  final FocusNode _focusNode = FocusNode();
  bool isFocus = false;

  Future<void> _pickImage() async { // 추가: 이미지 피커 함수
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() { // 이미지가 선택되었을 때 상태 업데이트
        _image = image;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                iconSize: 26,
                icon: CustomIcon(icon: 'close', width: 26, height: 26, color: '#ffffff'),
                onPressed: () {},
              ),
              Text('지출 입력하기', style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(width: 26)
            ],
          ),
        ),
        body: SafeArea(child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(child:
              SingleChildScrollView(child:
                Container(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), child:
                  Column(
                    children: [
                      SizedBox(height: 76),
                      Row(children: [
                        Container(margin: EdgeInsets.only(left: 2), // 원하는 마진 값으로 조정
                          child:
                          Text('오늘은 ', style: TextStyle(color: Color(0xFFFFD600), fontSize: 24),
                          ),
                        ),
                      ],
                      ),
                      Stack(children: [
                        TextField(
                            focusNode: _focusNode,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            cursorColor: Color(0xffffd600),
                            style: TextStyle(color: Color(0xffffd600), fontSize: 20),
                            decoration: InputDecoration(
                              hintText: '금액 입력',
                              hintStyle: TextStyle(color: Color(0xff999999)),
                              iconColor: Color(0xffffd600),
                              border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffffd600), width: 2.0),),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffffd600), width: 2.0),),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffffd600), width: 2.0),),
                            )
                        ),
                        if (isFocus)
                          Positioned(right: 5, top: 10, child: Image.asset('assets/poorlex.png')),
                      ]),
                      SizedBox(height: 64),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                          Container(width: 80, child:
                          Text('지출 일자', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 16)),
                          ),
                          SizedBox(width: 30),
                          Text('2023.07.28 (금)', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ]),
                        Picker(type: 'DAY', select: () {}, child:
                        CustomIcon(icon: 'arrow-circle-down', width: 16, height: 16, color: '#ffd600')
                        ),
                      ]),
                      SizedBox(height: 20),
                      Container(height: 1, color: Color(0xff0A0A0A)),
                      SizedBox(height: 20),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Container(width: 80, child:
                        Text('메모', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 16))
                        ),
                        SizedBox(width: 30),
                        Flexible(flex: 1, child:
                        TextField(
                            style: TextStyle(fontSize: 14, color: Colors.white),
                            decoration: InputDecoration(
                              hintText: '입력하세요',
                              hintStyle: TextStyle(color: Color(0xff8C8C8C), fontSize: 16),
                              border: InputBorder.none,
                            )
                        )
                        )
                      ]),
                      SizedBox(height: 20),
                      Container(height: 1, color: Color(0xff0A0A0A)),
                      SizedBox(height: 20),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text('인증 사진', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 16)),
                          IconButton(icon:
                          CustomIcon(icon: 'arrow-circle-down', width: 16, height: 16, color: '#ffd600'),
                            style: IconButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                            onPressed: () {},
                          ),
                        ]),
                        SizedBox(height: 40),
                        Wrap(direction: Axis.horizontal, spacing: 14, runSpacing: 14, alignment: WrapAlignment.start, runAlignment: WrapAlignment.start, children: [
                          BackgroundImageWithRemove(image: 'assets/sample/sample2.png', width: 80, height: 80, onRemove: () {}),
                          BackgroundImageWithRemove(image: 'assets/sample/sample2.png', width: 80, height: 80, onRemove: () {}),
                          BackgroundImageWithRemove(image: 'assets/sample/sample2.png', width: 80, height: 80, onRemove: () {}),
                          BackgroundImageWithRemove(image: 'assets/sample/sample2.png', width: 80, height: 80, onRemove: () {}),
                          AddImageButton(width: 80, height: 80, onAdd: () {},)
                        ])
                      ])
                    ],
                  )
                )
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xffFFD600),fixedSize: Size.fromHeight(52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child:
                Text('완료', style: TextStyle(fontSize: 20, color: Colors.black),),
              onPressed: () {}
            )
          ])
        )
    );
  }
}
