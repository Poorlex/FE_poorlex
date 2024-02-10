import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:poorlex/Controller/Battle.dart';

class BattleIndexOne extends GetView {
  const BattleIndexOne({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _contentController = TextEditingController();

    BattleController con = Get.put(BattleController());

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Container(
          width: 300,
          height: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('배틀방의',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  )),
              SizedBox(height: 10),
              Text('기본 정보를 정해볼까요?',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
      SizedBox(height: 12),
      Text('배틀방 제목', style: TextStyle(fontSize: 14, color: Color(0xff999999))),
      SizedBox(height: 20),
      TextField(
        controller: _titleController,
        cursorColor: Color(0xffffd600),
        style: TextStyle(color: Color(0xffffd600), fontSize: 20),
        maxLength: 12,
        decoration: InputDecoration(
          hintText: '방제목 입력 (최대 12자)',
          hintStyle: TextStyle(color: Color(0xff999999)),
          iconColor: Color(0xffffd600),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffffd600), width: 2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffffd600), width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffffd600), width: 2.0),
          ),
        ),
      ),
      SizedBox(height: 20),
      Text('배틀방 사진', style: TextStyle(fontSize: 14, color: Color(0xff999999))),
      SizedBox(height: 20),
      Obx(() {
        if (con.selectedImage.value != null) {
          return Container(
              width: 100,
              height: 100,
              child: Image.file(
                File(con.selectedImage.value!.path),
              ));
        } else {
          return GestureDetector(
            onTap: () {
              con.getImage();
            },
            child: Container(
              height: 93,
              width: 93,
              decoration: BoxDecoration(
                color: Color(0xff1a1a1a),
              ),
              child: Icon(Icons.add, color: Color(0xff999999)),
            ),
          );
        }
      }),
      SizedBox(height: 40),
      Text('배틀방 소개', style: TextStyle(fontSize: 14, color: Color(0xff999999))),
      SizedBox(
        width: double.infinity,
        height: 150,
        child: TextField(
          maxLines: 9,
          controller: _contentController,
          cursorColor: Color(0xffffd600),
          style: TextStyle(color: Color(0xffffd600), fontSize: 20),
          maxLength: 200,
          decoration: InputDecoration(
            hintText: '내용을 입력해주세요',
            hintStyle: TextStyle(color: Color(0xff999999)),
            iconColor: Color(0xffffd600),
            counterText: "200",
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
          ),
        ),
      ),
    ]);
  }
}
