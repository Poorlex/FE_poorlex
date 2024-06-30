import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/widget/common/icon.dart';
import 'package:poorlex/libs/time.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/libs/string.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/widget/common/image/image_network.dart';

class MyExpenseDetailPage extends StatefulWidget {
  const MyExpenseDetailPage({
    super.key,
  });

  @override
  State<MyExpenseDetailPage> createState() => _MyExpenseDetailPageState();
}

class _MyExpenseDetailPageState extends State<MyExpenseDetailPage> {
  late final String? _expenseId = Get.parameters["expenseId"];
  final _userController = Get.find<UserController>();

  void _getExpenditure() async {
    if (_expenseId != null) {
      await _userController.getExpenditureById(int.parse(_expenseId!));
    }
  }

  Future<void> _onClickOption(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: CColors.black,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return OptionButtonModal();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getExpenditure();
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
              onPressed: () => Navigator.of(context).pop(),
            ),
            Obx(() {
              if (_userController.expenditure?.id == null)
                return SizedBox(width: 20);
              else
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          cTimeFormat(
                              DateTime.parse(
                                      '${_userController.expenditure!.date} 00:00:00')
                                  .millisecondsSinceEpoch,
                              'yyyy.MM.dd (E)'),
                          style: CTextStyles.Caption1(color: CColors.gray50)),
                      SizedBox(height: 6),
                      Text('${makeComma(_userController.expenditure!.amount)}원',
                          style: CTextStyles.Headline()),
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
              onPressed: () => _onClickOption(context),
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
                  if (_userController.expenditure?.description == null)
                    return SizedBox.shrink();
                  else
                    return Text(_userController.expenditure!.description,
                        style: CTextStyles.Body2());
                }),
                SizedBox(height: 24),
                Obx(() {
                  if (_userController.expenditure?.mainImageUrl != null) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: SizedBox(
                                child: Image.network(
                                    _userController.expenditure!.mainImageUrl)),
                          )
                        ]);
                  } else
                    return SizedBox(height: 20);
                }),
                SizedBox(height: 24),
                Obx(() {
                  if (_userController.expenditure?.subImageUrl != null) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: CImageNetwork(
                              src: _userController.expenditure?.subImageUrl,
                            ),
                          )
                        ]);
                  } else
                    return SizedBox.shrink();
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
  final _userController = Get.find<UserController>();

  OptionButtonModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await Get.toNamed(
                    '/my/expense/edit/${_userController.expenditure?.id}');
                _userController.getExpenditureById(
                  _userController.expenditure!.id,
                );
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('수정', style: CTextStyles.Headline(color: CColors.yellow))
              ]),
            )),
            Expanded(
                child: TextButton(
              onPressed: () async {
                Get.back();
                await _userController
                    .removeExpenditure(_userController.expenditure!.id);
                Get.back();
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('삭제', style: CTextStyles.Headline(color: CColors.gray30))
              ]),
            )),
          ],
        ),
      ),
    );
  }
}
