import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/Models/Common.dart';

import 'package:poorlex/Models/User.dart';

import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Common/Picker.dart';
import 'package:poorlex/Widget/Common/Other.dart';
import 'package:poorlex/Widget/Common/Form.dart';
import 'package:poorlex/Widget/Common/Buttons.dart';
import 'package:poorlex/Widget/Layout.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Libs/Time.dart';

import 'package:poorlex/Controller/User.dart';
import 'package:poorlex/Controller/Layout.dart';

class MyExpenseInputPage extends StatefulWidget {
  const MyExpenseInputPage({super.key});

  @override
  State<MyExpenseInputPage> createState() => _MyExpenseInputPageState();
}

class _MyExpenseInputPageState extends State<MyExpenseInputPage> {
  final layout = Get.find<LayoutController>();
  final user = Get.find<UserController>();
  final price = TextEditingController();
  final description = TextEditingController();
  int day = DateTime.now().millisecondsSinceEpoch;
  late XFile? mainImage = null;
  late XFile? subImage = null;
  late String? originMainImage = null;
  late String? originSubImage = null;
  int size = 0;
  int imgMaxCount = 2;

  void selectDay(int d) {
    setState(() {
      day = d;
    });
  }

  void getExpenditure() async {
    if (Get.arguments?['id'] != null) {
      var expenditure = await user.getExpenditure(Get.arguments['id']);
      if (expenditure.id != null) {
        price.text = expenditure.amount.toString();
        description.text = expenditure.description.toString();
        print(expenditure.mainImageUrl);
        originMainImage = expenditure.mainImageUrl;
        originSubImage = expenditure.subImageUrl;
      }
    }
  }

  List<Widget> createImageWidget () {
    List<Widget> list = [];
    if (mainImage != null || originMainImage != null) {
      list.add(BackgroundImageWithRemove(
          image: mainImage == null ? Image.network(originMainImage!) : Image.file(File(mainImage!.path)),
          width: 80,
          height: 80,
          onRemove: () => {
            setState(() {
              mainImage = null;
              originMainImage = null;
            })
          }));
    } else {
      list.add(AddImageButton(
        width: 80,
        height: 80,
        onAdd: () => pickImage('mainImage'),
      ));
    }
    if (subImage != null || originSubImage != null) {
      list.add(BackgroundImageWithRemove(
          image: subImage == null ? Image.network(originSubImage!) : Image.file(File(subImage!.path)),
          width: 80,
          height: 80,
          onRemove: () => {
            setState(() {
              subImage = null;
              originSubImage = null;
            })
          }));
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
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (type == 'mainImage') mainImage = image;
        else if (type == 'subImage') subImage = image;
      });
  }

  void submit() async {
    if (price.text == '') {
      layout.setAlert(Alert(
          isOpen: true, body: Text('금액을 입력해주세요', style: CTextStyles.Title3())));
    } else if (description == '') {
      layout.setAlert(Alert(
          isOpen: true, body: Text('메모를 입력해주세요', style: CTextStyles.Title3())));
    } else if (mainImage == null) {
      layout.setAlert(Alert(
          isOpen: true, body: Text('대표 사진을 선택해주세요', style: CTextStyles.Title3())));
    } else {
      layout.setIsLoading(true);
      if (await user.uploadExpenditure(
          id: Get.arguments?['id'],
          price: price.text,
          description: description.text,
          day: day,
          mainImage: mainImage,
          subImage: subImage)) {
        Get.close(0);
      }
      layout.setIsLoading(false);
    }
  }

  @override
  void initState() {
    super.initState();
    getExpenditure();
    price.addListener(() {
      setState(() {
        size = price.text.length;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    user.expenditure.value = Expenditure();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                iconSize: 26,
                icon: CIcon(
                    icon: 'close',
                    width: 26,
                    height: 26,
                    color: CColors.whiteStr),
                onPressed: () => Get.close(0),
              ),
              Text('지출 입력하기', style: CTextStyles.Headline()),
              SizedBox(width: 26)
            ],
          ),
        ),
        body: Layout(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Column(
                          children: [
                            SizedBox(height: 76),
                            Row(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 2), // 원하는 마진 값으로 조정
                                  child: Text(
                                    '오늘은 ',
                                    style: CTextStyles.Title1(
                                        color: CColors.yellow),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            CTextField(
                              keyType: TextInputType.number,
                              controller: price,
                              placeholder: '금액 입력',
                              hintStyle:
                                  CTextStyles.LargeTitle(color: CColors.gray40),
                              textStyle:
                                  CTextStyles.LargeTitle(color: CColors.yellow),
                              color: CColors.yellow,
                              primaryColor: CColors.yellow,
                              underlineWidth: 2.0,
                              suffix: size > 0
                                  ? Image.asset('assets/poorlex.png')
                                  : null,
                              suffixHeight: 30,
                            ),
                            SizedBox(height: 46),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 80,
                                          child: Text('지출 일자',
                                              style: CTextStyles.Body2(
                                                  color: CColors.gray50)),
                                        ),
                                        SizedBox(width: 30),
                                        Text(CTimeFormat(day, 'yyyy.MM.dd (E)'),
                                            style: CTextStyles.Body2()),
                                      ]),
                                  Picker(
                                      current: day,
                                      type: 'DAY',
                                      select: selectDay,
                                      child: CIcon(
                                          icon: 'arrow-circle-down',
                                          width: 16,
                                          height: 16,
                                          color: CColors.yellowStr)),
                                ]),
                            SizedBox(height: 10),
                            Container(height: 1, color: CColors.gray20),
                            SizedBox(height: 10),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 80,
                                      child: Text('메모',
                                          style: CTextStyles.Body2(
                                              color: CColors.gray50))),
                                  SizedBox(width: 30),
                                  Flexible(
                                      flex: 1,
                                      child: CTextField(
                                          controller: description,
                                          placeholder: '입력하세요',
                                          isUnderline: false,
                                          primaryColor: CColors.yellow,
                                          hintStyle: CTextStyles.Body2(
                                              color: CColors.gray41)))
                                ]),
                            SizedBox(height: 10),
                            Container(height: 1, color: CColors.gray20),
                            SizedBox(height: 10),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('인증 사진',
                                            style: CTextStyles.Body2(
                                                color: CColors.gray50)),
                                        IconButton(
                                          icon: CIcon(
                                              icon: 'arrow-circle-down',
                                              width: 16,
                                              height: 16,
                                              color: CColors.yellowStr),
                                          style: IconButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: Size.zero),
                                          onPressed: () {},
                                        ),
                                      ]),
                                  SizedBox(height: 30),
                                  Wrap(
                                      direction: Axis.horizontal,
                                      spacing: 14,
                                      runSpacing: 14,
                                      alignment: WrapAlignment.start,
                                      runAlignment: WrapAlignment.start,
                                      children: createImageWidget())
                                ])
                          ],
                        ))),
              ),
              CButton(
                type: ButtonTypes.elevated,
                color: CColors.yellow,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text('완료',
                    style: TextStyle(fontSize: 20, color: CColors.black)),
                onPressed: () => submit(),
              ),
            ])));
  }
}
