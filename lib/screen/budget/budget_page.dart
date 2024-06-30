import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:poorlex/controller/audio_controller.dart';
import 'package:poorlex/controller/weekly_budgets.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/screen/home/home.dart';
import 'package:poorlex/widget/common/dialog/common_alert.dart';
import 'package:poorlex/widget/common/form.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  final _weeklyBudgetsController = Get.find<WeeklyBudgetsController>();
  late final budget = _weeklyBudgetsController.weeklyBudget;

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

  Future<void> _submit() async {
    int price = int.parse(
        _priceController.text.replaceAll('원', '').replaceAll(',', ''));

    if (_priceController.text.isEmpty) {
      await commonAlert(context: context, message: '금액을 입력해주세요');
    } else if (price > 9999999) {
      await commonAlert(
        context: context,
        message: "0 ~ 9,999,999원 이내로 입력해주세요.",
        buttonText: "확인",
      );
    } else {
      bool result;

      // [POST] 예산이 없을 때
      if (budget.exist == false) {
        result = await _weeklyBudgetsController.postCreateWeeklyBudgets(
          budget: price,
        );
      }
      // [PUT] 예산이 있을 떄
      else {
        result = await _weeklyBudgetsController.putCreateWeeklyBudgets(
          budget: price,
        );
      }

      if (result == false) {
        return await commonAlert(
          context: context,
          message: "0 ~ 9,999,999원 이내로 입력해주세요.",
          buttonText: "확인",
        );
      }

      await _weeklyBudgetsController.getWeeklyBudgets();
      await _weeklyBudgetsController.getLeftWeeklyBudgets();
      await AudioController().play(audioType: AudioType.complete);

      // 성공 시 Main 페이지의 showSuccessImage 메서드 호출
      Get.find<MainController>().displaySuccessImage();

      Get.back();
    }
  }

  @override
  void dispose() {
    _priceController.dispose();
    _weeklyBudgetsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.black,
      appBar: AppBar(
        backgroundColor: CColors.black,
        // 뒤로 가기 버튼 제거
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 26,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset('assets/budget_page/icon_cancel.png'),
            ),
            Center(
              child: Text(
                "예산 설정하기",
                style: CTextStyles.Headline(),
              ),
            ),
            SizedBox(
              width: 26,
              height: 26,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 34, bottom: 42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "배틀을 시작하기 위해\n일주일 동안 사용할 예산을\n설정해 주세요.",
                    style: CTextStyles.Title1(height: 1.5),
                  ),
                  SizedBox(
                    height: 52,
                  ),
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
                ],
              ),
            ),

            // 완료 버튼
            /// [TODO] 공용 위젯 분리 필요
            Container(
              width: double.infinity,
              height: 52,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: CColors.yellow,
                  border: Border(
                    top: BorderSide(color: CColors.yellowLight, width: 4),
                  ),
                ),
                child: TextButton(
                  child: Text(
                    '완료',
                    style: CTextStyles.Title3(color: CColors.black),
                  ),
                  onPressed: () {
                    _submit();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
