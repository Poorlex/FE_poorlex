import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/Models/Common.dart';
import 'package:poorlex/Widget/Common/Form.dart';

import 'package:poorlex/Widget/Common/Icon.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Libs/String.dart';
import 'package:poorlex/Controller/User.dart';
import 'package:poorlex/Controller/Layout.dart';

import 'package:poorlex/Widget/Common/Buttons.dart';

import 'package:poorlex/Widget/Layout.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final layout = Get.find<LayoutController>();
  final user = Get.find<UserController>();
  final name = TextEditingController();
  final description = TextEditingController();
  bool isReady = false;
  bool isReadyName = true;

  onChange() {
    setState(() {
      bool tmp = true;
      if (checkRegex('nickname', name.text.trim())) {
        isReadyName = true;
      } else {
        tmp = false;
        isReadyName = false;
      }
      if (description.text.trim().length == 0) tmp = false;
      isReady = tmp;
    });
  }

  submit(BuildContext context) async {
    if (!isReady) {
      String message = '';
      if (!isReadyName)
        message = '이름을 확인해주세요';
      else
        message = '소개를 확인해주세요';
      layout.setAlert(Alert(isOpen: true, body: Text(message, style: CTextStyles.Headline(color: CColors.gray50))));
    } else {
      layout.setIsLoading(true);
      if (await user.patchProfile(
          nicknme: name.text.trim(), description: description.text.trim())) {
        Get.close(0);
      }
      layout.setIsLoading(false);
    }
  }

  @override
  void initState() {
    super.initState();
    name.text = user.userInfo.value.nickname ?? '';
    description.text = user.userInfo.value.description ?? '';
    name.addListener(onChange);
    description.addListener(onChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CColors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CColors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                iconSize: 26,
                style: IconButton.styleFrom(
                    padding: EdgeInsets.zero, minimumSize: Size.zero),
                icon: CIcon(
                    icon: 'arrow-left',
                    width: 26,
                    height: 26,
                    color: CColors.whiteStr),
                onPressed: () => Get.back(),
              ),
              Text('프로필 편집', style: CTextStyles.Headline()),
              SizedBox(width: 26)
            ],
          ),
        ),
        body: Layout(
            child: Column(children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 34, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CTextField(
                        maxLines: 1,
                        label: '이름',
                        isClose: true,
                        padding: EdgeInsets.all(0),
                        placeholder: '이름을 입력해주세요',
                        primaryColor: CColors.yellow,
                        textStyle: CTextStyles.Title3(
                            color:
                                isReadyName ? CColors.white : CColors.gray30),
                        controller: name),
                    (isReadyName
                        ? SizedBox.shrink()
                        : Column(children: [
                            SizedBox(height: 6),
                            Text('영문자, 숫자와 특수기호(-, _) 포함하여 최소 2자 이상 최대 20자',
                                style:
                                    CTextStyles.Caption1(color: CColors.purple))
                          ])),
                    SizedBox(height: 30),
                    CTextField(
                        label: '내 소개',
                        maxLines: 8,
                        maxLength: 300,
                        padding: EdgeInsets.all(10),
                        isUnderline: false,
                        keyType: TextInputType.multiline,
                        backgroundColor: CColors.gray10,
                        placeholder: '내용을 입력해주세요',
                        primaryColor: CColors.yellow,
                        controller: description),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: CButton(
                      disabled: !isReady,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      type: ButtonTypes.elevated,
                      color: CColors.yellow,
                      child: Text(
                        '완료',
                        style: CTextStyles.Title3(color: CColors.black),
                      ),
                      onPressed: () => submit(context)))
            ],
          )
        ])));
  }
}
