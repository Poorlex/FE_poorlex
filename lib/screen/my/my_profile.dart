import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/models/common.dart';
import 'package:poorlex/widget/common/form.dart';

import 'package:poorlex/widget/common/icon.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/libs/string.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/controller/layout.dart';

import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/widget/layout.dart';

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

  checkIsReady() {
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
      layout.setAlert(Alert(
          isOpen: true,
          body: Text(message,
              style: CTextStyles.Headline(color: CColors.gray50))));
    } else {
      layout.setIsLoading(true);
      // if (await user.patchProfile(
      //     nickname: name.text.trim(), description: description.text.trim())) {
      //   Get.close(0);
      // }
      layout.setIsLoading(false);
    }
  }

  @override
  void initState() {
    super.initState();
    name.text = user.userInfo.value.nickname ?? '';
    description.text = user.userInfo.value.description ?? '';
    checkIsReady();
    name.addListener(checkIsReady);
    description.addListener(checkIsReady);
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
                        underlineWidth: 2,
                        padding: EdgeInsets.all(0),
                        placeholder: '이름을 입력해주세요',
                        primaryColor: CColors.yellow,
                        textStyle: CTextStyles.Title1(
                            color:
                                isReadyName ? CColors.white : CColors.gray30),
                        controller: name),
                    (isReadyName
                        ? SizedBox.shrink()
                        : Column(children: [
                            SizedBox(height: 6),
                            Text('2 ~ 15자 이내로 입력해주세요',
                                style: CTextStyles.Caption1(
                                    color: CColors.purpleLight))
                          ])),
                    SizedBox(height: 30),
                    CTextField(
                        label: '내 소개',
                        maxLines: 8,
                        maxLength: 45,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                        isUnderline: false,
                        keyType: TextInputType.multiline,
                        backgroundColor: CColors.gray10,
                        textStyle: CTextStyles.Body2(),
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
                  child: CButtonConfirm(
                      disabled: !isReady,
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 18),
                                child: Text(
                                  '완료',
                                  style:
                                      CTextStyles.Title3(color: CColors.black),
                                ),
                              )
                            ],
                          ))
                        ],
                      ),
                      onPressed: () => submit(context)))
            ],
          )
        ])));
  }
}
