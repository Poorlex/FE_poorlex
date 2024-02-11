import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:poorlex/Libs/Theme.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  bool _isDefaultText = false;
  var battlePeriod = "2023.07.24 - 2023.07.31";

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
            _controller.text = "0원";
            _isDefaultText = true;
          });
        }
      } else {
        if (_controller.text == "0원" || _controller.text.isEmpty) {
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
      backgroundColor: CustomColors.black,
      appBar: AppBar(
        backgroundColor: CustomColors.black,
        automaticallyImplyLeading: false,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/budget_page/icon_cancel.png'),
              ),
            ),
            Center(
              child: Text(
                "예산 설정하기",
                style: CustomTextStyles.Headline(color: CustomColors.black),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 44),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("배틀을 시작하기 위해\n일주일 동안 사용할 예산을\n설정해 주세요.", style: CustomTextStyles.Title2()),
                    SizedBox(height: 18),
                    Text("배틀 기간: $battlePeriod", style: CustomTextStyles.Caption1(color: CustomColors.gray41)),
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
                            moneyValues = value.replaceAll("원", "").trim();

                            // 값을 "원" 앞에 추가
                            setState(() {
                              _controller.text = "$moneyValues원";
                              _controller.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: _controller.text.length -
                                          1)); // 커서를 "원" 앞에 위치시킴
                            });
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          style: TextStyle(
                              color: _isDefaultText
                                  ? CustomColors.yellow
                                  : CustomColors.gray30,
                              fontSize: 32),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CustomColors.yellow),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CustomColors.yellow),
                            ),
                            hintText: _focusNode.hasFocus ? '' : '금액 입력',
                            hintStyle: CustomTextStyles.LargeTitle(color: CustomColors.gray30)
                          ),
                        ),
                        if (_focusNode.hasFocus)
                          Positioned(
                            right: 5, // 원하는 위치로 조절
                            top: 15, // 원하는 위치로 조절
                            child:
                                Image.asset('assets/poorlex.png'),
                          ),
                      ],
                    )
                  ]),
            ),
            SizedBox(width: double.infinity, height: 50, child:
              OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: CustomColors.yellow),
                child: Text("완료", style: CustomTextStyles.Title3(color: CustomColors.black)),
                onPressed: () {
                  Navigator.pop(context, moneyValues);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
