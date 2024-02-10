import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:poorlex/Libs/Theme.dart';
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
              Text('배틀방의', style: TextStyle(fontSize: 22, color: CustomColors.white)),
              SizedBox(height: 10),
              Text('기본 정보를 정해볼까요?', style: TextStyle(fontSize: 22, color: Colors.white)),
            ],
          ),
        ),
      ),
      SizedBox(height: 12),
      Text('배틀방 제목', style: TextStyle(fontSize: 14, color: CustomColors.gray41)),
      SizedBox(height: 20),
      TextField(
        controller: _titleController,
        cursorColor: CustomColors.yellow,
        style: TextStyle(color: CustomColors.yellow, fontSize: 20),
        maxLength: 12,
        decoration: InputDecoration(
          hintText: '방제목 입력 (최대 12자)',
          hintStyle: TextStyle(color: CustomColors.gray41),
          iconColor: CustomColors.yellow,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.yellow, width: 2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.yellow, width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.yellow, width: 2.0),
          ),
        ),
      ),
      SizedBox(height: 20),
      Text('배틀방 사진', style: TextStyle(fontSize: 14, color: CustomColors.yellow)),
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
                color: CustomColors.gray10,
              ),
              child: Icon(Icons.add, color: CustomColors.gray41),
            ),
          );
        }
      }),
      SizedBox(height: 40),
      Text('배틀방 소개', style: TextStyle(fontSize: 14, color: CustomColors.gray41)),
      SizedBox(
        width: double.infinity,
        height: 150,
        child: TextField(
          maxLines: 9,
          controller: _contentController,
          cursorColor: CustomColors.yellow,
          style: TextStyle(color: CustomColors.yellow, fontSize: 20),
          maxLength: 200,
          decoration: InputDecoration(
            hintText: '내용을 입력해주세요',
            hintStyle: TextStyle(color: CustomColors.gray41),
            iconColor: CustomColors.yellow,
            counterText: "200",
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: CustomColors.black, width: 2.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CustomColors.black, width: 2.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CustomColors.black, width: 2.0),
            ),
          ),
        ),
      ),
    ]);
  }
}
