import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:poorlex/controller/image_picker.dart';
import 'package:poorlex/widget/common/date_picker/common_date_picker.dart';
import 'package:poorlex/widget/common/dialog/common_alert.dart';
import 'package:poorlex/widget/common/icon.dart';
import 'package:poorlex/widget/common/other.dart';
import 'package:poorlex/widget/common/form.dart';
import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/libs/time.dart';
import 'package:poorlex/controller/user.dart';

class CreateMyExpensePage extends StatefulWidget {
  const CreateMyExpensePage({super.key});

  @override
  State<CreateMyExpensePage> createState() => _CreateMyExpensePageState();
}

class _CreateMyExpensePageState extends State<CreateMyExpensePage> {
  final _userController = Get.find<UserController>();
  late final _priceController = TextEditingController()
    ..addListener(() {
      _priceControllerListener();
    });

  void _priceControllerListener() {
    String currentText = _priceController.text;
    String newText = _formatNumber(currentText);
    if (currentText != newText) {
      _priceController.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length - 1),
      );
    }
    setState(() {});
  }

  /// 숫자 외의 모든 문자를 제거하고 포맷팅
  String _formatNumber(String value) {
    String onlyNumbers = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (onlyNumbers.isEmpty) {
      return '';
    }
    final formatter = NumberFormat('#,###');
    String formatted = formatter.format(int.parse(onlyNumbers));
    return '$formatted원';
  }

  late final _descriptionController = TextEditingController()
    ..addListener(() {
      setState(() {});
    });

  int _day = DateTime.now().millisecondsSinceEpoch;
  late XFile? _mainImage = null;
  late XFile? _subImage = null;

  void selectDay(int d) {
    setState(() {
      _day = d;
    });
  }

  List<Widget> createImageWidget() {
    List<Widget> list = [];
    if (_mainImage != null) {
      list.add(
        Stack(
          children: [
            BackgroundImageWithRemove(
              image: Image.file(File(_mainImage!.path)),
              width: 80,
              height: 80,
              onRemove: () {
                _mainImage = null;
                setState(() {});
              },
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 38,
                height: 16,
                color: CColors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "대표",
                      style: CTextStyles.Caption1(color: CColors.black),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      list.add(AddImageButton(
        label: '대표',
        width: 80,
        height: 80,
        onAdd: () => pickImage('mainImage'),
      ));
    }
    if (_subImage != null) {
      list.add(
        BackgroundImageWithRemove(
          image: Image.file(File(_subImage!.path)),
          width: 80,
          height: 80,
          onRemove: () {
            _subImage = null;
            setState(() {});
          },
        ),
      );
    } else {
      list.add(AddImageButton(
        width: 80,
        height: 80,
        onAdd: () => pickImage('subImage'),
      ));
    }
    return list;
  }

  Future<void> pickImage(String type) async {
    XFile? image = await Get.find<ImagePickerController>().getImage();
    setState(() {
      if (type == 'mainImage')
        _mainImage = image;
      else if (type == 'subImage') _subImage = image;
    });
  }

  Future<void> _submit() async {
    if (_priceController.text == '') {
      await commonAlert(context: context, message: '금액을 입력해주세요');
    } else if (_descriptionController.text == '') {
      await commonAlert(context: context, message: '메모를 입력해주세요');
    } else if (_mainImage == null) {
      await commonAlert(context: context, message: '대표 사진을 선택해주세요');
    } else {
      final result = await _userController.uploadExpenditure(
        price:
            int.parse(_priceController.text.replaceAll(RegExp(r'[^0-9]'), '')),
        description: _descriptionController.text,
        date: DateTime.fromMillisecondsSinceEpoch(_day),
        mainImage: _mainImage!,
        subImage: _subImage,
      );
      if (result == false) {
        /// [REFACTOR] 생성 실패에 대한 알럿을 사용자한테 보여줘야 합니다.
        return await commonAlert(
          context: context,
          message: "지출 추가 실패",
          buttonText: "확인",
        );
      }
      Get.back();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _userController.expenditureClear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: _appBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 44),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 2), // 원하는 마진 값으로 조정
                      child: Text(
                        '오늘은 ',
                        style: CTextStyles.Title1(color: CColors.yellow),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CTextField(
                  keyType: TextInputType.number,
                  controller: _priceController,
                  placeholder: '금액 입력',
                  hintStyle: CTextStyles.LargeTitle(color: CColors.gray40),
                  textStyle: CTextStyles.LargeTitle(color: CColors.yellow),
                  color: CColors.yellow,
                  primaryColor: CColors.yellow,
                  underlineWidth: 2.0,
                  suffix: _priceController.text.isNotEmpty
                      ? Image.asset('assets/poorlex.png')
                      : null,
                  suffixHeight: 30,
                ),
                SizedBox(height: 46),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        '지출 일자',
                        style: CTextStyles.Body2(color: CColors.gray50),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => CommonDatePicker.show(
                          context: context,
                          onChangeDate: selectDay,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              cTimeFormat(_day, 'yyyy.MM.dd (E)'),
                              style: CTextStyles.Body2(),
                            ),
                            CIcon(
                              icon: 'arrow-game-right',
                              width: 22,
                              height: 22,
                              color: CColors.gray40Str,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('메모', style: CTextStyles.Body2(color: CColors.gray50)),
                  ],
                ),
                SizedBox(height: 8),
                CTextField(
                  maxLines: 8,
                  maxLength: 300,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  isUnderline: false,
                  keyType: TextInputType.multiline,
                  backgroundColor: CColors.gray10,
                  textStyle: CTextStyles.Body2(),
                  placeholder: '내용을 입력해주세요',
                  primaryColor: CColors.yellow,
                  controller: _descriptionController,
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('인증 사진',
                            style: CTextStyles.Body2(color: CColors.gray50)),
                      ],
                    ),
                    SizedBox(height: 30),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 14,
                      runSpacing: 14,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      children: createImageWidget(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            iconSize: 26,
            icon: CIcon(
                icon: 'close', width: 26, height: 26, color: CColors.whiteStr),
            onPressed: () => Get.close(0),
          ),
          Text('지출 입력하기', style: CTextStyles.Headline()),
          SizedBox(width: 26)
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    final bottomPaddingForIos = Platform.isIOS ? 8 : 0;
    final bottomOffset =
        MediaQuery.of(context).padding.bottom + bottomPaddingForIos;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomOffset),
      child: CButton(
        type: ButtonTypes.elevated,
        color: CColors.yellow,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text('완료', style: TextStyle(fontSize: 20, color: CColors.black)),
        onPressed: () => _submit(),
      ),
    );
  }
}
