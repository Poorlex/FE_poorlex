import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Common/BottomBar.dart';

import 'package:poorlex/Libs/Time.dart';
import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Libs/String.dart';

import 'package:poorlex/Controller/User.dart';

class MyExpenseDetailPage extends StatefulWidget {
  const MyExpenseDetailPage({super.key});

  @override
  State<MyExpenseDetailPage> createState() => _MyExpenseDetailPageState();
}

class _MyExpenseDetailPageState extends State<MyExpenseDetailPage> {
  final user = Get.find<UserController>();

  void getExpenditure() async {
    if (Get.arguments?['id'] != null) {
      await user.getExpenditure(Get.arguments['id']);
    }
  }

  Function onClickOption = (BuildContext context) {
    Function selectOption = (String mode) {
      print(mode);
    };
    showModalBottomSheet(
      context: context,
      backgroundColor: CColors.black,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return OptionButtonModal(selectOption: selectOption);
      },
    );
  };

  @override
  void initState() {
    super.initState();
    getExpenditure();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.black,
      bottomNavigationBar: BottomBar(nowPage: 4),
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
            Obx(() {
              if (user.expenditure.value == null || user.expenditure.value.id == null) return SizedBox(width: 20);
              else return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(CTimeFormat(DateTime.parse('${user.expenditure.value.date} 00:00:00').millisecondsSinceEpoch, 'yyyy.MM.dd (E)'),
                    style: CTextStyles.Caption1(color: CColors.gray50)),
                SizedBox(height: 6),
                Text('${makeComma(user.expenditure.value.amount!)}원', style: CTextStyles.Headline()),
              ]);
            }),
            IconButton(
              iconSize: 26,
              style: IconButton.styleFrom(
                  padding: EdgeInsets.zero, minimumSize: Size.zero),
              icon: CIcon(
                  icon: 'option',
                  width: 26,
                  height: 26,
                  color: CColors.whiteStr),
              onPressed: () => onClickOption(context),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 34, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  if (user.expenditure.value.description == null) return SizedBox.shrink();
                  else return Text(user.expenditure.value.description!, style: CTextStyles.Body2());
                }),
                SizedBox(height: 24),
                Obx(() {
                  if (user.expenditure.value.mainImageUrl != null) {
                    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          child: Image.network(user.expenditure.value.mainImageUrl!)
                        ),
                      )
                    ]);
                  } else return SizedBox(height: 20);
                }),
                SizedBox(height: 24),
                Obx(() {
                  if (user.expenditure.value.subImageUrl != null) {
                    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                            child: Image.network(user.expenditure.value.subImageUrl!)
                        ),
                      )
                    ]);
                  } else return SizedBox.shrink();
                }),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OptionButtonModal extends StatelessWidget {
  final user = Get.find<UserController>();
  Function selectOption;

  OptionButtonModal({super.key, required this.selectOption});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.toNamed('/my/expense-input', arguments: { 'id': user.expenditure.value.id });
                },
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('수정', style: CTextStyles.Headline(color: CColors.yellow))
                ]),
              )),
              Expanded(
                  child: TextButton(
                onPressed: () async {
                  await user.removeExpenditure(user.expenditure.value.id!);
                  Get.offAllNamed('/my');
                },
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('삭제', style: CTextStyles.Headline(color: CColors.gray30))
                ]),
              )),
            ],
          ),
        ));
  }
}
