import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const ExpenditureInputPage());
}

class ExpenditureInputPage extends StatelessWidget {
  const ExpenditureInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        body: ListView(children: [
          Expanding(),
        ]),
      ),
    );
  }
}

class Expanding extends StatefulWidget {
  @override
  _MyExpandingState createState() => _MyExpandingState();
}

class _MyExpandingState extends State<Expanding> {
  XFile? _image; // 추가: 이미지 변수

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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top:13, bottom:2),
          child: Text(
            '지출 입력하기',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'NeoDunggeunmoPro-Regular',
            ),
          ),
        ),
        SizedBox(height: 76), // 추가적인 여백을 위한 SizedBox
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 2), // 원하는 마진 값으로 조정
              child: Text(
                '오늘은 ',
                style: TextStyle(
                  color: Color(0xFFFFD600),
                  fontSize: 24,
                  fontFamily: 'NeoDunggeunmoPro-Regular',
                ),
              ),
            ),
          ],
        ),
        // 금액 입력
        Container(
          margin: EdgeInsets.only(left: 2, top: 8),
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 58,
                child: Container(
                  width: 368,
                  height: 2,
                  decoration: BoxDecoration(color: Color(0xFFFFD600)),
                ),
              ),
              Positioned(
                left: 320,
                top: 30,
                child: Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(color: Color(0xFF090909)),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 343,
                  height: 58,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 343,
                          height: 58,
                          decoration: BoxDecoration(color: Color(0xFF090909)),
                        ),
                      ),
                      Positioned(
                        left: 4,
                        top: 14,
                        child: Text(
                          '금액 입력',
                          style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 32,
                          fontFamily: 'NeoDunggeunmoPro-Regular',
                          fontWeight: FontWeight.w400,
                          height: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 52), // 추가적인 여백을 위한 SizedBox
        // 지출 일자
        Container(
          width: 343,
          height: 65,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(color: Color(0xFF090909)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 70,
                            height: 16,
                            child: Text(
                              '지출 일자',
                              style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontSize: 15,
                                fontFamily: 'NeoDunggeunmoPro-Regular',
                                fontWeight: FontWeight.w400,
                                height: 1.07,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          SizedBox(
                            width: 196.79,
                            height: 16,
                            child: Text(
                              '2023.07.28 (금)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'NeoDunggeunmoPro-Regular',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      width: 16,
                      height: 16,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFD600),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 343,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFF1A1A1A)),
              ),
            ],
          ),
        ),
        // 메모
        Container(
          width: 343,
          height: 71,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 343,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(color: Color(0xFF090909)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 16,
                                  child: Text(
                                    '메모',
                                    style: TextStyle(
                                      color: Color(0xFFCCCCCC),
                                      fontSize: 15,
                                      fontFamily: 'NeoDunggeunmoPro-regular',
                                      fontWeight: FontWeight.w400,
                                      height: 1.07,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 46),
                                SizedBox(
                                  width: 210,
                                  child: Opacity(
                                    opacity: 0.90,
                                    child: Text(
                                      '입력하세요',
                                      style: TextStyle(
                                        color: Color(0xFF8C8C8C),
                                        fontSize: 16,
                                        fontFamily: 'NeoDunggeunmoPro-regular',
                                        fontWeight: FontWeight.w400,
                                        height: 1.38,
                                        letterSpacing: -0.16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 21),
                          Container(
                            width: 16,
                            height: 16,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Opacity(
                                    opacity: 0.20,
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(color: Color(0x00FF0000)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 343,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFF1A1A1A)),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        // 인증 사진
        Container(
          width: 343,
          height: 16,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 2,
                child: SizedBox(
                  width: 112,
                  height: 14,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '인증 사진',
                          style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 14,
                            fontFamily: 'NeoDunggeunmoPro-regular',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                        TextSpan(
                          text: '  ',
                          style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 14,
                            fontFamily: 'NeoDunggeunmoPro-regular',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 327,
                top: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 16,
                          height: 16,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFFD600),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 16,
                          height: 16,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF666666),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // 이미지 추가 칸
        SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(left: 12),
            width: 80,
            height: 80,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(color: Color(0xFF333333)),
                  ),
                ),
                Positioned(
                  left: 28.75,
                  top: 28.75,
                  child: Container(
                    width: 22.50,
                    height: 22.50,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 10.80,
                          child: Container(
                            width: 22.50,
                            height: 1.88,
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        ),
                        Positioned(
                          left: 11.70,
                          top: 0,
                          child: Transform(
                            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                            child: Container(
                              width: 22.50,
                              height: 1.88,
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 이미지 피커
                Positioned(
                  left: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: _pickImage, // 이미지 피커 실행
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.transparent,
                      child: _image != null
                          ? Image.file(
                              File(_image!.path),
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}