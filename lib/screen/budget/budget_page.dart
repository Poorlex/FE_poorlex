import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:poorlex/libs/theme.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  bool _isDefaultText = false;
  // var battlePeriod = "2023.07.24 - 2023.07.31";

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  late var moneyValues;

  @override
  void initState() {
    super.initState();
    _controller.text = "금액 입력";

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        if (_controller.text == "금액 입력") {
          setState(() {
            _controller.text = "원";
            _isDefaultText = true;
          });
        }
      } else {
        if (_controller.text == "원" || _controller.text.isEmpty) {
          setState(() {
            _controller.text = "금액 입력";
            _isDefaultText = false;
          });
        }
      }
    });
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
                  // SizedBox(height: 18),
                  // Text(
                  //   "배틀 기간: $battlePeriod",
                  //   style: CTextStyles.Caption1(color: CColors.gray41),
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  Stack(
                    children: <Widget>[
                      // TODO: 현재 텍스트 입력으로 구현. 유진님의 커스텀 키패드 전달받으면 적용예정!
                      TextField(
                        focusNode: _focusNode,
                        controller: _controller,
                        onChanged: (value) {
                          moneyValues = value.replaceAll("원", "");

                          // 값을 "원" 앞에 추가
                          setState(() {
                            _controller.text = "$moneyValues원";
                            _controller.selection = TextSelection.fromPosition(
                              TextPosition(offset: _controller.text.length - 1),
                            ); // 커서를 "원" 앞에 위치시킴
                          });
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style: TextStyle(
                            color: _isDefaultText
                                ? CColors.yellow
                                : CColors.gray30,
                            fontSize: 32),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: CColors.yellow),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: CColors.yellow),
                          ),
                          hintText: _focusNode.hasFocus ? '' : '금액 입력',
                          hintStyle:
                              CTextStyles.LargeTitle(color: CColors.gray30),
                        ),
                      ),

                      // 포커스 되었을 때만 이미지 표시
                      if (_focusNode.hasFocus)
                        Positioned(
                          width: 122,
                          right: 5, // 원하는 위치로 조절
                          top: 15, // 원하는 위치로 조절
                          child: Image.asset('assets/poorlex.png'),
                        ),
                    ],
                  )
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
                    Navigator.pop(context, moneyValues);
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
