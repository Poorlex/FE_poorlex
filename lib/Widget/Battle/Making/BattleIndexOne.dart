import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/Battle.dart';

import 'package:poorlex/Widget/Common/Form.dart';

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
              Text('배틀방의', style: CTextStyles.Title2()),
              SizedBox(height: 10),
              Text('기본 정보를 정해볼까요?', style: CTextStyles.Title2()),
            ],
          ),
        ),
      ),
      SizedBox(height: 12),
      Text('배틀방 제목', style: CTextStyles.Body3(color: CColors.gray41)),
      SizedBox(height: 20),
      TextField(
        controller: _titleController,
        cursorColor: CColors.yellow,
        style: CTextStyles.Title3(color: CColors.yellow),
        maxLength: 12,
        decoration: InputDecoration(
          hintText: '방제목 입력 (최대 12자)',
          hintStyle: CTextStyles.Title3(color: CColors.gray41),
          iconColor: CColors.yellow,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: CColors.yellow, width: 2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CColors.yellow, width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CColors.yellow, width: 2.0),
          ),
        ),
      ),
      SizedBox(height: 20),
      Text('배틀방 사진', style: CTextStyles.Body3(color: CColors.gray41)),
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
                color: CColors.gray10,
              ),
              child: Icon(Icons.add, color: CColors.gray41),
            ),
          );
        }
      }),
      SizedBox(height: 40),
      Text('배틀방 소개', style: CTextStyles.Body3(color: CColors.gray41)),
      SizedBox(height: 20),
      CTextField(
        // label: '내 소개',
          maxLines: 9,
          maxLength: 200,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          isUnderline: false,
          keyType: TextInputType.multiline,
          backgroundColor: CColors.gray10,
          textStyle: CTextStyles.Body2(),
          placeholder: '내용을 입력해주세요',
          primaryColor: CColors.yellow,
          controller: _contentController
      ),
    ]);
  }
}
