import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/audio_controller.dart';
import 'package:poorlex/widget/common/dialog/common_alert.dart';
import 'package:poorlex/widget/common/form.dart';

import 'package:poorlex/widget/common/icon.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/libs/string.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/widget/common/buttons.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final _userController = Get.find<UserController>();

  late final _nameController = TextEditingController(
    text: _userController.userInfo?.nickname ?? '',
  )..addListener(() {
      checkIsReady();
    });
  late final _description = TextEditingController(
    text: _userController.userInfo?.description ?? '',
  )..addListener(() {
      checkIsReady();
    });
  bool _isReady = false;
  bool _isReadyName = true;

  void checkIsReady() {
    bool tmp = true;
    if (checkRegex('nickname', _nameController.text.trim())) {
      _isReadyName = true;
    } else {
      tmp = false;
      _isReadyName = false;
    }

    if (_description.text.trim().length == 0) {
      tmp = false;
    }
    _isReady = tmp;
    setState(() {});
  }

  Future<void> submit(BuildContext context) async {
    if (!_isReady) {
      String message = '';
      if (!_isReadyName)
        message = '이름을 확인해주세요';
      else
        message = '소개를 확인해주세요';

      await commonAlert(context: context, message: message);
    } else {
      await _userController.patchProfile(
        nickname: _nameController.text.trim(),
        description: _description.text.trim(),
      );
      await AudioController().play(audioType: AudioType.complete);
      Get.back();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPaddingForIos = Platform.isIOS ? 8 : 0;
    final bottomOffset =
        MediaQuery.of(context).padding.bottom + bottomPaddingForIos;

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
      body: Column(
        children: [
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
                          color: _isReadyName ? CColors.white : CColors.gray30),
                      controller: _nameController,
                    ),
                    (_isReadyName
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
                      controller: _description,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: bottomOffset),
        child: Row(
          children: [
            Expanded(
              child: CButtonConfirm(
                disabled: !_isReady,
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
                              style: CTextStyles.Title3(color: CColors.black),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onPressed: () => submit(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
